using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Dto
{
    public class AuthorDto : BaseDto
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public IEnumerable<BookAuthorDto> BookAuthors { get; set; } = new List<BookAuthorDto>();
    }
}
