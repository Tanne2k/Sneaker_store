using Microsoft.AspNetCore.Mvc.ModelBinding.Validation;
using MimeKit.Encodings;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Lab03.Models
{
    public class Blog
    {

        public string Id { get; set; }


        [StringLength(100, MinimumLength = 5)]
        public string Title { get; set; }


        [DataType(DataType.Date)]
        public DateTime PostDate { get; set; }


        public string Content { get; set; }

    }
}

