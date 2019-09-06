using AjaxCRUD_Operations.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AjaxCRUD_Operations.Controllers
{
    public class EmployesController : Controller
    {
        private readonly CompanyDbEntities _db;
        public EmployesController()=> _db = new CompanyDbEntities();

        public ActionResult Index()=> View();

        public PartialViewResult EmployesData() => PartialView();
        public PartialViewResult EmployeForm() => PartialView();


        [HttpGet]
        public JsonResult LoadEmployesData()
        {
            var data = _db.Employees
                            .Select(z => new
                            {
                                z.ID,
                                z.Name,
                                z.Age,
                                z.Salary
                            })
                            .OrderByDescending(z=>z.ID)
                            .ToList();

            return Json(data,JsonRequestBehavior.AllowGet);
        }


        [HttpPost]
        public ActionResult AddEmployee(Employees emp)
        {
            try
            {
                if (emp == null)
                    return Json(new { add =true , success =false ,message ="fail" },JsonRequestBehavior.AllowGet);

                _db.Employees.Add(emp);

                int result = _db.SaveChanges();

                if(result !=1)
                    return Json(new { add = true, success = false, message = "fail" }, JsonRequestBehavior.AllowGet);

                return Json(new { add = true, success = true, message = "Added Successfully" }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception x)
            {
                return Json(new { add = true, success = false, message = $"Error ${x.InnerException?.Message ?? x.Message}" }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}