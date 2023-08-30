using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.Application.Queries.Users;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Queries.Users
{
    public class EFGetUserQuery : IGetUserQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EFGetUserQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 8;

        public string Name => "Get user query";

        public UserDto Execute(int id)
        {
            var user = _context.Users.Find(id);

            if (user == null)
                throw new EntityNotFoundException(id, typeof(User));

            return _mapper.Map<UserDto>(user);
        }
    }
}
