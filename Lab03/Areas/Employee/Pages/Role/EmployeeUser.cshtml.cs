using Lab03.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace Lab03.Areas.Employee.Pages.Role
{
    [Area("Employee")]
    
    public class UserModel : PageModel
    {
        const int USER_PER_PAGE = 5;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly IHttpContextAccessor _contextAccessor;
        private readonly SignInManager<ApplicationUser> _signInManager;

        public UserModel(RoleManager<IdentityRole> roleManager,
                          UserManager<ApplicationUser> userManager, IHttpContextAccessor contextAccessor, SignInManager<ApplicationUser> signInManager)
        {
            _roleManager = roleManager;
            _userManager = userManager;
            _contextAccessor = contextAccessor;
            _signInManager = signInManager;
        }

        public class UserInList : ApplicationUser
        {
            // Liệt kê các Role của User ví dụ: "Employee,Editor" ...
            public string listroles { set; get; }
        }

        public List<UserInList> users;
        public int totalPages { set; get; }

        [TempData] // Sử dụng Session
        public string StatusMessage { get; set; }

        [BindProperty(SupportsGet = true)]
        public int pageNumber { set; get; }

        public IActionResult OnPost() => NotFound("Cấm post");

        public async Task<IActionResult> OnGet()
        {
            var session = _contextAccessor.HttpContext.Session;
            if (session.GetString("email") == null)
            {
                return RedirectToAction("DangNhap", "Home");
            }

            //var cuser = await _userManager.GetUserAsync(User);
            //await _userManager.AddToRolesAsync(cuser, new string[] { "Editor" });

            if (pageNumber == 0)
                pageNumber = 1;

            var lusers = (from u in _userManager.Users
                          orderby u.UserName
                          select new UserInList()
                          {
                              Id = u.Id,
                              UserName = u.UserName,
                          });


            int totalUsers = await lusers.CountAsync();


            totalPages = (int)Math.Ceiling((double)totalUsers / USER_PER_PAGE);

            users = await lusers.Skip(USER_PER_PAGE * (pageNumber - 1)).Take(USER_PER_PAGE).ToListAsync();

            // users.ForEach(async (user) => {
            //     var roles = await _userManager.GetRolesAsync(user);
            //     user.listroles = string.Join(",", roles.ToList());
            // });

            foreach (var user in users)
            {
                var roles = await _userManager.GetRolesAsync(user);
                user.listroles = string.Join(",", roles.ToList());
            }

            return Page();
        }
    }
}
