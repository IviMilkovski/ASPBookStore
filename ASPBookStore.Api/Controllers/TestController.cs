using Microsoft.AspNetCore.Mvc;
using Bogus;
using ASPBookStore.DataAccess;
using ASPBookStore.Domain;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Security.Cryptography;
using System.Text;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ASPBookStore.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestController : ControllerBase
    {

        private readonly ASPBookStoreContext _context;

        public TestController(ASPBookStoreContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var categories = new List<Category>
            {
                new Category
                {
                    Name = "Fantasy",
                },
                new Category
                {
                    Name = "Romance"
                },
                new Category
                {
                    Name = "Contemporary"
                },
                new Category
                {
                    Name = "Thriller"
                },
                new Category
                {
                    Name = "Children"
                },
                new Category
                {
                    Name = "Classic"
                }
            };

            var authors = new List<Author>
            {
                new Author
                {
                    FirstName = "Mila",
                    LastName = "Milic"
                },
                new Author
                {
                    FirstName = "Alice",
                    LastName = "Smith"
                },
                new Author
                {
                    FirstName = "Emily",
                    LastName = "Bilins"
                },
                new Author
                {
                    FirstName = "John",
                    LastName = "Green"
                },
                new Author
                {
                    FirstName = "Stefan",
                    LastName = "Ilic"
                },
                new Author
                {
                    FirstName = "Ivo",
                    LastName = "Andric"
                },
                new Author
                {
                    FirstName = "Mirko",
                    LastName = "Nikolic"
                }
            };

            var users = new List<User>();

            for (int i = 11; i <= 20; i++)
            {
                var user = new Faker<User>()
                    .RuleFor(x => x.FirstName, x => x.Name.FirstName())
                    .RuleFor(x => x.LastName, x => x.Name.LastName())
                    .RuleFor(x => x.Username, x => x.Person.UserName)
                    .RuleFor(x => x.Email, x => x.Internet.ExampleEmail())
                    .RuleFor(x => x.Password, x => BCrypt.Net.BCrypt.HashPassword("Sifra123$"));

                users.Add(user);
            }

            var books = new List<Book>();
            for (int i = 11; i <= 20; i++)
            {
                var book = new Faker<Book>()
                    .RuleFor(x => x.Description, x => x.Lorem.Sentence(6))
                    .RuleFor(x => x.Name, x => x.Commerce.ProductName())
                    .RuleFor(x => x.Image, x => x.Image.PicsumUrl())
                    .RuleFor(x => x.Price, x => x.Finance.Amount())
                    .RuleFor(x => x.Quantity, x => x.Random.Number(0,100))
                    .RuleFor(x => x.IsHot, x => x.Random.Bool())
                    .RuleFor(x => x.CategoryId, x => x.Random.Number(1,6));


                books.Add(book);
            }

            var bookAuthors = new List<BookAuthor>
            {
                new BookAuthor
                {
                    AuthorId = 2,
                    BookId = 21
                },
                new BookAuthor
                {
                    AuthorId = 2,
                    BookId = 15
                },
                new BookAuthor
                {
                    AuthorId = 1,
                    BookId = 23
                },
                new BookAuthor
                {
                    AuthorId = 6,
                    BookId = 20
                },
                new BookAuthor
                {
                    AuthorId = 6,
                    BookId = 18
                },
                new BookAuthor
                {
                    AuthorId = 3,
                    BookId = 19
                },
            };
            //for (int i = 11; i <= 20; i++)
            //{
            //    var bookAuthor = new Faker<BookAuthor>()
            //        .RuleFor(x => x.AuthorId, x => x.Random.Number(1, 7))
            //        .RuleFor(x => x.BookId, x => x.Random.Number(15, 24));

            //        bookAuthors.Add(bookAuthor);
            //}


                //_context.Authors.AddRange(authors);
                //_context.Users.AddRange(users);
                //_context.Categories.AddRange(categories);
                //_context.Books.AddRange(books);
                _context.BookAuthors.AddRange(bookAuthors);

            _context.SaveChanges();

            return Ok();
        }

    }
}
