using ASPBookStore.Application.Commands.Authors;
using ASPBookStore.Application.Commands.Categories;
using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Validators.Authors;
using ASPBookStore.Implementation.Validators.Categories;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Authors
{
    public class EfCreateAuthorCommand : ICreateAuthorCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly CreateAuthorValidator _validator;
        private readonly IMapper _mapper;

        public EfCreateAuthorCommand(ASPBookStoreContext context, CreateAuthorValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 13;

        public string Name => "Create New Author";

        public void Execute(AuthorDto request)
        {
            _validator.ValidateAndThrow(request);

            var author = _mapper.Map<Author>(request);

            _context.Authors.Add(author);

            _context.SaveChanges();
        }
    }
}

