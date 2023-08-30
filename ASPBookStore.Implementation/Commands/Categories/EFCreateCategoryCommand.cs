using ASPBookStore.Application.Commands.Categories;
using ASPBookStore.Application.Dto;
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
    public class EFCreateUserCommand : ICreateCategoryCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly CreateCategoryValidator _validator;
        private readonly IMapper _mapper;

        public EFCreateUserCommand(ASPBookStoreContext context, CreateCategoryValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 23;

        public string Name => "Create New Category";

        public void Execute(CategoryDto request)
        {
            _validator.ValidateAndThrow(request);

            var category = _mapper.Map<Category>(request);

            _context.Categories.Add(category);

            _context.SaveChanges();
        }
    }
}

