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
    public class CreateUserValidator : AbstractValidator<UserDto>
    {
        public CreateUserValidator(ASPBookStoreContext context)
        {
            RuleFor(x => x.FirstName)
                .NotEmpty()
                .WithMessage("Firstname is a required field.")
                .MaximumLength(30).WithMessage("Firstname can have at maximum 30 characters.");

            RuleFor(x => x.LastName)
                .NotEmpty()
                .WithMessage("Lastname is a required field.")
                .MaximumLength(40).WithMessage("Lastname can have at maximum 40 characters.");

            RuleFor(x => x.Username)
                .NotEmpty()
                .WithMessage("Username is a required field.")
                .DependentRules(() =>
                    {
                        RuleFor(x => x.Username).Must(u => !context.Users.Any(x => x.Username == u)).WithMessage("That username is already taken!");
                    });

            RuleFor(x => x.Email)
                .NotEmpty()
                .WithMessage("Email is a required field.")
                .EmailAddress()
                .WithMessage("Email has to contain @ in it.");

            RuleFor(x => x.Password)
                .NotEmpty()
                .WithMessage("Password is a required field.")
                .MinimumLength(8)
                .Matches("[A-z0-9]*")
                .WithMessage("Password must have at least 8 characters.");
       
        }
    }
}
