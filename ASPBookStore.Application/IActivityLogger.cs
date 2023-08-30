using Application;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application
{
    public interface IActivityLogger
    {
        void Log(IUseCase userCase, IApplicationActor actor, object useCaseData);
    }
}
