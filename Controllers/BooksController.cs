using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SimpleBookLibrary.Data;
using SimpleBookLibrary.Models;
using SimpleBookLibrary.ViewModel;

namespace SimpleBookLibrary.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BooksController : ControllerBase
    {
        private readonly SimpleBookLibraryContext _context;
        CategoriesController categoryCtr;

        public BooksController(SimpleBookLibraryContext context)
        {
            _context = context;
            categoryCtr = new CategoriesController(context);
        }

        // GET: api/Books
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Book>>> GetBooks()
        {
            try
            {
                return await _context.Books.ToListAsync();
            }
            catch (Exception ex)
            {
                return NotFound();
                throw;
            }
        }

        // GET: api/Books/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Book>> GetBook(int id)
        {
            var book = await _context.Books.FindAsync(id);

            if (book == null)
            {
                return NotFound();
            }

            return book;
        }

        // PUT: api/Books/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutBook(int id, BookViewModel book)
        {
            if (!BookExists(id))
            {
                return BadRequest();
            }

            var data = new Book
            {
                Id = id,
                Author = book.Author,
                ISBN = book.ISBN,
                Title = book.Title,
                CreatedDate = DateTime.Now
            };

            _context.Entry(data).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!BookExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Books
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Book>> PostBook(BookViewModel book)
        {
            try
            {
                var data = new Book
                {
                    Author = book.Author,
                    ISBN = book.ISBN,
                    Title = book.Title,
                    CreatedDate = DateTime.Now
                };
                _context.Books.Add(data);
                await _context.SaveChangesAsync();

                return CreatedAtAction("GetBook", new { id = data.Id }, data);
            }
            catch (Exception ex)
            {
                return NotFound(ex.Message);
            }
        }

        // DELETE: api/Books/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteBook(int id)
        {
            var book = await _context.Books.FindAsync(id);
            if (book == null)
            {
                return NotFound();
            }

            _context.Books.Remove(book);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool BookExists(int id)
        {
            return _context.Books.Any(e => e.Id == id);
        }


        [Route("BookToCategory")]
        [HttpPost]
        public async Task<IActionResult> BookToCategory(BookCategoryViewModel bookCategory)
        {
            try
            {
                if (!BookExists(bookCategory.BookId))
                    return NotFound("Book Not Found");
                if (!categoryCtr.CategoryExists(bookCategory.CategoryId))
                    return NotFound("Category Not Found");

                var data = new BookCategory
                {
                    BookId = bookCategory.BookId,
                    CategoryId = bookCategory.CategoryId,
                    CreatedDate = DateTime.Now
                };

                _context.BookCategories.Add(data);
                await _context.SaveChangesAsync();
                return CreatedAtAction("BookToCategory", new { id = data.Id }, data);
            }
            catch (Exception ex)
            {
                throw;
            }


        }


        [Route("BookToFavourite")]
        [HttpPost]
        public async Task<IActionResult> BookToFavourite(FavouriteViewModel favourite)
        {
            try
            {
                if (!BookExists(favourite.BookId))
                    return NotFound("Book Not Found");

                var data = new Favourite
                {
                    BookId = favourite.BookId,
                    CreatedDate = DateTime.Now
                };

                _context.Favourites.Add(data);
                await _context.SaveChangesAsync();
                return CreatedAtAction("BookToFavourite", new { id = data.Id }, data);
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        [HttpGet]
        public async Task<ActionResult<IEnumerable<BookCategoryViewModel>>> GetBookCategories()
        {
            try
            {
                List<BookCategoryViewModel> bookCategories = new List<BookCategoryViewModel>();
                var result = await _context.Books.ToListAsync();



                return bookCategories;
            }
            catch (Exception ex)
            {
                return NotFound();
                throw;
            }
        }
    }
}
