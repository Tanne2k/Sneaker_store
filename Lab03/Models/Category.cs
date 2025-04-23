using System.ComponentModel.DataAnnotations;

namespace Lab03.Models
{
    public class Category
    {
        [Key]
        public int Id { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tên loại sản phẩm"), StringLength(50)]
        public string Name { get; set; }
        public string? ImgUrl { get; set; }
        public List<Product>? Products { get; set; }
    }
}
