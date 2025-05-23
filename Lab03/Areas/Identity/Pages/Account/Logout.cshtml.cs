﻿// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.
#nullable disable

using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Lab03.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using Lab03.Extensions;

namespace Lab03.Areas.Identity.Pages.Account
{
    public class LogoutModel : PageModel
    {
        private readonly SignInManager<ApplicationUser> _signInManager;
        private readonly ILogger<LogoutModel> _logger;

        public LogoutModel(SignInManager<ApplicationUser> signInManager, ILogger<LogoutModel> logger)
        {
            _signInManager = signInManager;
            _logger = logger;
        }

        //public async Task<IActionResult> OnPost(string returnUrl = null)
        //{
        //    await _signInManager.SignOutAsync();
        //    //_logger.LogInformation("User logged out.");
        //    _logger.LogInformation("Đã đăng xuất tài khoản");
        //    if (returnUrl != null)
        //    {
        //        var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart");
        //        cart.ClearItems();
        //        HttpContext.Session.SetObjectAsJson("Cart", cart);
        //        return LocalRedirect(returnUrl);
        //    }
        //    else
        //    {
        //        // This needs to be a redirect so that the browser performs a new
        //        // request and the identity for the user gets updated.
        //        return RedirectToPage();
        //    }
        //}

        public async Task<IActionResult> OnPost(string returnUrl = null)
        {
            await _signInManager.SignOutAsync();
            _logger.LogInformation("Đã đăng xuất tài khoản");

            if (returnUrl != null)
            {
                var cart = HttpContext.Session.GetObjectFromJson<ShoppingCart>("Cart");

                if (cart != null)
                {
                    cart.ClearItems();
                    HttpContext.Session.SetObjectAsJson("Cart", cart);
                }

                return LocalRedirect(returnUrl);
            }
            else
            {
                // This needs to be a redirect so that the browser performs a new
                // request and the identity for the user gets updated.
                return RedirectToPage();
            }
        }


    }
}
