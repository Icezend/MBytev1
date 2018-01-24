using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MByte.Models
{
    public class Item
    {
        public int id { get; set; }
        public int catid { get; set; }
        public string name { get; set; }
        public string imageurl { get; set; }
        public bool isactive { get; set; }
        public string description { get; set; }
        public double price { get; set; }
    }
}