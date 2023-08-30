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
    public class CartProfile : Profile
    {
        public CartProfile()
        {
            CreateMap<Cart, CartDto>().ForMember(x => x.BookName, opt => opt.MapFrom(x => x.Book.Name)).ForMember(x => x.Price, opt => opt.MapFrom(x => x.Book.Price));
            CreateMap<CartDto, Cart>();
        }
    }
}
