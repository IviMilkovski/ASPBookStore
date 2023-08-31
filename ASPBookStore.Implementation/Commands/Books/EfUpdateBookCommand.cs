using ASPBookStore.Application.Commands.Books;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
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
    public class EfUpdateBookCommand : IUpdateBookCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly UpdateBookValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateBookCommand(ASPBookStoreContext context, UpdateBookValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 20;

        public string Name => "Update book command";

          public void Execute(BookDto request)
        {
            var book = _context.Books.Find(request.Id);

            if (book == null)
                throw new EntityNotFoundException(request.Id, typeof(Book));

            var newFileName = CommandableExtensions.UploadImage(request.UploadedImage);
            book.Image = newFileName;

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, book);

            _context.SaveChanges();
        }
    }
}


