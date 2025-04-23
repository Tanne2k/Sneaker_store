using Microsoft.AspNetCore.Identity;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Lab03.Models
{
    public class ApplicationUser : IdentityUser
    {
        
        public string? FullName { get; set; }
        public string? Address { get; set; }
        public string? Age { get; set; }
        //[DefaultValue(true)]
        //public bool isEnabled { get; set; }
    }
}
