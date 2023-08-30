using ASPBookStore.Application.Searches;
using ASPBookStore.Application;
using ASPBookStore.Implementation.Queries.Logs;
using Microsoft.AspNetCore.Mvc;
using ASPBookStore.Application.Queries.Logs;
using Microsoft.AspNetCore.Authorization;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPBookStore.Api.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class LogsController : ControllerBase
    {
        private readonly UseCaseExecutor _executor;

        public LogsController(UseCaseExecutor executor)
        {
            _executor = executor;
        }

        // GET: api/Logs
        [HttpGet]
        public IActionResult Get([FromQuery] LogSearch search, [FromServices] IGetAuditLogsQuery query)
        {
            return Ok(_executor.ExecuteQuery(query, search));
        }
    }
}
