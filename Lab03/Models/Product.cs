using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Lab03.Models
{
    public class Product
    {
        public int Id { get; set; }


        //[Required, StringLength(100)]
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm"), StringLength(100)]
        public string Name { get; set; }


        [Required(ErrorMessage = "Vui lòng nhập giá tiền"), Range(0.01, 9999999.00)]
        public decimal Price { get; set; }


        [Required(ErrorMessage = "Vui lòng nhập mô tả")]
        public string Description { get; set; }

        public string? ImageUrl { get; set; }
        public string? SideImage1 { get; set; }
        public string? SideImage2 { get; set; }
        public string? SideImage3 { get; set; }


        //[ForeignKey("ProductImage")]
        public int? ListImg { get; set; }
        public List<ProductImage>? Images { get; set; }


        [ForeignKey("Category")]
        public int CategoryId { get; set; }
        public Category? Category { get; set; }


        [ForeignKey("Size")]
        public int? SizeId { get; set; }
        public Size? Sizes { get; set; }


        [ForeignKey("Color")]
        public int? ColorId { get; set; }
        public Color? Colors { get; set; }


        //[StringLength(1500)]
        [DataType(DataType.MultilineText)]
        public string? MoTaDai { get; set; }
        [StringLength(500)]
        public string? BinhLuan { get; set; }

        public int? DiemDanhGia { get; set; }
        public int? SoLuongTon { get; set; }
    }
}
