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
    public class UpdateCategoryValidator : AbstractValidator<CategoryDto>
    {
        public UpdateCategoryValidator(ASPBookStoreContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Category name is required")
                .DependentRules(() =>
            {
                RuleFor(x => x.Name)
                .Must((dto, name) => !context.Categories
                .Any(x => x.Name == name && x.Id != dto.Id))
                .WithMessage("This name already exists!");
            });
        }
    }
}
