using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SimpleBookLibrary.Models
{
    public class BookCategory
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public int CategoryId { get; set; }

        public Category Category { get; set; }
        public Book Book { get; set; }
    }
}
