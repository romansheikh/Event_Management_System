using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagement
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated == true)
            {
                Response.Write("Accessing By Aouthorized User!!!");

            }
            else
            {
                
                Response.Redirect("~/PermissionError", false);
            }
        }
    }
}