using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagement
{
    public partial class EventType : System.Web.UI.Page
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

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            FileUpload fu = (FileUpload)DetailsView1.FindControl("FileUpload1");
            if (fu.HasFile)
            {
                e.Values["EventTypeImage"] = fu.FileBytes;
            }

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            FileUpload fu = (FileUpload)GridView1.Rows[e.RowIndex].FindControl("FileUpload1");
            if (fu.HasFiles)
            {
                e.NewValues["EventTypeImage"] = fu.FileBytes;
            }
        }
    }
}