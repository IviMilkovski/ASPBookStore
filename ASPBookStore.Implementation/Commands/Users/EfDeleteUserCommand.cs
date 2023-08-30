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

namespace ASPBookStore.Implementation.Commands.Users
{
    public class EfDeleteUserCommand : IDeleteUserCommand
    {
        private readonly ASPBookStoreContext _context;

        public EfDeleteUserCommand(ASPBookStoreContext context)
        {
            _context = context;
        }

        public int Id => 9;

        public string Name => "Delete User";

        public void Execute(int request)
        {
            var user = _context.Users.Find(request);

            if (user == null)
                throw new EntityNotFoundException(request, typeof(User));

            user.Delete();

            _context.SaveChanges();

        }
    }
}

