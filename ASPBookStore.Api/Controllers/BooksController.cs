using ASPBookStore.Application;
using ASPBookStore.Application.Commands.Books;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries.Books;
using ASPBookStore.Application.Searches;
using ASPBookStore.Implementation.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPBookStore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;
        private readonly IApplicationActor _actor;

        public BooksController(UseCaseExecutor executor, IApplicationActor actor)
        {
            _executor = executor;
            _actor = actor;
        }

        // GET: api/Books
        [HttpGet]
        public IActionResult Get([FromQuery] BookSearch search, [FromServices] IGetBooksQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Books/5
        [HttpGet("{id}", Name = "GetBooks")]
        public IActionResult Get(int id, [FromServices] IGetBookQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Books
        [Authorize]
        [HttpPost]
        public IActionResult Post([FromForm] BookDto dto, [FromServices] ICreateBookCommand command)
        {
           
            _executor.ExecuteCommand(command, dto);

            return StatusCode(201);

        }

        // PUT: api/Books/5
        [Authorize]
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] BookDto dto, [FromServices] IUpdateBookCommand command)
        {
            dto.Id = id;

            _executor.ExecuteCommand(command, dto);

            return NoContent();
        }

        // DELETE: api/Books/5
        [Authorize]
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteBookCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}
