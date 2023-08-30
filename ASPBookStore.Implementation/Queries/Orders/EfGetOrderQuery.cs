using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.Application.Queries.Orders;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using AutoMapper;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Queries.Orders
{
    public class EfGetOrderQuery : IGetOrderQuery
    {
        public int Id => 24;

        public string Name => "Get order";

        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EfGetOrderQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public OrderDto Execute(int search)
        {
            var order = _context.Orders
                .Include(x => x.OrderLines)
                .ThenInclude(x => x.Books)
                .FirstOrDefault(x => x.Id == search);

            if (order == null)
                throw new EntityNotFoundException(search, typeof(Order));

            return _mapper.Map<OrderDto>(order);
        }
    }
}
