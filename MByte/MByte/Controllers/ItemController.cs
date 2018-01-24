using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Dynamic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MByte.Models;

namespace MByte.Controllers
{
    
    public class ItemController : Controller
    {
        MBEntities context = new MBEntities();
        // GET: Item
        [Authorize(Roles = "product_view")]
        [HttpGet]
        public ActionResult ItemList()
        {
            List<ItemsWithCategories_Result> x = context.Database.SqlQuery<ItemsWithCategories_Result>("ItemsWithCategories").ToList();
            return View(x);
        }

        [Authorize(Roles = "product_view")]
        [HttpGet]
        [Route("Item/{name}-{categoryname}/{id}")]
        public ActionResult ItemDetail(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Items item = context.Items.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }
            return View(item);
        }

        [Authorize(Roles = "product_view")]
        [HttpGet]
        public ActionResult ItemEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Items item = context.Items.Find(id);
            if (item == null)
            {
                return HttpNotFound();
            }

            List<CategoriesChild_Result> category = context.Database.SqlQuery<CategoriesChild_Result>("CategoriesChild").ToList();
            Models.ViewItemEditModel x = new Models.ViewItemEditModel();
            x.MyCategories = context.Database.SqlQuery<CategoriesChild_Result>("CategoriesChild").ToList();
            x.MyItems = item;

            return View(x);
        }
        [Authorize(Roles = "product_view")]
        [HttpPost]
        public ActionResult ItemEdit(Models.ViewItemEditModel item)
        {
            Items x = (from y in context.Items where y.id == item.MyItems.id select y).FirstOrDefault();
            if (x != null)
            {
                x.catid = item.MyItems.catid;
                x.description = item.MyItems.description;
                x.imageurl = item.MyItems.imageurl;
                x.isactive = item.MyItems.isactive;
                x.name = item.MyItems.name;
                x.price = item.MyItems.price;
                context.SaveChanges();

            }
            return RedirectToAction("ItemList");
        }
        [Authorize(Roles = "product_view")]
        [HttpGet]
        public ActionResult ItemCreate()
        {
            ViewItemEditModel x = new ViewItemEditModel();
            x.MyCategories = context.Database.SqlQuery<CategoriesChild_Result>("CategoriesChild").ToList();
            return View(x);
        }
        [Authorize(Roles = "product_view")]
        [HttpPost]
        public ActionResult ItemCreate(Item item)
        {
            context.Items.Add(new Items() { catid = item.catid, description = item.description, imageurl = item.imageurl, isactive = item.isactive, name = item.name, price = item.price });
            context.SaveChanges();
            return RedirectToAction("ItemList");
        }

        [Authorize(Roles = "product_view")]
        [HttpPost]
        public ActionResult ItemDelete(int id)
        {
            var ItemDelete = (from y in context.Items
                                  where y.id == id
                                  select y).FirstOrDefault();
            context.Items.Remove(ItemDelete);
            context.SaveChanges();

            return RedirectToAction("ItemList");
        }


    }
}