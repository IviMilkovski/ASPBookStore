using ASPBookStore.Application;
using ASPBookStore.Application.Commands.Carts;
using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Validators;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Carts
{
    public class EfCreateCartCommand : ICreateCartCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly CreateCartValidator _validator;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;

    public EfCreateCartCommand(ASPBookStoreContext context, CreateCartValidator validator, IMapper mapper, IApplicationActor actor)
    {
        _context = context;
        _validator = validator;
        _mapper = mapper;
        _actor = actor;
    }

    public int Id => 22;

    public string Name => "Create cart command";

    public void Execute(CartDto request)
    {
        request.UserId = _actor.Id;

        _validator.ValidateAndThrow(request);

        _context.Books.Find(request.BookId).Quantity -= request.Quantity;

        var books = _context.Carts.FirstOrDefault(x => x.UserId == request.UserId && x.BookId == request.BookId);

        if (books != null)
            books.Quantity += request.Quantity;
        else
            _context.Carts.Add(_mapper.Map<Cart>(request));

        _context.SaveChanges();
    }
   }
}