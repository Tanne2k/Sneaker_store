using Lab03.Models;
using Lab03.Repositories;

namespace Lab03.ViewModels
{
    public class HomeViewModel
    {
        public List<Product> Products { get; set; }
        public List<string> nameProducts { get; set; }
        public List<decimal> price {  get; set; }
        public List<string> imageUrl { get; set; }

    }
}
