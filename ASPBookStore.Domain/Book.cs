using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ASPBookStore.Domain
{
    public class Book : Entity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string Image { get; set; }
        public decimal Price { get; set; }
        public bool IsHot { get; set; }
        public int? NumberOfPages { get; set; }
        public int Quantity { get; set; }
        public int CategoryId { get; set; }
        public virtual Category Category { get; set; }

        public ICollection<BookAuthor> BookAuthors { get; set; } = new HashSet<BookAuthor>();
        public ICollection<OrderLine> OrderLines { get; set; } = new HashSet<OrderLine>();
        public ICollection<Cart> Carts { get; set; } = new HashSet<Cart>();

    }
}
