using Microsoft.EntityFrameworkCore;
using SimpleBookLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SimpleBookLibrary.Data
{
    public class SimpleBookLibraryContext : DbContext
    {
        public SimpleBookLibraryContext(DbContextOptions<SimpleBookLibraryContext> options)
            :base(options)
        {
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<Book> Books { get; set; }
        public DbSet<Favourite> Favourites { get; set; }
        public DbSet<BookCategory> BookCategories { get; set; }

    }
}
