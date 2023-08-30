using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.Application.Queries.Authors;
using ASPBookStore.Application.Queries.Users;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Queries.Authors
{
    public class EfGetAuthorQuery : IGetAuthorQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EfGetAuthorQuery(ASPBookStoreContext context, IMapper mapper)

        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 11;

        public string Name => "Get author query";

        public AuthorDto Execute(int id)
        {
            var author = _context.Authors.Include(x => x.BookAuthors).ThenInclude(b => b.Book).Where(x => x.Id == id).FirstOrDefault();

            if (author == null)
                throw new EntityNotFoundException(id, typeof(Author));

            return _mapper.Map<AuthorDto>(author);
        }
    }
}
