using ASPBookStore.Application.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Searches
{
    public class OrderSearch : PagedSearch
    {
        public string Keyword { get; set; }
        public DateTime DeliverDate { get; set; }
        public int UserId { get; set; }
    }
}
