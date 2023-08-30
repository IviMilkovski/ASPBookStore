using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Dto
{
    public class OrderDto : BaseDto
    {
        public string Address { get; set; }
        public string City { get; set; }
        public string ZipCode { get; set; }
        public string Phone { get; set; }
        public string? Note { get; set; }
        public DateTime DeliverDate { get; set; }
        public int UserId { get; set; }

        public IEnumerable<CartDto> Items { get; set; } = new List<CartDto>(); 
    }
}
