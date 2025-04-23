//using Lab03.Models;
//using Microsoft.AspNetCore.Authorization;
//using Microsoft.AspNetCore.Mvc;

//namespace Lab03.Areas.Admin.Controllers
//{
//    public class StatisticController : Controller
//    {
//        public IActionResult Index()
//        {
//            return View();
//        }
//    }
//}

using Lab03.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;


namespace Lab03.Areas.Admin.Controllers
{
    [Area("Admin")]
    //[Authorize(Roles = "Admin")]
    public class StatisticController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly SignInManager<ApplicationUser> _signInManager;

        public StatisticController(ApplicationDbContext context, IHttpContextAccessor contextAccessor, SignInManager<ApplicationUser> signInManager)
        {
            _context = context;
            _contextAccessor = contextAccessor;
            _signInManager = signInManager;
        }

        //public async Task<IActionResult> Index(int? month)
        //{
        //    if (month.HasValue && month >= 1 && month <= 12)
        //    {
        //        var firstDayOfMonth = new DateTime(DateTime.Now.Year, month.Value, 1);
        //        var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

        //        var orders = await _context.Orders
        //            .Where(o => o.OrderDate >= firstDayOfMonth && o.OrderDate <= lastDayOfMonth)
        //            .ToListAsync();



        //        var totalAmount = orders.Sum(o => o.TotalPrice);
        //        var countOrders = orders.Count();

        //        var statistics = new Dictionary<string, (decimal TotalAmount, int CountOrders)>
        //        {
        //            { $"Tháng {month}", (totalAmount, countOrders) }
        //        };

        //        ViewData["TotalAmount"] = totalAmount;
        //        ViewData["CountOrders"] = countOrders;

        //        return View(statistics);
        //    }
        //    else
        //    {
        //        // Nếu không có tháng được chọn hoặc tháng không hợp lệ, trả về thông tin thống kê cho tháng hiện tại
        //        return RedirectToAction(nameof(Index), new { month = DateTime.Now.Month });
        //    }
        //}

        public async Task<IActionResult> Index(int? month)
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            var currentMonth = DateTime.Now.Month;
            var statistics = new Dictionary<string, (decimal TotalAmount, int CountOrders)>();

            for (int m = 1; m <= 12; m++)
            {
                var firstDayOfMonth = new DateTime(DateTime.Now.Year, m, 1);
                var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

                var orders = await _context.Orders
                    .Where(o => o.OrderDate >= firstDayOfMonth && o.OrderDate <= lastDayOfMonth)
                    .ToListAsync();

                var totalAmount = orders.Sum(o => o.TotalPrice);
                var countOrders = orders.Count();

                statistics.Add($"Tháng {m}", (totalAmount, countOrders));
            }

            ViewData["Statistics"] = statistics;

            return View(statistics);
        }

        public async Task<IActionResult> Month(int? month)
        {
            var currentMonth = month ?? DateTime.Now.Month;
            var currentYear = DateTime.Now.Year;
            var statistics = new Dictionary<string, (decimal TotalAmount, int CountOrders)>();

            var firstDayOfMonth = new DateTime(currentYear, currentMonth, 1);
            var lastDayOfMonth = firstDayOfMonth.AddMonths(1).AddDays(-1);

            for (var date = firstDayOfMonth; date <= lastDayOfMonth; date = date.AddDays(7))
            {
                var startOfWeek = date;
                var endOfWeek = date.AddDays(6);

                if (endOfWeek > lastDayOfMonth)
                {
                    endOfWeek = lastDayOfMonth;
                }

                var orders = await _context.Orders
                    .Where(o => o.OrderDate >= startOfWeek && o.OrderDate <= endOfWeek)
                    .ToListAsync();

                var totalAmount = orders.Sum(o => o.TotalPrice);
                var countOrders = orders.Count();

                var weekLabel = $"Tuần {((startOfWeek.Day - 1) / 7) + 1} ({startOfWeek.ToString("dd/MM/yyyy")} - {endOfWeek.ToString("dd/MM/yyyy")})";
                statistics.Add(weekLabel, (totalAmount, countOrders));
            }

            ViewData["Statistics"] = statistics;

            return View(statistics);
        }
        public async Task<IActionResult> Week(int? month, int? week)
        {
            var currentMonth = month ?? DateTime.Now.Month;
            var currentYear = DateTime.Now.Year;
            var currentWeek = week ?? ((DateTime.Now.Day - 1) / 7) + 1;
            var statistics = new Dictionary<string, (decimal TotalAmount, int CountOrders)>();

            var firstDayOfMonth = new DateTime(currentYear, currentMonth, 1);
            var startOfWeek = firstDayOfMonth.AddDays((currentWeek - 1) * 7);
            var endOfWeek = startOfWeek.AddDays(6);

            if (startOfWeek.Month != currentMonth)
            {
                startOfWeek = firstDayOfMonth;
            }

            if (endOfWeek.Month != currentMonth)
            {
                endOfWeek = firstDayOfMonth.AddMonths(1).AddDays(-1);
            }

            for (var date = startOfWeek; date <= endOfWeek; date = date.AddDays(1))
            {
                var orders = await _context.Orders
                    .Where(o => o.OrderDate.Date == date.Date)
                    .ToListAsync();

                var totalAmount = orders.Sum(o => o.TotalPrice);
                var countOrders = orders.Count();

                var dayLabel = date.ToString("dd/MM/yyyy");
                statistics.Add(dayLabel, (totalAmount, countOrders));
            }

            ViewData["Statistics"] = statistics;

            return View(statistics);
        }


    }
}