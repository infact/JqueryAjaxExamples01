using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JqueryAjaxExample
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

       
        [WebMethod]
        public static Employee[] BindEmployees()
        {
            var employeeList = new Employee[]
            {
            new Employee { FirstName="Harry", LastName="Fields" , City="Bellevue",Country="USA" },
            new Employee { FirstName="Alex", LastName="Yert" , City="Westj",Country="Japan" },
            new Employee{ FirstName="Mool", LastName="Yerwfd" , City="WWSw",Country="Canada" }
           };

            return employeeList.ToArray();
        }
        public class Employee
        {
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public string City { get; set; }
            public string Country { get; set; }
        }

    }
}