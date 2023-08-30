using Application;
using ASPBookStore.Application.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ASPBookStore.Application.Commands.Authors
{
    public interface IDeleteAuthorCommand : ICommand<int>
    {
    }
}
