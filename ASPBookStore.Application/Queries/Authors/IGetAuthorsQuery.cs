using Application;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Queries.Authors
{
    public interface IGetAuthorsQuery : IQuery<AuthorSearch, PagedResponse<AuthorDto>>
    {
    }
}
