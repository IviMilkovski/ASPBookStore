using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Validators.Categories
{
    public class CreateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public CreateCategoryValidator(ASPBookStoreContext context)
        {
            RuleFor(c => c.Name).NotEmpty().WithMessage("The name of the category is required.")
                                .MinimumLength(2).WithMessage("The minimum length of a category name is 3 characters.")
                                .Must(name => !context.Categories.Any(c => c.Name == name))
                                .WithMessage("Category Name must be unique.");
        }
    }
}
