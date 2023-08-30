﻿using Application;
using ASPBookStore.Application.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Commands.Books
{
    public interface ICreateBookCommand : ICommand<BookDto>
    {
    }
}