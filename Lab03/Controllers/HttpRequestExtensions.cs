using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;

namespace Lab03.Controllers
{
    //public class HttpRequestExtensions : Controller
    //{
    //    public IActionResult Index()
    //    {
    //        return View();
    //    }
    //}

    public static class HttpRequestExtensions
    {
        private const string XmlHttpRequestHeader = "X-Requested-With";
        private const string XmlHttpRequestValue = "XMLHttpRequest";

        public static bool IsAjaxRequest(this HttpRequest request)
        {
            if (request == null)
            {
                throw new ArgumentNullException(nameof(request));
            }

            if (request.Headers != null)
            {
                return request.Headers[XmlHttpRequestHeader] == XmlHttpRequestValue;
            }

            return false;
        }
    }

}




