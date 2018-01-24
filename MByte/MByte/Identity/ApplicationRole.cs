using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity.EntityFramework;

namespace MByte.Identity
{
    public class ApplicationRole : IdentityRole
    {
        public string Description { get; set; }
        public ApplicationRole() : base()
        {
        }

        public ApplicationRole(string roleName, string description) : base(roleName)

        {

            this.Description = description;

        }
    }
}