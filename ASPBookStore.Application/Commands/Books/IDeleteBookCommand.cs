using Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Commands.Books
{
    public interface IDeleteBookCommand : ICommand<int>
    {
    }
}
