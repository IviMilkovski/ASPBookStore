using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries.Users;
using ASPBookStore.Application.Queries;
using ASPBookStore.Application.Searches;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPBookStore.Implementation.Extensions;
using ASPBookStore.Application.Queries.Authors;
using Microsoft.EntityFrameworkCore;

namespace ASPBookStore.Implementation.Queries.Authors
{
    public class EfGetAuthorsQuery : IGetAuthorsQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EfGetAuthorsQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 12;

        public string Name => "get authors query";

        public PagedResponse<AuthorDto> Execute(AuthorSearch search)
        {
            var authors = _context.Authors.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name))
            {
                search.Name = search.Name.ToLower().Trim();
                authors = authors.Include(x => x.BookAuthors).ThenInclude(p => p.Book);
                authors = authors.Where(x => x.FirstName.ToLower().Contains(search.Name) || x.LastName.ToLower().Contains(search.Name));
            }

            return authors.Paged<AuthorDto, Author>(search, _mapper);
        }
    }

}
