using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace MByte.Controllers
{
    public class CategoryController : Controller
    {
        MBEntities context = new MBEntities();
        // GET: Category
        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        [HttpGet]
        public ActionResult CategoryList()
        {
            

            IList<Category> categories = (from y in context.Category select y).ToList();

            Models.SeededCategories model = new Models.SeededCategories { Seed = null, Categories = categories };


            return View(model);
        }
        [Authorize]
        [HttpPost]
        public ActionResult CategoryCreate(Category category)
        {
            context.Category.Add(new Category() { family_id = category.id, name = category.name });
            context.SaveChanges();
            return RedirectToAction("CategoryList");
          
        }
        [Authorize]
        [HttpGet]
        public ActionResult CategoryCreate(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = context.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            
            return View(category);
        }
        [Authorize]
        [HttpGet]
        public ActionResult CategoryEdit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = context.Category.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            List<Category> allCategory = (from y in context.Category select y).ToList();
            MByte.Models.ViewCategoryEditModel x = new Models.ViewCategoryEditModel();
            x.MyCategory = category;
            x.MyCategories = allCategory;
            return View(x);
        }
        [Authorize]
        [HttpPost]
        public ActionResult CategoryEdit(MByte.Models.ViewCategoryEditModel category)
        {
            Category x = (from y in context.Category where y.id == category.MyCategory.id select y).FirstOrDefault();
            if (x != null)
            {
                x.family_id = category.MyCategory.family_id;
                x.name = category.MyCategory.name;
                context.SaveChanges();

            }
            return RedirectToAction("CategoryList");

        }
        [Authorize]
        [HttpPost]
        public ActionResult CategoryDelete(int id)
        {
            var CategoryDelete = (from y in context.Category
                                 where y.id == id
                                 select y).FirstOrDefault();
            context.Category.Remove(CategoryDelete);
            context.SaveChanges();

            return RedirectToAction("CategoryList");
        }
    }
}