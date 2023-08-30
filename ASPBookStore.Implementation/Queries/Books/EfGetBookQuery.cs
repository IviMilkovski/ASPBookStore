using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.Application.Queries.Authors;
using ASPBookStore.Application.Queries.Books;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Queries.Books
{
    public class EfGetBookQuery : IGetBookQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EfGetBookQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 16;

        public string Name => "Get book query";

        public BookDto Execute(int id)
        {
            var book = _context.Books
                .Include(c => c.Category)
                .Include(x => x.BookAuthors)
                .ThenInclude(b => b.Author)
                .Where(x => x.Id == id).FirstOrDefault();

            if (book == null)
                throw new EntityNotFoundException(id, typeof(Book));

            return _mapper.Map<BookDto>(book);
        }
    }
}