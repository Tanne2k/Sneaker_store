using AspNetCoreHero.ToastNotification.Abstractions;
using Lab03.Extensions;
using Lab03.Models;
using Lab03.Repositories;
using Lab03.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using MoMo;
using Newtonsoft.Json.Linq;
using System;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using ThanhToanMoMo.Others;
using CurrieTechnologies.Razor.SweetAlert2;
using System.Text.Encodings.Web;
using Microsoft.CodeAnalysis;
using System;
using System.ComponentModel.DataAnnotations;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Lab03.Controllers
{
    [Authorize]
    public class WishlistController : Controller
    {
        private readonly IProductRepository _productRepository;
        private readonly ApplicationDbContext _context;
        private readonly INotyfService _notyf;
        private readonly UserManager<ApplicationUser> _userManager;

        public WishlistController(IProductRepository productRepository, ApplicationDbContext context, UserManager<ApplicationUser> userManager, INotyfService notyf)
        {
            _productRepository = productRepository;
            _context = context;
            _userManager = userManager;
            _notyf = notyf;
        }

        public async Task<IActionResult> AddToWishList(int productId, int quantity)
        {
            try
            {
                var product = await GetProductFromDatabase(productId);
                var size = await _context.Sizes.ToListAsync();
                var color = await _context.Colors.ToListAsync();
                var wishlistItem = new WishlistItem
                {
                    ProductId = productId,
                    Name = product.Name,
                    Price = product.Price,
                    Quantity = quantity,
                    ImageUrl = product.ImageUrl,
                    size = product.Sizes.Name,
                    color = product.Colors.Name
                };
                var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl") ?? new Wishlist();
                wl.AddItem(wishlistItem);
                HttpContext.Session.SetObjectAsJson("wl", wl);
                //_notyf.Success("Sản phẩm đã được thêm vào danh sách yêu thích ♥");
                //return RedirectToAction("Index", "Home");
                return Ok(new
                {
                    success = true,
                    message = "Sản phẩm đã được thêm vào danh sách yêu thích ♥",
                    data = wl.Items.Count()
                });

            }
            catch (Exception ex)
            {
                // Handle the exception (log it, notify the user, etc.)
                //_notyf.Error("Đã xảy ra lỗi khi thêm sản phẩm vào danh sách yêu thích ☠");
                //return RedirectToAction("Index", "Home");
                return BadRequest(new
                {
                    success = false,
                    message = "Đã xảy ra lỗi khi thêm sản phẩm vào danh sách yêu thích ☠",
                    error = ex.Message
                });
            }
        }

        private async Task<Product> GetProductFromDatabase(int productID)
        {
            var product = await _productRepository.GetByIdAsync(productID);
            return product;
        }

        public IActionResult Index()
        {
            var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl") ?? new Wishlist();
            if (wl == null || !wl.Items.Any())
            {
                _notyf.Information("Danh sách yêu thích đang trống.");
                return View("NullWL");
            }
            return View(wl);

        }

        public IActionResult IndexAJAX()
        {
            try
            {
                var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl") ?? new Wishlist();
                return Ok(new { success = true, data = wl.Items.Count() });
            }
            catch (Exception ex)
            {
                return BadRequest(new
                {
                    success = false,
                    message = "Đã xảy ra lỗi khi thêm sản phẩm vào danh sách",
                    error = ex.Message
                });
            }
        }


        public IActionResult RemoveFromWishList(int productId)
        {
            var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl");
            if (wl != null)
            {
                wl.RemoveItem(productId);
                HttpContext.Session.SetObjectAsJson("wl", wl);
                _notyf.Success("Sản phẩm đã được xóa khỏi danh sách yêu thích");
            }
            return RedirectToAction("Index");
        }

        public IActionResult RemoveAllFromWishList()
        {
            var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl");
            if (wl != null)
            {
                wl.ClearItems();
                HttpContext.Session.SetObjectAsJson("wl", wl);
                _notyf.Success("Danh sách yêu thích đã được làm trống.");
            }
            return RedirectToAction("Index");
        }
    }
}

