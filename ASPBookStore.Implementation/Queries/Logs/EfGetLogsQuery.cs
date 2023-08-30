using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Queries;
using ASPBookStore.Application.Queries.Logs;
using ASPBookStore.Application.Searches;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using ASPBookStore.Implementation.Extensions;
using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Queries.Logs
{
    public class EfGetLogsQuery : IGetAuditLogsQuery
    {
        private readonly ASPBookStoreContext _context;
        private readonly IMapper _mapper;

        public EfGetLogsQuery(ASPBookStoreContext context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 26;

        public string Name => "Get logs";

        public PagedResponse<LogDto> Execute(LogSearch search)
        {
            var logs = _context.AuditLogs.AsQueryable();

            if (!string.IsNullOrEmpty(search.Actor))
            {
                search.Actor = search.Actor.ToLower().Trim();
                logs = logs.Where(x => x.Actor.ToLower().Contains(search.Actor));
            }

            if (!string.IsNullOrEmpty(search.UseCaseName))
            {
                search.UseCaseName = search.UseCaseName.ToLower().Trim();
                logs = logs.Where(x => x.UseCaseName.ToLower().Contains(search.UseCaseName));
            }

            if (search.DateFrom != null)
                logs = logs.Where(x => x.Date.Date >= DateTime.Parse(search.DateFrom).Date);

            if (search.DateTo != null)
                logs = logs.Where(x => x.Date.Date <= DateTime.Parse(search.DateTo).Date);

            return logs.Paged<LogDto, AuditLog>(search, _mapper);
        }
    }
}
