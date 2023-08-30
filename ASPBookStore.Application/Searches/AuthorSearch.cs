﻿using ASPBookStore.Application.Queries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Searches
{
    public class AuthorSearch : PagedSearch
    {
        public string Name { get; set; }
    }
}
