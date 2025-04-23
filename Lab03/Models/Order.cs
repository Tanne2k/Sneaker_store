using Lab03.Models;
using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using MimeKit.Encodings;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab03.Models
{
    public class Order
    {
        public int Id { get; set; }
        public string UserId { get; set; }
        [Required(ErrorMessage = "Không được để trống")]
        public string Firstname { get; set; }
        [Required(ErrorMessage = "Không được để trống")]
        public string Lastname { get; set; }
        public DateTime OrderDate { get; set; }
        public decimal TotalPrice { get; set; }
        [Required(ErrorMessage = "Địa chỉ là bắt buộc.")]
        public string ShippingAddress { get; set; }

        [Required(ErrorMessage = "Số điện thoại là bắt buộc.")]
        [RegularExpression(@"^\d{1,10}$", ErrorMessage = "Số điện thoại chỉ được chứa số và không quá 10 chữ số.")]
        [StringLength(10, ErrorMessage = "Số điện thoại không được quá 10 chữ số.")]
        public string Numberphone { get; set; }
        public string? Notes { get; set; }
        [ForeignKey("UserId")]
        [ValidateNever]
        public ApplicationUser ApplicationUser { get; set; }
        public List<OrderDetail> OrderDetails { get; set; }

    }

}