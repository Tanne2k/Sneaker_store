using System.ComponentModel.DataAnnotations;
namespace Lab03.Models
{
    public class Accessory
    {
        public int Id { get; set; }
        [Required, StringLength(50)]
        public string Name { get; set; }
    }
}
