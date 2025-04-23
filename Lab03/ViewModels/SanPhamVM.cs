using Lab03.Models; 
using System.ComponentModel.DataAnnotations;

namespace Lab03.ViewModels
{
    public class SanPhamVM
    {
        public int MaSP { get; set; }
        public string? TenSP { get; set; }
        public decimal Gia { get; set; }
        public string MoTa { get; set; }
        public string Hinh { get; set; }
        public string TenLoai { get; set;}
        public string Kichco { get; set; }
        public string Mau { get; set; }

        public List<Size>? Sizes { get; set; }
        public List<Color>? Colors { get; set; }
        public List<ProductImage>? Images { get; set; }
        public List<Category>? Categories { get; set; }

        public string? MoTaDai { get; set; }
        public string? BinhLuan { get; set; }
        public int? DiemDanhGia { get; set; }
        public int? SoLuongTon { get; set; }

    }

    public class ChiTietSanPhamVM
    {
        public int MaSP { get; set; }
        public string? TenSP { get; set; }
        public decimal Gia { get; set; }
        public string MoTa { get; set; }
        public string Hinh { get; set; }
        public string? SideImage1 { get; set; }
        public string? SideImage2 { get; set; }
        public string? SideImage3 { get; set; }
        public string TenLoai { get; set; }
        public int DiemDanhGia { get; set; }
        public int SoLuongTon { get; set; }
        public string ChiTiet { get; set; }
        //public string Kichco { get; set; }
        //public string Mau { get; set; }
        public List<Size>? Sizes { get; set; }
        public List<Color>? Colors { get; set; }
        public List<ProductImage>? Images { get; set; }

        public string? MoTaDai { get; set; }
        public string? BinhLuan { get; set; }

        //public string SanPhamTuongTu { get; set; }
        public List<SanPhamVM> SimilarProducts { get; set; }
    }

}
