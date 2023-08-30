using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Validators
{
    public class CreateCartValidator : AbstractValidator<CartDto>
    {
        private readonly ASPBookStoreContext _context;

        public CreateCartValidator(ASPBookStoreContext context)
        {
            _context = context;

            RuleFor(x => x.BookId)
                .Must(BookExists)
                .WithMessage("Book with the id of {PropertyValue} doesn't exist.")
                .DependentRules(() =>
            {
                RuleFor(x => x.Quantity)
                .GreaterThan(0)
                .WithMessage("Quantity must be greater than 0!")
                .Must(QuantityDoesentExeedProductQuantity).WithMessage(dto =>
                {
                    var leftInStock = _context.Books.Find(dto.BookId).Quantity;
                    return $"We currently don't have ({dto.Quantity}) of this book available. There's {leftInStock} left in stock.";
                });//dodala sam quantity tek sad 
            });
        }

        private bool BookExists(int bookId)
        {
            return _context.Books.Any(x => x.Id == bookId);
        }

        public bool QuantityDoesentExeedProductQuantity(CartDto dto, int quantity)
        {
            return _context.Books.Find(dto.BookId).Quantity >= quantity;
        }
    }
}

