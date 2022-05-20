using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SimpleBookLibrary.Models
{
    public class Favourite
    {
        public int Id { get; set; }
        public List<Book> Books { get; set; }
    }
}
