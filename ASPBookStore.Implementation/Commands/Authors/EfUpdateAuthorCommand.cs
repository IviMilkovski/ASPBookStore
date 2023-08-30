using ASPBookStore.Application.Commands.Authors;
using ASPBookStore.Application.Commands.Users;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Validators.Authors;
using ASPBookStore.Implementation.Validators.Users;
using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Authors
{
    public class EfUpdateAuthorCommand : IUpdateAuthorCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly UpdateAuthorValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateAuthorCommand(ASPBookStoreContext context, UpdateAuthorValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 15;

        public string Name => "Update author command";

        public void Execute(AuthorDto request)
        {
            var author = _context.Authors.Find(request.Id);

            if (author == null)
                throw new EntityNotFoundException(request.Id, typeof(Author));

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, author);

            _context.SaveChanges();
        }
    }
}

