using Lab03.Models;
using Lab03.Repositories;
using Lab03.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Drawing;
using System.Linq;
using X.PagedList;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Lab03.Extensions;
using AspNetCoreHero.ToastNotification.Abstractions;

namespace Lab03.Controllers
{
    [Authorize]
    public class ProductController : Controller
    {

        //private readonly IProductRepository _productRepository;
        //private readonly ICategoryRepository _categoryRepository;
        //private readonly ApplicationDbContext _context;

        //public ProductController(IProductRepository productRepository, ICategoryRepository categoryRepository, ApplicationDbContext context)
        //{
        //    _productRepository = productRepository;
        //    _categoryRepository = categoryRepository;
        //    _context = context;
        //}

        private readonly IProductRepository _productRepository;
        private readonly ICategoryRepository _categoryRepository;
        private readonly ApplicationDbContext _context;
        private readonly INotyfService _notyf;
        public ProductController(IProductRepository productRepository, ICategoryRepository categoryRepository, ApplicationDbContext context, INotyfService notyf)
        {
            _productRepository = productRepository;
            _categoryRepository = categoryRepository;
            _context = context;
            _notyf = notyf;
        }

        // Autocomplete
        [AllowAnonymous]
        public IActionResult Autocomplete(string query)
        {
            var suggestions = _context.Products
                .Where(x => x.Name.Contains(query))
                .Select(x => x.Name)
                .Distinct()
                .ToList();

            return Json(suggestions);
        }

        [AllowAnonymous]
        public async Task<IActionResult> Index(int? loai, string query, int? page)
        {
            var Sanphams = _context.Products.Include(p => p.Category).AsQueryable();

            // Lọc sản phẩm theo loại nếu loại được chỉ định
            if (loai.HasValue)
            {
                Sanphams = Sanphams.Where(x => x.Category.Id == loai.Value);
                ViewBag.Loai = loai.Value;
            }
            else
            {
                ViewBag.Loai = null;
            }

            // Lọc sản phẩm theo từ khóa tìm kiếm
            if (!string.IsNullOrEmpty(query))
            {
                Sanphams = Sanphams.Where(x => x.Name.Contains(query));
                ViewBag.Query = query;
            }
            else
            {
                ViewBag.Query = null;
            }

            // Phân trang
            int pageNumber = page ?? 1;
            int pageSize = 9;

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
                .ToPagedListAsync(pageNumber, pageSize);

            return View(pagedSanphams);
        }


        [AllowAnonymous]
        public async Task<IActionResult> TrangPhanAsync(string query, int? page)
        {
            var products = _context.Products.AsQueryable();

            // Lọc sản phẩm theo từ khóa tìm kiếm
            if (!string.IsNullOrEmpty(query))
            {
                products = products.Where(x => x.Name.Contains(query));
                ViewBag.Query = query;
            }
            else
            {
                ViewBag.Query = null;
            }

            // Phân trang
            int pageNumber = page ?? 1;
            int pageSize = 9;

            var pagedProducts = await products
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
                .ToPagedListAsync(pageNumber, pageSize);

            return View(pagedProducts);
        }


        // Phân trang cũ
        [AllowAnonymous]
        public IActionResult Phantrang(int page = 1)
        {
            page = page < 1 ? 1 : page;
            int pagesize = 4;
            var products = _context.Products.ToPagedList(page, pagesize);
            return View(products);
        }


        // chi tiết sản phẩm
        [AllowAnonymous]
        //public IActionResult ChiTiet(int id)
        public Task<IActionResult> ChiTiet(int id)
        {
            var product = _context.Products
                .Include(p => p.Category)
                .SingleOrDefault(p => p.Id == id);

            if (product == null)
            {
                TempData["Message"] = $"Không tìm thấy sản phẩm có mã {id}";
                return Task.FromResult<IActionResult>(Redirect("/404"));
            }

            var similarProducts = GetSimilarProducts(product.Category.Id);

            //var viewModel = new ChiTietSanPhamVM
            //{
            //    MaSP = product.Id,
            //    TenSP = product.Name,
            //    Gia = product.Price,
            //    ChiTiet = product.Description ?? string.Empty,
            //    MoTa = product.Description ?? string.Empty,
            //    Hinh = product.ImageUrl ?? string.Empty,
            //    TenLoai = product.Category != null ? product.Category.Name : string.Empty,
            //    //Sizes = _context.Sizes.Where(s => s.Id == product.SizeId).ToList(),
            //    //Colors = _context.Colors.Where(c => c.Id == product.ColorId).ToList(),
            //    Kichco = product.Sizes != null ? product.Sizes.Name : string.Empty,
            //    Mau = product.Colors != null ? product.Colors.Name : string.Empty,
            //    Images = _context.ProductImages.Where(s => s.IdProduct == product.ListImg).ToList(),
            //    MoTaDai = product.MoTaDai,
            //    SimilarProducts = similarProducts
            //};

            var viewModel = new ChiTietSanPhamVM
            {
                MaSP = product.Id,
                TenSP = product.Name,
                Gia = product.Price,
                ChiTiet = product.Description ?? string.Empty,
                MoTa = product.Description ?? string.Empty,
                Hinh = product.ImageUrl ?? string.Empty,
                SideImage1 = product.SideImage1 ?? string.Empty,
                SideImage2 = product.SideImage2 ?? string.Empty,
                SideImage3 = product.SideImage3 ?? string.Empty,
                TenLoai = product.Category != null ? product.Category.Name : string.Empty,
                Sizes = _context.Sizes.Where(s => s.Id == product.SizeId).ToList(),
                Colors = _context.Colors.Where(c => c.Id == product.ColorId).ToList(),
                //Kichco = product.Sizes != null ? product.Sizes.Name : string.Empty,
                //Mau = product.Colors != null ? product.Colors.Name : string.Empty,
                Images = _context.ProductImages.Where(s => s.IdProduct == product.ListImg).ToList(),
                MoTaDai = product.MoTaDai,
                SimilarProducts = similarProducts
            };

            return Task.FromResult<IActionResult>(View(viewModel));
        }

        // Hàm lấy danh sách sản phẩm tương tự
        private List<SanPhamVM> GetSimilarProducts(int categoryId)
        {
            // Lấy danh sách sản phẩm cùng danh mục và loại trừ sản phẩm hiện tại
            var similarProducts = _context.Products
                .Where(p => p.Category.Id == categoryId && p.Id != categoryId)
                .Select(p => new SanPhamVM
                {
                    MaSP = p.Id,
                    TenSP = p.Name,
                    Gia = p.Price,
                    MoTa = p.Description ?? "",
                    Hinh = p.ImageUrl ?? "",
                    TenLoai = p.Category.Name,
                    Kichco = p.Sizes.Name,
                    Mau = p.Colors.Name,
                    MoTaDai = p.MoTaDai
                })
                .ToList();

            return similarProducts;
        }


        //tìm kiếm mới theo tên

        [AllowAnonymous]
        public async Task<IActionResult> Timkiem(string query, int? page)
        {
            var Sanphams = _context.Products.AsQueryable();

            // Lọc sản phẩm theo từ khóa tìm kiếm
            if (!string.IsNullOrEmpty(query))
            {
                Sanphams = Sanphams.Where(x => x.Name.Contains(query));
                ViewBag.Query = query; // Đặt giá trị của query vào ViewBag để truyền vào view
            }
            else
            {
                ViewBag.Query = null;
            }

            // Phân trang
            int pageNumber = page ?? 1;
            int pageSize = 9; // Số lượng sản phẩm trên mỗi trang

            var pagedProducts = Sanphams.Select(x => new SanPhamVM
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
            }).ToPagedList(pageNumber, pageSize);

            return View(pagedProducts);
        }

        // menu hàng hóa
        public IActionResult Menu()
        {
            return View();
        }

        // kiểm tra tính sẵn có của màu sắc và kích cỡ
        [AllowAnonymous]
        [HttpGet]
        public IActionResult CheckAvailability(string type, int value, int productId)
        {
            bool isAvailable = false;

            if (type == "color")
            {
                isAvailable = _context.Products.Any(p => p.Id == productId && p.ColorId == value);
            }
            else if (type == "size")
            {
                isAvailable = _context.Products.Any(p => p.Id == productId && p.SizeId == value);
            }

            return Json(new { available = isAvailable });
        }

        [AllowAnonymous]
        public async Task<IActionResult> TimkiemTatCa(int? page)
        {
            ViewBag.CurrentSort = "TatCa";
            var Sanphams = _context.Products.OrderBy(x => Guid.NewGuid()).AsQueryable();

            int pageNumber = page ?? 1;
            int pageSize = 9;

            var pagedProducts = await Sanphams.Select(x => new SanPhamVM
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
            }).ToPagedListAsync(pageNumber, pageSize);

            if (Request.Headers["X-Requested-With"] == "XMLHttpRequest")
            {
                return View("TimkiemTatCa", pagedProducts);
            }

            return View("TimkiemTatCa", pagedProducts);

        }

        [AllowAnonymous]
        public async Task<IActionResult> TimkiemTheoTenAZ(int? page)
        {
            ViewBag.CurrentSort = "TenAZ";
            var Sanphams = _context.Products.OrderBy(x => x.Name).AsQueryable();

            int pageNumber = page ?? 1;
            int pageSize = 9;

            var pagedProducts = await Sanphams.Select(x => new SanPhamVM
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
            }).ToPagedListAsync(pageNumber, pageSize);

            return View("TimkiemTheoTenAZ", pagedProducts);
        }

        [AllowAnonymous]
        public async Task<IActionResult> TimkiemTheoTenZA(int? page)
        {
            ViewBag.CurrentSort = "TenZA";
            var Sanphams = _context.Products.OrderByDescending(x => x.Name).AsQueryable();

            int pageNumber = page ?? 1;
            int pageSize = 9;

            var pagedProducts = await Sanphams.Select(x => new SanPhamVM
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
            }).ToPagedListAsync(pageNumber, pageSize);

            return View("TimkiemTheoTenZA", pagedProducts);
        }

        [AllowAnonymous]
        public async Task<IActionResult> TimkiemTheoGiaThapNhat(int? page)
        {
            ViewBag.CurrentSort = "GiaThapNhat";
            var Sanphams = _context.Products.OrderBy(x => x.Price).AsQueryable();

            int pageNumber = page ?? 1;
            int pageSize = 9;

            var pagedProducts = await Sanphams.Select(x => new SanPhamVM
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
            }).ToPagedListAsync(pageNumber, pageSize);

            return View("TimkiemTheoGiaThapNhat", pagedProducts);
        }

        [AllowAnonymous]
        public async Task<IActionResult> TimkiemTheoGiaCaoNhat(int? page)
        {
            ViewBag.CurrentSort = "GiaCaoNhat";
            var Sanphams = _context.Products.OrderByDescending(x => x.Price).AsQueryable();

            int pageNumber = page ?? 1;
            int pageSize = 9;

            var pagedProducts = await Sanphams.Select(x => new SanPhamVM
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
            }).ToPagedListAsync(pageNumber, pageSize);

            return View("TimkiemTheoGiaCaoNhat", pagedProducts);
        }

        // lọc nâng cao

        [AllowAnonymous]
        public async Task<IActionResult> AdvancedFilter(int? page, int? price, string? color, string? size)
        {
            var products = _context.Products.AsQueryable();

            // Lọc sản phẩm theo giá
            if (price.HasValue)
            {
                switch (price.Value)
                {
                    case 500000:
                        products = products.Where(x => x.Price < 500000);
                        break;
                    case 1000000:
                        products = products.Where(x => x.Price >= 500000 && x.Price < 1000000);
                        break;
                    case 2000000:
                        products = products.Where(x => x.Price >= 1000000 && x.Price <= 2000000);
                        break;
                    case 2000001:
                        products = products.Where(x => x.Price >= 2000001);
                        break;
                    default:
                        break;
                }
            }

            // Lọc sản phẩm theo màu
            if (!string.IsNullOrEmpty(color))
            {
                products = products.Where(x => x.Colors.Name == color);
            }

            // Lọc sản phẩm theo kích cỡ
            if (!string.IsNullOrEmpty(size))
            {
                products = products.Where(x => x.Sizes.Name == size);
            }

            // Phân trang
            int pageNumber = page ?? 1;
            int pageSize = 9; // Số lượng sản phẩm trên mỗi trang

            var pagedProducts = await products
                .Select(x => new SanPhamVM
                {
                    MaSP = x.Id,
                    TenSP = x.Name,
                    Gia = x.Price,
                    MoTa = x.Description ?? "",
                    Hinh = x.ImageUrl ?? "",
                    TenLoai = x.Category.Name,
                    Sizes = _context.Sizes.Where(s => s.Id == x.SizeId).ToList(),
                    Colors = _context.Colors.Where(c => c.Id == x.ColorId).ToList(),
                    MoTaDai = x.MoTaDai
                })
                .ToPagedListAsync(pageNumber, pageSize);

            ViewBag.Price = price;
            ViewBag.Color = color;
            ViewBag.Size = size;

            return View("AdvancedFilter", pagedProducts);
        }



        // danh sách wishlist
        //public async Task<IActionResult> AddToWishlist(int productId)
        //{
        //    try
        //    {
        //        var product = await GetProductFromDatabase(productId);
        //        var size = await _context.Sizes.ToListAsync();
        //        var color = await _context.Colors.ToListAsync();
        //        var wishlistItem = new WishlistItem
        //        {
        //            ProductId = productId,
        //            Name = product.Name,
        //            Price = product.Price,
        //            ImageUrl = product.ImageUrl,
        //            size = product.Sizes.Name,
        //            color = product.Colors.Name
        //        };
        //        var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl") ?? new Wishlist();
        //        wl.AddItem(wishlistItem);
        //        HttpContext.Session.SetObjectAsJson("wl", wl);
        //        //_notyf.Success("Sản phẩm đã được thêm vào danh sách yêu thích ♥");
        //        //return RedirectToAction("Index", "Home");
        //        return Ok(new
        //        {
        //            success = true,
        //            message = "Sản phẩm đã được thêm vào danh sách yêu thích ♥",
        //            data = wl.Items.Count()
        //        });

        //    }
        //    catch (Exception ex)
        //    {
        //        // Handle the exception (log it, notify the user, etc.)
        //        //_notyf.Error("Đã xảy ra lỗi khi thêm sản phẩm vào danh sách yêu thích ☠");
        //        //return RedirectToAction("Index", "Home");
        //        return BadRequest(new
        //        {
        //            success = false,
        //            message = "Đã xảy ra lỗi khi thêm sản phẩm vào danh sách yêu thích ☠",
        //            error = ex.Message
        //        });
        //    }
        //}

        ////public async Task<IActionResult> AddToWishlistAjax(int productId, int quantity)
        ////{
        ////    try
        ////    {
        ////        var product = await GetProductFromDatabase(productId);
        ////        var wishlistItem = new WishlistItem
        ////        {
        ////            ProductId = productId,
        ////            Name = product.Name,
        ////            Price = product.Price,
        ////            ImageUrl = product.ImageUrl
        ////        };

        ////        var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl") ?? new Wishlist();
        ////        wl.AddItem(wishlistItem);
        ////        HttpContext.Session.SetObjectAsJson("wl", wl);

        ////        return Ok(new
        ////        {
        ////            success = true,
        ////            message = "Sản phẩm đã được thêm vào danh sách yêu thích ♥",
        ////            data = wl.Items.Count()
        ////        });
        ////    }
        ////    catch (Exception ex)
        ////    {
        ////        return BadRequest(new
        ////        {
        ////            success = false,
        ////            message = "Đã xảy ra lỗi khi thêm sản phẩm vào danh sách yêu thích ☠",
        ////            error = ex.Message
        ////        });
        ////    }
        ////}

        //private async Task<Product> GetProductFromDatabase(int productID)
        //{
        //    var product = await _productRepository.GetByIdAsync(productID);
        //    return product;
        //}

        //public IActionResult IndexWL()
        //{
        //    var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl") ?? new Wishlist();
        //    if (wl == null || !wl.Items.Any())
        //    {
        //        _notyf.Information("Danh sách yêu thích đang trống.");
        //        return View("NullWL");
        //    }
        //    return View(wl);

        //}

        //public IActionResult IndexAJAX()
        //{
        //    try
        //    {
        //        var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl") ?? new Wishlist();
        //        return Ok(new { success = true, data = wl.Items.Count() });
        //    }
        //    catch (Exception ex)
        //    {
        //        return BadRequest(new
        //        {
        //            success = false,
        //            message = "Đã xảy ra lỗi khi thêm sản phẩm vào danh sách",
        //            error = ex.Message
        //        });
        //    }
        //}


        //public IActionResult RemoveFromWishlist(int productId)
        //{
        //    var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl");
        //    if (wl != null)
        //    {
        //        wl.RemoveItem(productId);
        //        HttpContext.Session.SetObjectAsJson("wl", wl);
        //        _notyf.Success("Sản phẩm đã được xóa khỏi danh sách yêu thích");
        //    }
        //    return RedirectToAction("Index");
        //}

        //public IActionResult RemoveAllFromWishlist()
        //{
        //    var wl = HttpContext.Session.GetObjectFromJson<Wishlist>("wl");
        //    if (wl != null)
        //    {
        //        wl.ClearItems();
        //        HttpContext.Session.SetObjectAsJson("wl", wl);
        //        _notyf.Success("Danh sách yêu thích đã được làm trống.");
        //    }
        //    return RedirectToAction("Index");
        //}

    }
}
