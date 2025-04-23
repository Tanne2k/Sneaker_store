using Azure;
using Lab03.Models;
using Lab03.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Diagnostics;
using X.PagedList;
using Lab03.ViewModels;
using System.Drawing.Printing;

namespace Lab03.Controllers
{

    public class HomeController : Controller
    {
        private readonly IProductRepository _productRepository;
        private readonly ApplicationDbContext _context;
        private readonly ICategoryRepository _categoryRepository;
        public HomeController(IProductRepository productRepository, ICategoryRepository categoryRepository, ApplicationDbContext context)
        {
            _productRepository = productRepository;
            _categoryRepository = categoryRepository;
            _context = context;
        }

        public async Task<IActionResult> Index(int page =1)
        {
            if (User.IsInRole("Admin"))
            {
                return RedirectToAction("Denied", "Home");
            }
            if (User.IsInRole("Employee"))
            {
                return RedirectToAction("Denied", "Home");
            }
            var Sanphams = _context.Products.Include(p => p.Category).AsQueryable();
            //var products = await _productRepository.GetAllAsync();
            //return View(products);
            page = page < 1 ? 1 : page;
            int pageSize = 4;
            //var products = _context.Products.ToPagedList(page, pagesize);
            //return View(products);
            var pagedSanphams = await Sanphams
                .Select(x => new SanPhamVM
                {
                    MaSP = x.Id,
                    TenSP = x.Name,
                    Gia = x.Price,
                    MoTa = x.Description ?? "",
                    Hinh = x.ImageUrl ?? "",
                    TenLoai = x.Category.Name,
                    Kichco = x.Sizes.Name,
                    Mau = x.Colors.Name,
                    MoTaDai = x.MoTaDai
                })
                .ToPagedListAsync(page, pageSize);

            return View(pagedSanphams);
        }
        private readonly ILogger<HomeController> _logger;


        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }

        [AllowAnonymous]
        public IActionResult Contact()
        {
            return View();
        }
        public IActionResult _75584461()
        {
            return View();
        }
        public IActionResult Denied()
        {
            return View();
        }
        public IActionResult AboutUs()
        {
            return View();
        }

        [Route("/404")]
        public IActionResult PageNotFound()
        {
            return View();
        }
    }
}