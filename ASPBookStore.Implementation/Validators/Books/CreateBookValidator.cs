using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Validators.Books
{
    public class CreateBookValidator : AbstractValidator<BookDto>
    {
        public CreateBookValidator(ASPBookStoreContext context)
        {
            RuleFor(x => x.Name)
                .NotEmpty()
                .WithMessage("Name is required!");

            RuleFor(x => x.Description)
                .NotEmpty()
                .WithMessage("Description is required!");

            RuleFor(x => x.Image)
                .NotEmpty()
                .WithMessage("Image is required!");

            RuleFor(x => x.Price)
                .GreaterThan(0)
                .WithMessage("Price must be greater than 0!");

            RuleFor(x => x.CategoryId).NotEmpty().WithMessage("Category is required!").DependentRules(() =>
            {
                RuleFor(x => x.CategoryId).Must(cat => context.Categories.Any(c => c.Id == cat)).WithMessage("This category does not exist!");
            }); 
        }
    }
}
