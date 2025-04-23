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
    public class ShoppingCartController : Controller
    {
        private readonly IProductRepository _productRepository;
        private readonly ApplicationDbContext _context;
        private readonly INotyfService _notyf;
        private readonly UserManager<ApplicationUser> _userManager;

        public ShoppingCartController(IProductRepository productRepository, ApplicationDbContext context, UserManager<ApplicationUser> userManager, INotyfService notyf)
        {
            _productRepository = productRepository;
            _context = context;
            _userManager = userManager;
            _notyf = notyf;
        }

        public async Task<IActionResult> AddToCart(int productId, int quantity)
        {

            try
            {
                var product = await GetProductFromDatabase(productId);
                var size = await _context.Sizes.ToListAsync();
                var color = await _context.Colors.ToListAsync();
                var cartItem = new CartItem
                {
                    ProductId = productId,
                    Name = product.Name,
                    Price = product.Price,
                    Quantity = quantity,
                    ImageUrl = product.ImageUrl,
                    size = product.Sizes.Name,
                    color = product.Colors.Name
                };
                var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart") ?? new ShoppingCart();
                cart.AddItem(cartItem);
                HttpContext.Session.SetObjectAsJson("Cart", cart);
                return Ok(new
                {
                    success = true,
                    message = "Sản phẩm đã được thêm vào giỏ hàng ♥",
                    data = cart.Items.Count()
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new
                {
                    success = false,
                    message = "Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng ☠",
                    error = ex.Message
                });
            }
        }

        //public async Task<IActionResult> AddToCartAjax(int productId, int quantity)
        //{
        //    try
        //    {
        //        var product = await GetProductFromDatabase(productId);
        //        var cartItem = new CartItem
        //        {
        //            ProductId = productId,
        //            Name = product.Name,
        //            Price = product.Price,
        //            Quantity = quantity,
        //            ImageUrl = product.ImageUrl,
        //            //size = product.Sizes.Name,
        //            //color = product.Colors.Name
        //        };
        //        var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart") ?? new ShoppingCart();
        //        cart.AddItem(cartItem);
        //        HttpContext.Session.SetObjectAsJson("Cart", cart);
        //        //_notyf.Success("Sản phẩm đã được thêm vào giỏ hàng ♥");
        //        return Ok(new
        //        {
        //            success = true,
        //            message = "Sản phẩm đã được thêm vào giỏ hàng ♥",
        //            data = cart.Items.Count()
        //        });
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(new
        //        {
        //            success = false,
        //            message = "Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng ☠",
        //            error = ex.Message
        //        });
        //    }
        //}

        public IActionResult IndexAJAX()
        {
            try
            {
                var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart") ?? new ShoppingCart();
                return Ok(new { success = true, data = cart.Items.Count() });
            }
            catch (Exception ex)
            {
                return BadRequest(new
                {
                    success = false,
                    message = "Đã xảy ra lỗi khi thêm sản phẩm vào giỏ hàng.",
                    error = ex.Message
                });
            }
        }

        private async Task<Product> GetProductFromDatabase(int productID)
        {
            var product = await _productRepository.GetByIdAsync(productID);
            return product;
        }


        public IActionResult RemoveFromCart(int productId)
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart");
            if (cart != null)
            {
                cart.RemoveItem(productId);
                HttpContext.Session.SetObjectAsJson("Cart", cart);
                _notyf.Success("Sản phẩm đã được xóa khỏi giỏ hàng.");
            }
            return RedirectToAction("Index");
        }

        public IActionResult RemoveAllFromCart()
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart");
            if (cart != null)
            {
                cart.ClearItems();
                HttpContext.Session.SetObjectAsJson("Cart", cart);
                _notyf.Success("Giỏ hàng đã được làm trống.");
            }
            return RedirectToAction("Index");
        }

        public IActionResult UpdateQuantity(int productId, int newQuantity)
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart");
            if (cart != null)
            {
                cart.UpdateQuantity(productId, newQuantity);
                HttpContext.Session.SetObjectAsJson("Cart", cart);
                _notyf.Success("Số lượng sản phẩm đã được cập nhật.");
            }
            return RedirectToAction("Index");
        }

        public IActionResult IncQuantity(int productId)
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart");
            if (cart != null)
            {
                cart.IncQuantity(productId);
                HttpContext.Session.SetObjectAsJson("Cart", cart);
                _notyf.Success("Số lượng sản phẩm đã được tăng.");
            }
            return RedirectToAction("Index");
        }

        public IActionResult DecQuantity(int productId)
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart");
            if (cart != null)
            {
                cart.DecQuantity(productId);
                HttpContext.Session.SetObjectAsJson("Cart", cart);
                _notyf.Success("Số lượng sản phẩm đã được giảm.");
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public IActionResult Checkout()
        {
            return View(new Order());
        }

        [HttpPost]
        public async Task<IActionResult> Checkout(Order order)
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart");
            if (cart == null || !cart.Items.Any())
            {
                _notyf.Warning("Giỏ hàng của bạn trống.");
                return RedirectToAction("Index", "Home");
            }
            var user = await _userManager.GetUserAsync(User);
            order.UserId = user.Id;
            order.OrderDate = DateTime.UtcNow.ToLocalTime();
            //order.OrderDate = DateTime.UtcNow;
            order.TotalPrice = cart.Items.Sum(i => i.Price * i.Quantity);
            order.OrderDetails = cart.Items.Select(i => new OrderDetail
            {
                ProductId = i.ProductId,
                Quantity = i.Quantity,
                Price = i.Price,

            }).ToList();
            _context.Orders.Add(order);
            await _context.SaveChangesAsync();
            HttpContext.Session.Remove("Cart");

            await MailUtils.MailUtils.SendMailGoogleSmtp("thinhyone@gmail.com", user.Email,
                        $"Thanh toán thành công",
                      "Bạn đã đặt hàng thàng công. Cảm ơn bạn đã chọn chúng tôi !",
                               "thinhyone@gmail.com", "jbpu qpks thai qhtj");

            //_notyf.Success("Đơn hàng của bạn đã được đặt thành công!");

            // Chuẩn bị dữ liệu cho thanh toán MoMo
            //decimal totalMOMO = decimal.Parse(order.TotalPrice.ToString()); // Số tiền cần thanh toán
            //decimal result = Math.Truncate(totalMOMO);


            return View("OrderCompleted", order.Id);
        }

        public IActionResult OrderCompleted()
        {
            return View();
        }

        public async Task<IActionResult> OrderHistory()
        {
            var userId = User.FindFirstValue(ClaimTypes.NameIdentifier);
            var orders = await _context.Orders
                                        .Include(o => o.OrderDetails)
                                        .ThenInclude(od => od.Product)
                                        .Where(o => o.UserId == userId)
                                        .OrderByDescending(o => o.OrderDate)
                                        .ToListAsync();
            return View(orders);
        }

        //public ActionResult Payment(int tongTien)
        //{
        //    string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
        //    string partnerCode = "MOMOOJOI20210710";
        //    string accessKey = "iPXneGmrJH0G8FOP";
        //    string serectkey = "sFcbSGRSJjwGxwhhcEktCHWYUuTuPNDB";
        //    string orderInfo = "Thanh toán online";
        //    string returnUrl = "https://localhost:7221/ShoppingCart";
        //    string notifyurl = "https://Home/SavePayment";
        //    string amount = tongTien.ToString(); //
        //    string orderid = DateTime.Now.Ticks.ToString(); //
        //    string requestId = DateTime.Now.Ticks.ToString(); //
        //    string extraData = "";

        //    string rawHash = "partnerCode=" +
        //        partnerCode + "&accessKey=" +
        //        accessKey + "&requestId=" +
        //        requestId + "&amount=" +
        //        amount + "&orderId=" +
        //        orderid + "&orderInfo=" +
        //        orderInfo + "&returnUrl=" +
        //        returnUrl + "&notifyUrl=" +
        //        notifyurl + "&extraData=" +
        //        extraData;

        //    MoMoSecurity crypto = new MoMoSecurity();
        //    string signature = crypto.signSHA256(rawHash, serectkey);

        //    JObject message = new JObject
        //    {
        //        { "partnerCode", partnerCode },
        //        { "accessKey", accessKey },
        //        { "requestId", requestId },
        //        { "amount", amount },
        //        { "orderId", orderid },
        //        { "orderInfo", orderInfo },
        //        { "returnUrl", returnUrl },
        //        { "notifyUrl", notifyurl },
        //        { "extraData", extraData },
        //        { "requestType", "captureMoMoWallet" },
        //        { "signature", signature }
        //    };
        //    string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
        //    JObject jmessage = JObject.Parse(responseFromMomo);
        //    return Redirect(jmessage.GetValue("payUrl").ToString());
        //}

        public async Task<IActionResult> Payment(int totalMOMO)
        {
            try
            {
                string endpoint = "https://test-payment.momo.vn/gw_payment/transactionProcessor";
                string partnerCode = "MOMOOJOI20210710";
                string accessKey = "iPXneGmrJH0G8FOP";
                string serectkey = "sFcbSGRSJjwGxwhhcEktCHWYUuTuPNDB";
                string orderInfo = "Thanh toán online";
                string returnUrl = "https://localhost:7221/ShoppingCart/ReturnUrl";
                string notifyurl = "https://Home/SavePayment";
                string amount = totalMOMO.ToString(); //
                string orderid = DateTime.Now.Ticks.ToString(); //
                string requestId = DateTime.Now.Ticks.ToString(); //
                string extraData = "";

                // Chuẩn bị chuỗi rawHash và chữ ký signature
                string rawHash = $"partnerCode={partnerCode}&accessKey={accessKey}&requestId={requestId}&amount={amount}&orderId={orderid}&orderInfo={orderInfo}&returnUrl={returnUrl}&notifyUrl={notifyurl}&extraData={extraData}";
                MoMoSecurity crypto = new MoMoSecurity();
                string signature = crypto.signSHA256(rawHash, serectkey);

                var user = await _userManager.GetUserAsync(User);
                JObject message = new JObject
            {
                { "partnerCode", partnerCode },
                { "accessKey", accessKey },
                { "requestId", requestId },
                { "amount", amount },
                { "orderId", orderid },
                { "orderInfo", orderInfo },
                { "returnUrl", returnUrl },
                { "notifyUrl", notifyurl },
                { "extraData", extraData },
                { "requestType", "captureMoMoWallet" },
                { "signature", signature }
            };
                string responseFromMomo = PaymentRequest.sendPaymentRequest(endpoint, message.ToString());
                JObject jmessage = JObject.Parse(responseFromMomo);
                //HttpContext.Session.Remove("Cart");
                //await MailUtils.MailUtils.SendMailGoogleSmtp("thinhyone@gmail.com", user.Email,
                //        $"Thanh toán thành công",
                //      "Bạn đã đặt hàng thàng công. Cảm ơn bạn đã chọn chúng tôi !",
                //               "thinhyone@gmail.com", "jbpu qpks thai qhtj");
                return Redirect(jmessage.GetValue("payUrl").ToString());
            }
            catch (Exception ex)
            {
                // Xử lý lỗi nếu có
                return BadRequest(ex.Message);
            }

        }

        public async Task<IActionResult> ReturnUrl()
        {
            string param = Request.QueryString.ToString().Substring(0, Request.QueryString.ToString().IndexOf("signature") - 1);
            param = System.Net.WebUtility.UrlDecode(param);
            if (param.Contains("message=Success"))
            {
                return RedirectToAction("Checkout", "ShoppingCart");
            }
            else
            {
                return RedirectToAction("Index", "ShoppingCart");
            }
        }

        //[HttpPost]
        //public IActionResult VerifyVoucher(int totalMOMO, string? voucherCode)
        //{
        //    int giaCuoiCung = 0;
        //    var voucher = _context.Discounts.FirstOrDefault(d => d.Code == voucherCode && d.Expdate > DateTime.Now);
        //    if (voucher != null)
        //    {
        //        if (voucher.Remain == 0)
        //        {
        //            giaCuoiCung = totalMOMO;
        //            _notyf.Warning("Voucher đã hết lượt sử dụng.");
        //        }
        //        else
        //        {
        //            voucher.Remain -= 1;
        //            int giaDuocGiam = (int)(totalMOMO * (voucher.Percentage / 100));
        //            giaCuoiCung = totalMOMO - giaDuocGiam;
        //            TempData["Totalprice"] = giaCuoiCung;
        //            _context.Update(voucher);
        //            _context.SaveChanges();
        //            _notyf.Success("Áp dụng voucher thành công!");
        //        }
        //    }
        //    else
        //    {
        //        giaCuoiCung = totalMOMO;
        //        _notyf.Error("Voucher không hợp lệ hoặc đã hết hạn.");
        //    }
        //    return RedirectToAction("Index");
        //}

        [HttpPost]
        public IActionResult VerifyVoucher(int totalMOMO, string? voucherCode)
        {
            if (string.IsNullOrEmpty(voucherCode))
            {
                TempData["VoucherError"] = "Vui lòng nhập mã giảm giá";
                return RedirectToAction("Index");
            }

            var voucher = _context.Discounts.FirstOrDefault(d => d.Code == voucherCode && d.Expdate > DateTime.Now);
            if (voucher != null)
            {
                if (voucher.Remain == 0)
                {
                    TempData["Totalprice"] = totalMOMO;
                    _notyf.Warning("Voucher đã hết lượt sử dụng.");
                }
                else
                {
                    voucher.Remain -= 1;
                    int discountAmount = (int)(totalMOMO * (voucher.Percentage / 100));
                    int finalPrice = totalMOMO - discountAmount;
                    TempData["Totalprice"] = finalPrice;
                    TempData["voucher"] = voucherCode;
                    TempData["VoucherApplied"] = true;

                    _context.Update(voucher);
                    _context.SaveChanges();
                    _notyf.Success("Áp dụng voucher thành công!");
                }
            }
            else
            {
                TempData["Totalprice"] = totalMOMO;
                _notyf.Error("Voucher không hợp lệ hoặc đã hết hạn.");
            }

            return RedirectToAction("Index");
        }

        [HttpPost]
        public IActionResult ChangeVoucher(int totalMOMO, string newVoucherCode)
        {
            if (string.IsNullOrEmpty(newVoucherCode))
            {
                TempData["VoucherError"] = "Vui lòng nhập mã giảm giá";
                return RedirectToAction("Index");
            }

            var voucher = _context.Discounts.FirstOrDefault(d => d.Code == newVoucherCode && d.Expdate > DateTime.Now);
            if (voucher != null)
            {
                if (voucher.Remain == 0)
                {
                    TempData["Totalprice"] = totalMOMO;
                    _notyf.Warning("Voucher đã hết lượt sử dụng.");
                }
                else
                {
                    var oldVoucherCode = TempData["voucher"]?.ToString();
                    if (oldVoucherCode != null)
                    {
                        var oldVoucher = _context.Discounts.FirstOrDefault(d => d.Code == oldVoucherCode);
                        if (oldVoucher != null)
                        {
                            oldVoucher.Remain += 1; // Revert the old voucher usage
                            _context.Update(oldVoucher);
                        }
                    }

                    voucher.Remain -= 1;
                    int discountAmount = (int)(totalMOMO * (voucher.Percentage / 100));
                    int finalPrice = totalMOMO - discountAmount;
                    TempData["Totalprice"] = finalPrice;
                    TempData["voucher"] = newVoucherCode;
                    TempData["VoucherApplied"] = true;

                    _context.Update(voucher);
                    _context.SaveChanges();
                    _notyf.Success("Đổi mã giảm giá thành công!");
                }
            }
            else
            {
                TempData["Totalprice"] = totalMOMO;
                _notyf.Error("Mã giảm giá không hợp lệ hoặc đã hết hạn.");
            }

            return RedirectToAction("Index");
        }

        public IActionResult Index()
        {
            var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart") ?? new ShoppingCart();
            if (cart == null || !cart.Items.Any())
            {
                _notyf.Information("Giỏ hàng của bạn trống.");
                return View("NullCart");
            }
            return View(cart);
        }


    }
}