using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries.Users;
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
using ASPBookStore.Implementation.Extensions;

namespace ASPBookStore.Implementation.Queries.Users
{
    public class EFGetUsersQuery : IGetUsersQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EFGetUsersQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 7;

        public string Name => "get users query";

        public PagedResponse<UserDto> Execute(UserSearch search)
        {
            var users = _context.Users.AsQueryable();

            if (!string.IsNullOrEmpty(search.Keyword))
            {
                search.Keyword = search.Keyword.ToLower().Trim();
                users = users.Where(x => x.Username.ToLower().Contains(search.Keyword) || x.FirstName.ToLower().Contains(search.Keyword) || x.LastName.ToLower().Contains(search.Keyword) || x.Email.ToLower().Contains(search.Keyword));
            }

            return users.Paged<UserDto, User>(search, _mapper);
        }
    }

}
