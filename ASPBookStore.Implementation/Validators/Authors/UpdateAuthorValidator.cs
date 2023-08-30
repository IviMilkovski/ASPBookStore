using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Validators.Authors
{
    public class UpdateAuthorValidator : AbstractValidator<AuthorDto>
    {
        public UpdateAuthorValidator(ASPBookStoreContext context)
        {
            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("Firstname is a required field.")
                .MaximumLength(30).WithMessage("Firstname can have at maximum 30 characters.");

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Lastname is a required field.")
                .MaximumLength(40).WithMessage("Lastname can have at maximum 40 characters.");
        }
    }
}

