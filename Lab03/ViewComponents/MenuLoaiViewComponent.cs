using Lab03.Models;
using Lab03.ViewModels;
using Microsoft.AspNetCore.Mvc;

namespace Lab03.ViewComponents
{
    public class MenuLoaiViewComponent : ViewComponent
    {
        private readonly ApplicationDbContext db;

        public MenuLoaiViewComponent(ApplicationDbContext context) => db = context;
    
        public IViewComponentResult Invoke()
        {
            var data = db.Categories./*AsQueryable().*/Select(loai => new MenuLoaiVM
            {
                MaLoai = loai.Id, 
                TenLoai = loai.Name,
                SoLuong = loai.Products.Count

            }).OrderBy(p => p.TenLoai);

            return View(data);
        }

    }
}
