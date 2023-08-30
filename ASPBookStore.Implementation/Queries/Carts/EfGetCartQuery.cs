using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.Application.Queries;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Queries.Carts
{
    public class EfGetCartQuery : IGetCartQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EfGetCartQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 21;

        public string Name => "Get cart query";

        public FullCartDto Execute(int search)
        {
            var cart = _context.Carts.Include(x => x.Book).Where(x => x.UserId == search).ToList();

            if (cart == null)
                throw new EntityNotFoundException(search, typeof(Cart));

            var all = new List<CartDto>();
            decimal total = 0;

            foreach (var item in cart)
            {
                total += item.Book.Price * item.Quantity;
                all.Add(_mapper.Map<CartDto>(item));
            }

            var fullcart = new FullCartDto
            {
                Items = all,
                Total = total
            };

            return fullcart;

        }
    }
}
