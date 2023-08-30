using ASPBookStore.Application.Commands.Users;
using ASPBookStore.Application.Dto;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Queries.Users;
using ASPBookStore.Implementation.Validators.Users;
using AutoMapper;
using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Users
{
    public class EfCreateUserCommand : ICreateUserCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly CreateUserValidator _validator;
        private readonly IEnumerable<int> useCasesForUser = new List<int> { 1,2,8,11,12,16,17,21,22,24,25 };

        public EfCreateUserCommand(ASPBookStoreContext context, CreateUserValidator validator)
        {
            _context = context;
            _validator = validator;
        }

        public int Id => 6;

        public string Name => "Create User";

        public void Execute(UserDto request)
        {
            _validator.ValidateAndThrow(request);

            var user = new User
            {
                FirstName = request.FirstName,
                LastName = request.LastName,
                Username = request.Username,
                Email = request.Email,
                Password = HashPassword.Encrypt(request.Password)
            };

            _context.Users.Add(user);

            foreach (var item in useCasesForUser)
            {
                user.UserUseCases.Add(new UserUseCase
                {
                    UseCaseId = item
                });
            }

            _context.SaveChanges();
        }
    }
}

