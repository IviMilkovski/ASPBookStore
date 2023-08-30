using Application;
using ASPBookStore.Application.Dto;
using ASPBookStore.Application.Searches;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Queries.Logs
{
    public interface IGetAuditLogsQuery : IQuery<LogSearch, PagedResponse<LogDto>>
    {
    }
}
