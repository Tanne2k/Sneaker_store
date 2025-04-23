using System.ComponentModel.DataAnnotations;

namespace Lab03.Models
{
    public class ProductImage
    {
        //[Key]
        public int Id { get; set; }
        //public string Url { get; set; }
        public string? Url { get; set; }
        public int? IdProduct { get; set; }   
        //public Product? Product { get; set; }
    }
}
