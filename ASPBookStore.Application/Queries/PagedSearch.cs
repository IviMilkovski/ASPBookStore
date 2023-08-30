using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Queries
{
    public abstract class PagedSearch
    {
        public int PerPage { get; set; } = 6;
        public int Page { get; set; } = 1;
    }
}
