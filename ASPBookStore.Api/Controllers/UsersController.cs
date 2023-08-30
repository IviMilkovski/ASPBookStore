using ASPBookStore.Application.Commands.Users;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries.Users;
using ASPBookStore.Application.Searches;
using ASPBookStore.Application;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPBookStore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsersController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public UsersController(UseCaseExecutor executor)
        {
            _executor = executor;
        }
        [Authorize]
        // GET: api/Users
        [HttpGet]
        public IActionResult Get([FromQuery] UserSearch search, [FromServices] IGetUsersQuery query)
        {
            ;
            return Ok(_executor.ExecuteQuery(query, search));
        }
        [Authorize]
        // GET: api/Users/5
        [HttpGet("{id}", Name = "Users")]
        public IActionResult Get(int id, [FromServices] IGetUserQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Users
        [HttpPost]
        public IActionResult Post([FromBody] UserDto user, [FromServices] ICreateUserCommand command)
        {
            _executor.ExecuteCommand(command, user);

            return StatusCode(201);
        }

        // PUT: api/Users/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] UserDto dto, [FromServices] IUpdateUserCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);

            return NoContent();
        }

        // DELETE: api/Users/5 
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteUserCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}