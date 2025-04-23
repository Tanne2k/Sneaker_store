﻿using Lab03.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;

namespace Lab03.Areas.Admin.Pages.Role
{
    public class AddUserRoleModel : PageModel
    {
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly UserManager<ApplicationUser> _userManager;


        public AddUserRoleModel(RoleManager<IdentityRole> roleManager,
                            UserManager<ApplicationUser> userManager)
        {
            _roleManager = roleManager;
            _userManager = userManager;
        }

        public class InputModel
        {
            [Required]
            [Display(Name = "Mã vai trò")]
            public string ID { set; get; }
            [Display(Name = "Tên vai trò")]
            public string Name { set; get; }
            [Display(Name = "Các vai trò có trong hệ thống: ")]
            public string[] RoleNames { set; get; }

        }

        [BindProperty]
        public InputModel Input { set; get; }

        [BindProperty]
        public bool isConfirmed { set; get; }

        [TempData] // Sử dụng Session
        public string StatusMessage { get; set; }
        public List<string> AllRoles { set; get; } = new List<string>();
        public IActionResult OnGet() => NotFound($"Không có");
        public async Task<IActionResult> OnPost()
        {

            var user = await _userManager.FindByIdAsync(Input.ID);
            if (user == null)
            {
                return NotFound("Không thấy role cần xóa");
            }

            var roles = await _userManager.GetRolesAsync(user);
            var allroles = await _roleManager.Roles.ToListAsync();

            allroles.ForEach((r) =>
            {
                AllRoles.Add(r.Name);
            });

            if (!isConfirmed)
            {
                Input.RoleNames = roles.ToArray();
                isConfirmed = true;
                StatusMessage = "";
                ModelState.Clear();
            }
            else
            {
                // Update add and remove
                StatusMessage = "Vừa cập nhật";
                if (Input.RoleNames == null) Input.RoleNames = new string[] { };
                foreach (var rolename in Input.RoleNames)
                {
                    if (roles.Contains(rolename)) continue;
                    await _userManager.AddToRoleAsync(user, rolename);
                }
                foreach (var rolename in roles)
                {
                    if (Input.RoleNames.Contains(rolename)) continue;
                    await _userManager.RemoveFromRoleAsync(user, rolename);
                }

            }
            Input.Name = user.UserName;
            return Page();
        }
    }
}
