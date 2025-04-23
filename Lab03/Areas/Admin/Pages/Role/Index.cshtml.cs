using Lab03.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Lab03.Areas.Admin.Pages.Role
{
    [Area("Admin")]

    public class IndexModel : PageModel
    {

        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly SignInManager<ApplicationUser> _signInManager;

        public IndexModel(RoleManager<IdentityRole> roleManager, IHttpContextAccessor contextAccessor, SignInManager<ApplicationUser> signInManager)
        {
            _roleManager = roleManager;
            _contextAccessor = contextAccessor;
            _signInManager = signInManager;
        }
        public List<IdentityRole> roles { set; get; }

        [TempData] // Sử dụng Session lưu thông báo
        public string StatusMessage { get; set; }

        public async Task<IActionResult> OnGet()
        {
            roles = await _roleManager.Roles.ToListAsync();
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }

            return Page();
        }
    }
}
