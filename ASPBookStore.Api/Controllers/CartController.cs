using ASPBookStore.Application.Commands.Carts;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries;
using ASPBookStore.Application;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPBookStore.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class CartController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public CartController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        //get by user id
        // GET: api/Cart/5
        [HttpGet("{id}", Name = "GetCart")]
        public IActionResult Get(int id, [FromServices] IGetCartQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, id));
        }

        // POST: api/Cart
        [HttpPost]
        public IActionResult Post([FromBody] CartDto dto, [FromServices] ICreateCartCommand command)
        {
            _executor.ExecuteCommand(command, dto);

            return StatusCode(StatusCodes.Status201Created);
        }

        // DELETE: api/Cart/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id, [FromServices] IDeleteCartCommand command)
        {
            _executor.ExecuteCommand(command, id);

            return NoContent();
        }
    }
}