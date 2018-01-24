using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MByte.Models
{
    public class ViewCategoryEditModel
    {

        public MByte.Category MyCategory { get; set; }
        public List<MByte.Category> MyCategories { get; set; }

    }
}