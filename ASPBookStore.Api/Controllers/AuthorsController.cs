using ASPBookStore.Application;
using ASPBookStore.Application.Commands.Authors;
using ASPBookStore.Application.Commands.Categories;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries.Authors;
using ASPBookStore.Application.Queries.Categories;
using ASPBookStore.Application.Searches;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPBookStore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthorsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public AuthorsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Authors
        [HttpGet]
        public IActionResult Get([FromQuery] AuthorSearch search, [FromServices] IGetAuthorsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }

        // GET: api/Authors/5
        [HttpGet("{id}", Name = "GetAuthors")]
        public IActionResult Get(int id, [FromServices] IGetAuthorQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        [Authorize]
        // POST: api/Authors
        [HttpPost]
        public IActionResult Post([FromBody] AuthorDto dto, [FromServices] ICreateAuthorCommand command)
        {
            _executor.ExecuteCommand(command, dto);
            return StatusCode(201);
        }

        [Authorize]
        //PUT: api/Authors/5
        [HttpPut("{id}")]
        public IActionResult Put(int id, [FromBody] AuthorDto dto, [FromServices] IUpdateAuthorCommand command)
        {
            dto.Id = id;
            _executor.ExecuteCommand(command, dto);

            return NoContent();
        }

        [Authorize]
        // DELETE: api/Authors/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteAuthorCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}
