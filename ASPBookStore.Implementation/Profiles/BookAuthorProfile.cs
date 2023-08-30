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
    public class BookAuthorProfile : Profile
    {
        public BookAuthorProfile()
        {
            CreateMap<BookAuthor, BookAuthorDto>();
            CreateMap<BookAuthorDto, BookAuthor>();
        }
    }
}
