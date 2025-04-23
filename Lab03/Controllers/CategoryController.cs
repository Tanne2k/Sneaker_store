//using Lab03.Repositories;
//using Microsoft.AspNetCore.Mvc;

//namespace Lab03.Controllers
//{
//    public class CategoryController : Controller
//    {
//        public IActionResult Index()
//        {
//            return View();
//        }
//    }
//}


//using Lab03.Repositories;
//using Microsoft.AspNetCore.Mvc;
//using System.Threading.Tasks;

//namespace Lab03.Controllers
//{
//    public class CategoryController : Controller
//    {
//        private readonly ICategoryRepository _categoryRepository;

//        public CategoryController(ICategoryRepository categoryRepository)
//        {
//            _categoryRepository = categoryRepository;
//        }

//        public async Task<IActionResult> Menu()
//        {
//            var categories = await _categoryRepository.GetAllAsync();
//            return PartialView("_CategoryMenu", categories);
//        }
//    }
//}

using Lab03.Repositories;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace Lab03.ViewComponents
{
    public class CategoryMenuViewComponent : ViewComponent
    {
        private readonly ICategoryRepository _categoryRepository;

        public CategoryMenuViewComponent(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }

        public async Task<IViewComponentResult> InvokeAsync()
        {
            var categories = await _categoryRepository.GetAllAsync();
            return View(categories);
        }
    }
}
