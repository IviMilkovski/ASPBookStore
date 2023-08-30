using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Validators.Users
{
    public class UpdateUserValidator : AbstractValidator<UserDto>
    {
        public UpdateUserValidator(ASPBookStoreContext context)
        {
            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("FirstName is required.")
                .MaximumLength(30).WithMessage("Firstname can have at maximum 30 characters."); ;

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("LastName is required.")
                .MaximumLength(40).WithMessage("Lastname can have at maximum 40 characters."); ;

            RuleFor(x => x.Password)
                .NotEmpty()
                .WithMessage("Password is required.");

            RuleFor(x => x.Email)
                .NotEmpty()
                .WithMessage("Email is required.");

            RuleFor(x => x.Username)
                .NotEmpty()
                .WithMessage("Username is required.")
                .DependentRules(() =>
                    {
                        RuleFor(x => x.Username).Must((dto, un) => !context.Users.Any(x => x.Username == un && x.Id != dto.Id)).WithMessage("This username is already taken!");
                    });
        }
    }
}
