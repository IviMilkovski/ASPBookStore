using ASPBookStore.Application.Dto;
using ASPBookStore.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Profiles
{
    public class OrderProfile : Profile
    {
        public OrderProfile()
        {
            CreateMap<Order, OrderDto>().ForMember(x => x.Items, opt => opt.MapFrom(order => order.OrderLines.Select(ol => new CartDto
            {
                Quantity = ol.Quantity,
                Price = ol.Price,
                BookName = ol.Books.Name,
                BookId = ol.Books.Id,
                UserId = ol.Order.UserId,
            })));
            CreateMap<OrderDto, Order>();
        }
    }
}
