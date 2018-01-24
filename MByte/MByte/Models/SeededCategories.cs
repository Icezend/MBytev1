using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MByte.Models
{
    public class SeededCategories
    {
            public int? Seed { get; set; }
            public IList<MByte.Category> Categories { get; set; }
    }
}