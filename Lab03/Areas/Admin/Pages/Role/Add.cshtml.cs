﻿using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.ComponentModel.DataAnnotations;

namespace Lab03.Areas.Admin.Pages.Role
{
    [Area("Admin")]

    public class AddModel : PageModel
    {
        private readonly RoleManager<IdentityRole> _roleManager;

        public AddModel(RoleManager<IdentityRole> roleManager)
        {
            _roleManager = roleManager;
        }

        [TempData] // Su dung Session
        public string StatusMessage { get; set; }

        public class InputModel
        {
            public string Id { set; get; }

            [Required(ErrorMessage = "Phải nhập tên role")]
            [Display(Name = "Tên của Role")]
            [StringLength(100, ErrorMessage = "{0} dài {2} đến {1} ký tự.", MinimumLength = 3)]
            public string NameRole { set; get; }

        }

        [BindProperty]
        public InputModel Input { set; get; }

        [BindProperty]
        public bool IsUpdate { set; get; }

        // Không cho truy cập trang mặc định mà không có handler
        public IActionResult OnGet() => NotFound("Không thấy");
        public IActionResult OnPost() => NotFound("Không thấy");


        public IActionResult OnPostStartNewRole()
        {
            StatusMessage = "Hãy nhập thông tin để tạo role mới";
            IsUpdate = false;
            ModelState.Clear();
            return Page();
        }

        // Truy vấn lấy thông tin Role cần cập nhật
        public async Task<IActionResult> OnPostStartUpdate()
        {
            StatusMessage = null;
            IsUpdate = true;
            if (Input.Id == null)
            {
                StatusMessage = "Error: Không có thông tin về Role";
                return Page();
            }
            var result = await _roleManager.FindByIdAsync(Input.Id);
            if (result != null)
            {
                Input.NameRole = result.Name;
                ViewData["Title"] = "Cập nhật role : " + Input.NameRole;
                ModelState.Clear();
            }
            else
            {
                StatusMessage = "Error: Không có thông tin về Role ID = " + Input.Id;
            }
            return Page();
        }

        // Cập nhật hoặc thêm mới tùy thuộc vào IsUpdate
        public async Task<IActionResult> OnPostAdd()
        {
            if (IsUpdate)
            {
                // CẬP NHẬT
                if (Input.Id == null)
                {
                    ModelState.Clear();
                    StatusMessage = "Error: Không có thông tin về role";
                    return Page();
                }
                var result = await _roleManager.FindByIdAsync(Input.Id);
                if (result != null)
                {
                    result.Name = Input.NameRole;
                    // Cập nhật tên Role
                    var roleUpdateRs = await _roleManager.UpdateAsync(result);
                    if (roleUpdateRs.Succeeded)
                    {
                        StatusMessage = "Đã cập nhật role thành công";
                    }
                    else
                    {
                        StatusMessage = "Error: ";
                        foreach (var er in roleUpdateRs.Errors)
                        {
                            StatusMessage += er.Description;
                        }
                    }
                }
                else
                {
                    StatusMessage = "Error: Không tìm thấy Role cập nhật";
                }

            }
            else
            {
                // TẠO MỚI
                var newRole = new IdentityRole(Input.NameRole);
                // Thực hiện tạo Role mới
                var rsNewRole = await _roleManager.CreateAsync(newRole);
                if (rsNewRole.Succeeded)
                {
                    StatusMessage = $"Đã tạo role mới thành công: {newRole.Name}";
                    return RedirectToPage("./Index");
                }
                else
                {
                    StatusMessage = "Error: ";
                    foreach (var er in rsNewRole.Errors)
                    {
                        StatusMessage += er.Description;
                    }
                }
            }

            return Page();

        }
    }
}
