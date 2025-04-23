using Microsoft.AspNetCore.Mvc;

namespace Lab03.Controllers
{
    public class BlogController : Controller
    {
        public IActionResult Blog_Index()
        {
            return View();
        }
    }
}
