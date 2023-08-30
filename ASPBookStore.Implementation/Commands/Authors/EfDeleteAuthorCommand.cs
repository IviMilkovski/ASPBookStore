using ASPBookStore.Application.Commands.Authors;
using ASPBookStore.Application.Commands.Users;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Authors
{
    public class EfDeleteAuthorCommand : IDeleteAuthorCommand
    {
        private readonly ASPBookStoreContext _context;

        public EfDeleteAuthorCommand(ASPBookStoreContext context)
        {
            _context = context;
        }

        public int Id => 14;

        public string Name => "Delete author command";

        public void Execute(int request)
        {
            var author = _context.Authors.Find(request);

            if (author == null)
                throw new EntityNotFoundException(request, typeof(Author));

            author.Delete();

            _context.SaveChanges();

        }
    }
}


