using Application;
using ASPBookStore.Application;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Implementation.Logging
{
    public class DatabaseUseCaseLogger : IActivityLogger
    {
        private readonly ASPBookStoreContext _context;

        public DatabaseUseCaseLogger(ASPBookStoreContext context)
        {
            _context = context;
        }

        public void Log(IUseCase userCase, IApplicationActor actor, object useCaseData)
        {
            var newActivity = new AuditLog
            {
                Actor = actor.Identity,
                UseCaseName = userCase.Name,
                Data = JsonConvert.SerializeObject(useCaseData),
                Date = DateTime.UtcNow
            };

            _context.AuditLogs.Add(newActivity);

            _context.SaveChanges();
        }
    }
}
