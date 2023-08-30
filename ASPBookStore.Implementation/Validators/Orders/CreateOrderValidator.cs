using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Validators.Orders
{
    public class CreateOrderValidator : AbstractValidator<OrderDto>
    {
        public CreateOrderValidator(ASPBookStoreContext context)
        {
          
            RuleFor(x => x.Address)
                .NotEmpty()
                .WithMessage("Address is required.");

            RuleFor(x => x.City)
                .NotEmpty()
                .WithMessage("City is required.");

            RuleFor(x => x.ZipCode)
                .NotEmpty()
                .WithMessage("ZipCode is required.");

            RuleFor(x => x.Phone)
                .NotEmpty()
                .WithMessage("Phone is required.");

            RuleFor(x => x.Note)
               .MaximumLength(150).WithMessage("Note can have at maximum 150 characters.");

            RuleFor(x => x.DeliverDate)
              .GreaterThan(DateTime.Today)
              .WithMessage("The order date must be in future.");

            RuleFor(x => x.DeliverDate)
                .Must(x => x.TimeOfDay.Hours >= 8 && x.TimeOfDay.Hours <= 20)
                .WithMessage("Delivery time must be between 08:00h and 20:00h.");

            RuleFor(x => x.UserId).Must(uid => context.Carts.Any(x => x.UserId == uid)).WithMessage("You have to have at least one item in cart to make an order.");

        }
    }
}
