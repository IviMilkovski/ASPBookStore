using ASPBookStore.Application;
using ASPBookStore.Application.Commands.Orders;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Email;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Validators.Orders;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Orders
{
    public class EfCreateOrderCommand : ICreateOrderCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly CreateOrderValidator _validator;
        private readonly IEmailSender _sender;
        private readonly IMapper _mapper;
        private readonly IApplicationActor _actor;

        public EfCreateOrderCommand(ASPBookStoreContext context, CreateOrderValidator validator, IEmailSender sender, IMapper mapper, IApplicationActor actor)
        {
            _context = context;
            _validator = validator;
            _sender = sender;
            _mapper = mapper;
            _actor = actor;
        }

        public int Id => 25;

        public string Name => "Create order";

        public void Execute(OrderDto request)
        {
            request.UserId = _actor.Id;

            _validator.ValidateAndThrow(request);

            var usersEmail = _context.Users.Find(request.UserId).Email;

            var order = _mapper.Map<Order>(request);

            var usersCart = _context.Carts.Where(x => x.UserId == request.UserId).ToList();

            foreach (var item in usersCart)
            {
                var book = _context.Books.Find(item.BookId);

                order.OrderLines.Add(new OrderLine
                {
                    BookId = item.BookId,
                    Quantity = item.Quantity,
                    Name = book.Name,
                    Price = book.Price
                });
            }

            var cart = _context.Carts.Where(x => x.UserId == request.UserId);

            _context.Carts.RemoveRange(cart);

            _context.Orders.Add(order);

            _context.SaveChanges();

            //_sender.Send(new SendEmailDto
            //{
            //    SendTo = usersEmail,
            //    Subject = "Your order is ready",
            //    Content = "You have successfully made an order! We will keep you updated on it's delivery."
            //});
            //ne radi vise ovaj nacin slanja mejla
        }
    }
}

