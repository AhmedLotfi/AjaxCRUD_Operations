using AjaxCRUD_Operations.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AjaxCRUD_Operations.Controllers
{
    public class DepartmentsController : Controller
    {
        private readonly CompanyDbEntities _db;
        public DepartmentsController()
        {
            _db = new CompanyDbEntities();
        }

        [HttpGet]
        public JsonResult GetDepartments()
        {
            var data = _db.Departments.Select(z => new { z.ID, z.Name }).ToList();

            return Json(data,JsonRequestBehavior.AllowGet);
        }
    }
}