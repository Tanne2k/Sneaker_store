using Lab03.Areas.Admin;
using Lab03.Models;
using Lab03.Repositories;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using System.Text.RegularExpressions;
using System.Text;
using Microsoft.AspNetCore.Identity;
using System.Net;
using Lab03.ViewModels;

namespace Lab03.Areas.Employee.Controllers
{

    [Area("Employee")]
    public class ProductController : Controller
    {
        private readonly IProductRepository _productRepository;
        private readonly ICategoryRepository _categoryRepository;
        private readonly ISizeRepository _sizeRepository;
        private readonly IColorRepository _colorRepository;
        private readonly ApplicationDbContext _context;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly SignInManager<ApplicationUser> _signInManager;
        public ProductController(IProductRepository productRepository, ApplicationDbContext context,

        ICategoryRepository categoryRepository, IHttpContextAccessor contextAccessor, SignInManager<ApplicationUser> signInManager, ISizeRepository sizeRepository, IColorRepository colorRepository)

        {
            _productRepository = productRepository;
            _categoryRepository = categoryRepository;
            _context = context;
            _contextAccessor = contextAccessor;
            _signInManager = signInManager;
            _sizeRepository = sizeRepository;
            _colorRepository = colorRepository;

        }
        // Hiển thị danh sách sản phẩm
        public async Task<IActionResult> Index()
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            var products = await _productRepository.GetAllAsync();
            return View(products);
        }
        // Hiển thị form thêm sản phẩm mới
        public async Task<IActionResult> Add()
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            var categories = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "Id", "Name");
            var colors = await _colorRepository.GetAllAsync();
            ViewBag.Colors = new SelectList(colors, "Id", "Name");
            var sizes = await _sizeRepository.GetAllAsync();
            ViewBag.Sizes = new SelectList(sizes, "Id", "Name");
            return View();
        }
        // Xử lý thêm sản phẩm mới
        //[HttpPost]
        //public async Task<IActionResult> Add(Product product, IFormFile imageUrl)
        //{
        //    var session = _contextAccessor.HttpContext.Session;
        //    if (session.GetString("email") == null)
        //    {
        //        return RedirectToAction("DangNhap", "Home");
        //    }
        //    if (ModelState.IsValid)
        //    {
        //        if (imageUrl != null)
        //        {
        //            // Lưu hình ảnh đại diện tham khảo bài 02 hàm SaveImage
        //            product.ImageUrl = await SaveImage(imageUrl);
        //        }
        //        await _productRepository.AddAsync(product);
        //        return RedirectToAction(nameof(Index));
        //    }
        //    // Nếu ModelState không hợp lệ, hiển thị form với dữ liệu đã nhập
        //    var categories = await _categoryRepository.GetAllAsync();
        //    ViewBag.Categories = new SelectList(categories, "Id", "Name");
        //    var colors = await _colorRepository.GetAllAsync();
        //    ViewBag.Colors = new SelectList(colors, "Id", "Name");
        //    var sizes = await _sizeRepository.GetAllAsync();
        //    ViewBag.Sizes = new SelectList(sizes, "Id", "Name");
        //    return View(product);
        //}

        [HttpPost]
        public async Task<IActionResult> Add(Product product, IFormFile imageUrl, IFormFile SideImage1, IFormFile SideImage2, IFormFile SideImage3)
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            if (ModelState.IsValid)
            {
                if (imageUrl != null)
                {
                    product.ImageUrl = await SaveImage(imageUrl);
                }
                if (SideImage1 != null)
                {
                    // Lưu hình ảnh đại diện tham khảo bài 02 hàm SaveImage
                    product.SideImage1 = await SaveImage(SideImage1);
                }
                if (SideImage2 != null)
                {
                    // Lưu hình ảnh đại diện tham khảo bài 02 hàm SaveImage
                    product.SideImage2 = await SaveImage(SideImage2);
                }
                if (SideImage3 != null)
                {
                    // Lưu hình ảnh đại diện tham khảo bài 02 hàm SaveImage
                    product.SideImage3 = await SaveImage(SideImage3);
                }
                product.MoTaDai = WebUtility.HtmlDecode(product.MoTaDai); // Decode HTML before saving
                await _productRepository.AddAsync(product);
                return RedirectToAction(nameof(Index));
            }
            var categories = await _categoryRepository.GetAllAsync();
            var sizes = await _sizeRepository.GetAllAsync();
            var colors = await _colorRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "Id", "Name");
            ViewBag.Sizes = new SelectList(sizes, "Id", "Name");
            ViewBag.Colors = new SelectList(colors, "Id", "Name");
            return View(product);
        }


        // Viết thêm hàm SaveImage (tham khảo bài 02)
        private async Task<string> SaveImage(IFormFile image)
        {
            var savePath = Path.Combine("wwwroot/images", image.FileName);

            using (var fileStream = new FileStream(savePath, FileMode.Create))
            {
                await image.CopyToAsync(fileStream);
            }
            return "/images/" + image.FileName; // Trả về đường dẫn tương đối
        }
        public async Task<IActionResult> Display(int id)
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            var product = await _context.Products
                .Include(p => p.Category)
                .Include(p => p.Colors)
                .Include(p => p.Sizes)
                .FirstOrDefaultAsync(m => m.Id == id);
            if (product == null)
            {
                return NotFound();
            }
            return View(product);
        }

        public async Task<IActionResult> Update(int id)
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            var product = await _productRepository.GetByIdAsync(id);
            if (product == null)
            {
                return NotFound();
            }
            var categories = await _categoryRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "Id", "Name",

            product.CategoryId);
            var colors = await _colorRepository.GetAllAsync();
            ViewBag.Colors = new SelectList(colors, "Id", "Name",
                product.ColorId);
            var sizes = await _sizeRepository.GetAllAsync();
            ViewBag.Sizes = new SelectList(sizes, "Id", "Name",
                product.SizeId);

            return View(product);
        }
      

        [HttpPost]
        public async Task<IActionResult> Update(int id, Product product, IFormFile imageUrl, IFormFile SideImage1, IFormFile SideImage2, IFormFile SideImage3)
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            ModelState.Remove("ImageUrl");
            ModelState.Remove("SideImage1");
            ModelState.Remove("SideImage2");
            ModelState.Remove("SideImage3");
            if (id != product.Id)
            {
                return NotFound();
            }
            if (ModelState.IsValid)
            {
                var existingProduct = await

                _productRepository.GetByIdAsync(id);

                if (imageUrl == null)
                {
                    product.ImageUrl = existingProduct.ImageUrl;
                }
                else
                {
                    // Lưu hình ảnh mới
                    product.ImageUrl = await SaveImage(imageUrl);
                }
                if (SideImage1 == null)
                {
                    product.SideImage1 = existingProduct.SideImage1;
                }
                else
                {
                    // Lưu hình ảnh mới
                    product.SideImage1 = await SaveImage(SideImage1);
                }
                if (SideImage2 == null)
                {
                    product.SideImage2 = existingProduct.SideImage2;
                }
                else
                {
                    // Lưu hình ảnh mới
                    product.SideImage2 = await SaveImage(SideImage2);
                }
                if (SideImage3 == null)
                {
                    product.SideImage3 = existingProduct.SideImage3;
                }
                else
                {
                    // Lưu hình ảnh mới
                    product.SideImage3 = await SaveImage(SideImage3);
                }
                existingProduct.Name = product.Name;
                existingProduct.Price = product.Price;
                existingProduct.Description = product.Description;
                existingProduct.MoTaDai = product.MoTaDai;
                existingProduct.ColorId = product.ColorId;
                existingProduct.SizeId = product.SizeId;
                existingProduct.CategoryId = product.CategoryId;
                existingProduct.ImageUrl = product.ImageUrl;
                existingProduct.SideImage1 = product.SideImage1;
                existingProduct.SideImage2 = product.SideImage2;
                existingProduct.SideImage3 = product.SideImage3;
                await _productRepository.UpdateAsync(existingProduct);
                return RedirectToAction(nameof(Index));
            }
            var categories = await _categoryRepository.GetAllAsync();
            var sizes = await _sizeRepository.GetAllAsync();
            var colors = await _colorRepository.GetAllAsync();
            ViewBag.Categories = new SelectList(categories, "Id", "Name");
            ViewBag.Sizes = new SelectList(sizes, "Id", "Name");
            ViewBag.Colors = new SelectList(colors, "Id", "Name");
            return View(product);
        }

        // Hiển thị form cập nhật sản phẩm
        public async Task<IActionResult> Timkiem(string name)
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }
            var products = from b in _context.Products select b;

            if (!String.IsNullOrEmpty(name))
            {
                // Lấy dữ liệu từ cơ sở dữ liệu
                var productname = await _context.Products.Select(m => m.Name).ToListAsync();
                var product = await _context.Products
                    .Include(p => p.Colors)
                    .Include(p => p.Sizes)
                    .ToListAsync();
                var pricename = await _context.Products.Select(p => p.Price).ToListAsync();
                var imgUrl = await _context.Products.Select(i => i.ImageUrl).ToListAsync();
                var productList = await products.ToListAsync();
                var viewmodel = new HomeViewModel
                {
                    Products = product,
                    nameProducts = productname,
                    price = pricename,
                    imageUrl = imgUrl,
                };
                // Loại bỏ dấu và tìm kiếm trên mảng dữ liệu đã thu được
                var normalizedSearch = RemoveDiacritics(name.ToLower());
                var filteredProducts = productList.Where(p => RemoveDiacritics(p.Name.ToLower()).Contains(normalizedSearch));
                return View(filteredProducts);
            }

            return View(await products.ToListAsync());
        }

        // Hàm loại bỏ dấu trong chuỗi
        private string RemoveDiacritics(string text)
        {

            if (string.IsNullOrWhiteSpace(text))
                return text;

            text = text.Normalize(NormalizationForm.FormD);
            var regex = new Regex("\\p{IsCombiningDiacriticalMarks}+");
            return regex.Replace(text, string.Empty).Replace('\u0111', 'd').Replace('\u0110', 'D');
        }
    }
}
