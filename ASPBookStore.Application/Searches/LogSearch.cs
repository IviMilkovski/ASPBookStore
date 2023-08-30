using ASPBookStore.Application.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Searches
{
    public class LogSearch : PagedSearch
    {
        public string? Actor { get; set; }
        public string? UseCaseName { get; set; }
        public string? DateFrom { get; set; }
        public string? DateTo { get; set; }
    }
}
