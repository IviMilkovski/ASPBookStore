using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries;
using ASPBookStore.Application.Queries.Books;
using ASPBookStore.Application.Searches;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Extensions;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Queries.Books
{
    public class EfGetBooksQuery : IGetBooksQuery
    {
        public int Id => 17;

        public string Name => "Get books";

        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EfGetBooksQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public PagedResponse<BookDto> Execute(BookSearch search)
        {
            var books = _context.Books.Include(x => x.Category).AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                search.Keyword = search.Keyword.ToLower().Trim();
                books = books.Where(x => x.Name.ToLower().Contains(search.Keyword) || x.Description.ToLower().Contains(search.Keyword));
            }

            if (search.MinPrice.HasValue)
                books = books.Where(x => x.Price >= search.MinPrice);

            if (search.MaxPrice.HasValue)
                books = books.Where(x => x.Price <= search.MaxPrice);

            if (search.CategoryId.HasValue)
                books = books.Where(x => x.CategoryId == search.CategoryId);

            if (search.IsHot.HasValue)
                books = books.Where(x => x.IsHot == search.IsHot);

            return books.Paged<BookDto, Book>(search, _mapper);
        }
    }
}
