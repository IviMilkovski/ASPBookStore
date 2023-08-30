using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.Application.Queries.Categories;
using ASPBookStore.Application.Queries;
using ASPBookStore.Application.Searches;
using ASPBookStore.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPBookStore.DataAccess;
using ASPBookStore.Application.Commands.Categories;
using ASPBookStore.Implementation.Validators.Categories;
using FluentValidation;
using ASPBookStore.Implementation.Extensions;

namespace ASPBookStore.Implementation.Queries.Categories
{
    public class EFGetCategoriesQuery : IGetCategoriesQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EFGetCategoriesQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 1;

        public string Name => "get categories query";

        public PagedResponse<CategoryDto> Execute(CategorySearch search)
        {
            var categories = _context.Categories.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name))
            {
                search.Name = search.Name.ToLower().Trim();
                categories = categories.Where(x => x.Name.ToLower().Contains(search.Name));
            }

            return categories.Paged<CategoryDto, Category>(search, _mapper);
        }
    }

    public class EFGetCategoryQuery : IGetCategoryQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EFGetCategoryQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 2;

        public string Name => "get category query";

        public CategoryDto Execute(int id)
        {
            var category = _context.Categories.Find(id);

            if (category == null)
                throw new EntityNotFoundException(id, typeof(Category));

            return (_mapper.Map<CategoryDto>(category));
        }
    }
}