using ASPBookStore.Application.Commands.Users;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Exceptions;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Validators.Users;
using AutoMapper;
using FluentValidation;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Commands.Users
{
    public class EFUpdateUserCommand : IUpdateUserCommand
    {
        private readonly ASPBookStoreContext _context;
        private readonly UpdateUserValidator _validator;
        private readonly IMapper _mapper;

        public EFUpdateUserCommand(ASPBookStoreContext context, UpdateUserValidator validator, IMapper mapper)
        {
            _context = context;
            _validator = validator;
            _mapper = mapper;
        }

        public int Id => 10;

        public string Name => "Update User";

        public void Execute(UserDto request)
        {
            var user = _context.Users.Include(x => x.UserUseCases).FirstOrDefault(x => x.Id == request.Id);

            if (user == null)
                throw new EntityNotFoundException(request.Id, typeof(User));

            _validator.ValidateAndThrow(request);

            _mapper.Map(request, user);

            user.UserUseCases.Clear();

            foreach (var item in _context.UserUseCases)
            {
                _context.UserUseCases.Add(new UserUseCase
                {
                    UseCaseId = item.UseCaseId,
                    UserId = request.Id
                });
            }

            _context.SaveChanges();
        }
    }
}

