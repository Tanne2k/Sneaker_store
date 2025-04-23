using Lab03.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Lab03.Repository;

namespace Lab03.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class OrderController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IOrderRepository _orderRepository;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly SignInManager<ApplicationUser> _signInManager;

        

        public OrderController(IOrderRepository orderRepository, ApplicationDbContext context, IHttpContextAccessor contextAccessor, SignInManager<ApplicationUser> signInManager)
        {
            _orderRepository = orderRepository;
            _context = context;
            _signInManager = signInManager;
            _contextAccessor = contextAccessor;
        }

        public async Task<IActionResult> Order(string postTitle)
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            IEnumerable<Order> orders;
            var sizes = await _context.Sizes.ToListAsync();
            var colors = await _context.Colors.ToListAsync();

            if (postTitle != null)
            {
                orders = await _orderRepository.SearchAsync(int.Parse(postTitle));
            }
            else
            {
                orders = await _orderRepository.GetAllOrdersAsync();
            }

            return View(orders);
        }

        public async Task<IActionResult> Delete(int id)
        {
            var orderToDelete = await _orderRepository.GetOrderByIdAsync(id);
            if (orderToDelete == null)
            {
                return NotFound();
            }

            await _orderRepository.DeleteOrderAsync(orderToDelete);

            return RedirectToAction(nameof(Order)); // Chuyển hướng về trang danh sách đơn hàng sau khi xóa
        }

        public async Task<IActionResult> Search(int term)
        {
            var orders = await _orderRepository.GetAllOrdersAsync();
            var orderIds = orders.Select(x => x.Id).ToList();
            var filteredOrder = orderIds.Where(p => p == term);
            return Json(filteredOrder);
        }
    }
}
