using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SimpleBookLibrary.Models
{
    public class Favourite
    {
        public int Id { get; set; }
        public int BookId { get; set; }
        public DateTime CreatedDate { get; set; }
        public Book Book { get; set; }
    }
}
