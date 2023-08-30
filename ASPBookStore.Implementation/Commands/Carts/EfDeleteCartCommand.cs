using ASPBookStore.Application.Commands.Carts;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Carts
{
    public class EfDeleteCartCommand : IDeleteCartCommand
    {
        private readonly ASPBookStoreContext _context;

        public EfDeleteCartCommand(ASPBookStoreContext context)
        {
            _context = context;
        }

        public int Id => 22;

        public string Name => "Delete cart command";

        public void Execute(int request)
        {
            var cart = _context.Carts.Find(request);

            if (cart == null)
                throw new EntityNotFoundException(request, typeof(Cart));

            var item = _context.Carts.Find(request);

            _context.Books.Find(item.BookId).Quantity += item.Quantity;
            _context.Carts.Remove(cart);
            _context.SaveChanges();
        }
    }
}