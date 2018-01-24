using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MByte.Models
{
    public class Element
    {
        public string Title { get; set; }
        public Element Parent { get; set; }
        public int Index { get; set; }
    }
}