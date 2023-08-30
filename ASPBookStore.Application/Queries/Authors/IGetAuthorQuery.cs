using Application;
using ASPBookStore.Application.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Queries.Authors
{
    public interface IGetAuthorQuery : IQuery<int, AuthorDto>
    {
    }
}
