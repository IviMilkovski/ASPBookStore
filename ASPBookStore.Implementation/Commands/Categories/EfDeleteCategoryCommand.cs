using ASPBookStore.Application.Commands.Categories;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Categories
{
    public class EfDeleteCategoryCommand : IDeleteCategoryCommand
    {
        private readonly ASPBookStoreContext _context;

        public EfDeleteCategoryCommand(ASPBookStoreContext context)
        {
            _context = context;
        }

        public int Id => 4;

        public string Name => "Delete category command";

        public void Execute(int id)
        {
            var category = _context.Categories.Include(x => x.Books).FirstOrDefault(x => x.Id == id);

            if (category.Books.Any())
                throw new ConflictBetweenEntitiesException(id, typeof(Category), typeof(Book));

            if (category == null)
                throw new EntityNotFoundException(id, typeof(Category));

            category.Delete();

            _context.SaveChanges();
        }
    }
}

