using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Dto
{
    public class LogDto
    {
        public DateTime Date { get; set; }
        public string UseCaseName { get; set; }
        public string Actor { get; set; }
        public string Data { get; set; }
    }
}
