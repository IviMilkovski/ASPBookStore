using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries.Orders;
using ASPBookStore.Application.Queries;
using ASPBookStore.Application.Searches;
using ASPBookStore.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ASPBookStore.DataAccess;
using Microsoft.EntityFrameworkCore;
using ASPBookStore.Implementation.Extensions;

namespace ASPBookStore.Implementation.Queries.Orders
{
    public class EfGetOrdersQuery : IGetOrdersQuery
    {
        public int Id => 23;

        public string Name => "Get orders query";

        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EfGetOrdersQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public PagedResponse<OrderDto> Execute(OrderSearch search)
        {
            var orders = _context.Orders.Include(x => x.OrderLines).ThenInclude(x => x.Books).AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                search.Keyword = search.Keyword.ToLower().Trim();
                orders = orders
                    .Where(x => x.City.ToLower().Contains(search.Keyword) || x.Address.ToLower().Contains(search.Keyword) || x.OrderLines.Any(x => x.Books.Name.ToLower().Contains(search.Keyword)));
            }

            return orders.Paged<OrderDto, Order>(search, _mapper);
        }
    }
}
