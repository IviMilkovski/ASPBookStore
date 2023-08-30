using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Application.Dto
{
    public class CartDto : BaseDto
    {
        public int Quantity { get; set; }
        public decimal Price { get; set; }
        public int BookId { get; set; }
        public string? BookName { get; set; }
        public int UserId { get; set; }
    }

    public class FullCartDto
    {
        public IEnumerable<CartDto> Items { get; set; } = new HashSet<CartDto>();
        public decimal Total { get; set; }
    }
}
