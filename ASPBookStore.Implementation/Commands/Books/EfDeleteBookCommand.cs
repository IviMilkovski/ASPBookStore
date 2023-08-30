using ASPBookStore.Application.Commands.Books;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Extensions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Books
{
    public class EfDeleteBookCommand : IDeleteBookCommand
    {
        private readonly ASPBookStoreContext _context;

        public EfDeleteBookCommand(ASPBookStoreContext context)
        {
            _context = context;
        }

        public int Id => 19;

        public string Name => "Delete book command";

        public void Execute(int request)
        {
            var book = _context.Books.Find(request);

            if (book == null)
                throw new EntityNotFoundException(request, typeof(Book));

            book.Delete();

            _context.SaveChanges();
        }
    }
}

