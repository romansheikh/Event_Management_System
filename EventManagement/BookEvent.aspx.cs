using EventManagement.BL;
using EventManagement.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EventManagement
{
    public partial class BookEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
            if (User.Identity.IsAuthenticated == true)
            {
                Response.Write("Accessing By Aouthorized User!!!");

            }
            else
            {

                Response.Redirect("~/PermissionError", false);
            }
        }
        public void AllClear()
        {
            txtStartdate.Text = "";
            txtEndDate.Text = "";

        }
        public void FillGridView()
        {
            BL_ScheduleEvents obj = new BL_ScheduleEvents();
            DataTable dt = obj.getAllEventsSchedule();
            GridView1.DataSource = dt;
            GridView1.DataBind();
            //dataGridView1.Columns["BookedEventId"].Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            DataTable dt = DataAccess.ExecuteTable("select * from tbl_BookedEvent where bookedeventid= " + TextBox1.Text);

            ddlCustomer.SelectedValue = dt.Rows[0]["customerid"].ToString();
            ddlEventType.SelectedValue = dt.Rows[0]["eventtypeid"].ToString();
            txtStartdate.Text = dt.Rows[0]["starttime"].ToString();
            txtEndDate.Text = dt.Rows[0]["endtime"].ToString();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            int n = 0;
            if (string.IsNullOrEmpty(txtStartdate.Text))
            {
                n += 1;
            }
            if (string.IsNullOrEmpty(txtEndDate.Text))
            {
                n += 1;
            }
            if (n == 0)
            {
                BL_ScheduleEvents obj = new BL_ScheduleEvents();
                obj.CustomerId = Convert.ToInt32(ddlCustomer.SelectedValue);
                obj.EventTypeId = Convert.ToInt32(ddlEventType.SelectedValue);
                obj.StartTime = Convert.ToDateTime(txtStartdate.Text);
                obj.EndTime = Convert.ToDateTime(txtEndDate.Text);
                obj.EntryDate = DateTime.Now;
                if (obj.Save())
                {
                    //MessageBox.Show("Event Booked Successfully");
                    Label1.Text = "Event Booked Successfully";
                    AllClear();
                }
                else
                {
                    //MessageBox.Show("Error! Please Try Again");
                    Label1.Text = "Error! Please Try Again";
                }
            }
            if (n != 0)
            {
                //MessageBox.Show("All Feilds Are Required");
                Label1.Text = "All Feilds Are Required";
            }

            FillGridView();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            BL_ScheduleEvents obj = new BL_ScheduleEvents();
            obj.CustomerId = Convert.ToInt32(ddlCustomer.SelectedValue);
            obj.EventTypeId = Convert.ToInt32(ddlEventType.SelectedValue);
            obj.StartTime = Convert.ToDateTime(txtStartdate.Text);
            obj.EndTime = Convert.ToDateTime(txtEndDate.Text);
            obj.BookedEventId = Convert.ToInt32(TextBox1.Text);
            obj.EntryDate = DateTime.Now;
            if (obj.UpdateEvent())
            {
                Label1.Text = "Event Updated Successfully";
            }
            else
            {
                Label1.Text = "Error! Please Try Again";
            }

            AllClear();
            FillGridView();
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            BL_ScheduleEvents obj = new BL_ScheduleEvents();
            obj.DEventId = Convert.ToInt32(TextBox1.Text);
            obj.DeleteEvent();
            Label1.Text = "Event Deleted Successfully";
            AllClear();
            TextBox1.Text = "";
            FillGridView();
        }
    }
}