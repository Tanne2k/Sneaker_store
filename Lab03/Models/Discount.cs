namespace Lab03.Models
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public partial class Discount
    {
        [Key]
        
        public int IdDiscount { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mã giảm giá")]
        public string Code { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số phần trăm giảm")]
        public double Percentage { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập hạn sử dụng")]
        public DateTime Expdate { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập số lượng")]
        public int Remain { get; set; }
    }
}
