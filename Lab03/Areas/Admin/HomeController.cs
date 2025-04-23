using Lab03.Areas.Identity.Pages.Account;
using Lab03.Models;
using Lab03.Repositories;
using Lab03.ViewModels;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;


namespace Lab03.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HomeController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IProductRepository _productRepository;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly SignInManager<ApplicationUser> _signInManager;

        public HomeController(IProductRepository productRepository, ApplicationDbContext context, IHttpContextAccessor contextAccessor, SignInManager<ApplicationUser> signInManager)
        {
            _productRepository = productRepository;
            _context = context;
            _contextAccessor = contextAccessor;
            _signInManager = signInManager;

        }

        public async Task<IActionResult> Index()
        {

            //var products = await _productRepository.GetAllAsync();
            var productname = await _context.Products.Select(m => m.Name).ToListAsync();
            var products = await _context.Products
                .Include(p => p.Colors)
                .Include(p => p.Sizes)
                .ToListAsync();
            var session = _contextAccessor.HttpContext.Session;
            var viewmodel = new HomeViewModel
            {
                Products = products,
                nameProducts = productname,
            };
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap");
            }
            return View(viewmodel);
        }



        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
        public ActionResult DangNhap()
        {
            return View();
        }

        [HttpPost]
        public ActionResult DangNhap(string email, string password)
        {
            var session = _contextAccessor.HttpContext.Session;
            if (email == "Admin@gmail.com" && password == "123aA@")
            {
                session.SetString("email", "admin");
                return RedirectToAction("Index");
            }
            else
            {
                TempData["error"] = "Tài khoản đăng nhập không đúng!";
                return View();
            }
        }

        public async Task<ActionResult> DangXuat(string returnUrl = null)
        {
            HttpContext.Session.Remove("email");

            await HttpContext.SignOutAsync();

            return RedirectToAction("DangNhap");
        }
    }
}