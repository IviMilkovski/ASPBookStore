using ASPBookStore.Application.Commands.Books;
using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Extensions;
using ASPBookStore.Implementation.Validators.Books;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Books
{
    public class EfCreateBookCommand : ICreateBookCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly CreateBookValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateBookCommand(ASPBookStoreContext context, CreateBookValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 18;

        public string Name => "Create book command";

        public void Execute(BookDto request)
        {

            _validator.ValidateAndThrow(request);

            var newFileName = CommandableExtensions.UploadImage(request.UploadedImage);

            var book = _mapper.Map<Book>(request);
            book.Image = newFileName;

            _context.Books.Add(book);

            _context.SaveChanges();
        }
    }
}

