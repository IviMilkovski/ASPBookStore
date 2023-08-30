﻿using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Dto
{
    public class BookDto : BaseDto
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public IFormFile? UploadedImage { get; set; }
        public decimal Price { get; set; }
        public int Quantity { get; set; }
        public bool? IsHot { get; set; }
        public int? NumberOfPages { get; set; }
        public string? CategoryName { get; set; }
        public int CategoryId { get; set; }

        public IEnumerable<BookAuthorDto> BookAuthors { get; set; } = new List<BookAuthorDto>();
    }
}
