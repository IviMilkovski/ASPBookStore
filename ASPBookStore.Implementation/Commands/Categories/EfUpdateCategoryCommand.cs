using ASPBookStore.Application.Commands.Categories;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Validators.Categories;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Categories
{
    public class EfUpdateCategoryCommand : IUpdateCategoryCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly UpdateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EfUpdateCategoryCommand(ASPBookStoreContext context, UpdateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 5;

        public string Name => "Update category command";

        public void Execute(CategoryDto request)
        {
            var category = _context.Categories.Find(request.Id);

            if (category == null)
                throw new EntityNotFoundException(request.Id, typeof(Category));

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, category);

            _context.SaveChanges();
        }
    }
}

