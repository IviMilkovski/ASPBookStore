using ASPBookStore.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Dto
{
    public class BookAuthorDto
    {
        public int BookId { get; set; }
        public int AuthorId { get; set; }
    }
}
