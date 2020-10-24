using EventManagement.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BL
{
    class BL_ScheduleEvents
    {

        

            public int BookedEventId { get; set; }
            public int EventTypeId { get; set; }
            public int CustomerId { get; set; }
            public DateTime StartTime { get; set; }
            public DateTime EndTime { get; set; }
            public DateTime EntryDate { get; set; }
            public int DEventId { get; set; }
            public DateTime CompTimeStart { get; set; }
            public DateTime CompTimeEnd { get; set; }

            public bool Save()
            {
                string query = "insert into tbl_BookedEvent values(@EventTypeId,@CustomerId,@StartTime,@EndTime,@EntryDate)";
                SqlParameter[] prm = new SqlParameter[5];
                prm[0] = new SqlParameter("EventTypeId", EventTypeId);
                prm[1] = new SqlParameter("CustomerId", CustomerId);
                prm[2] = new SqlParameter("StartTime", StartTime);
                prm[3] = new SqlParameter("EndTime", EndTime);
                prm[4] = new SqlParameter("EntryDate", EntryDate);
                DataAccess.ExecuteQuery(query, prm);
                return true;
            }
            public bool UpdateEvent()
            {
                string query = "UPDATE tbl_BookedEvent SET EventTypeId=@EventTypeId,CustomerId=@CustomerId,StartTime=@StartTime,EndTime=@EndTime WHERE BookedEventId=@BookedEventId";
                SqlParameter[] prm = new SqlParameter[6];
                prm[0] = new SqlParameter("EventTypeId", EventTypeId);
                prm[1] = new SqlParameter("CustomerId", CustomerId);
                prm[2] = new SqlParameter("StartTime", StartTime);
                prm[3] = new SqlParameter("EndTime", EndTime);
                prm[4] = new SqlParameter("EntryDate", EntryDate);
                prm[5] = new SqlParameter("BookedEventId", BookedEventId);
                DataAccess.ExecuteQuery(query, prm);
                return true;
            }

        //public DataTable getAllEvents()
        //{
        //    string query = "select * from tbl_Event";
        //    DataTable dt = DataAccess.ExecuteTable(query);
        //    return dt;
        //}

        public DataTable getAllEventsSchedule()
            {
                string query = "select * from tbl_BookedEvent";
                DataTable dt = DataAccess.ExecuteTable(query);
                return dt;
            }
            public DataTable getScheduleDetail()
            {
                return DataAccess.sp_ExecuteTable("sp_ViewSchedule");
            }
            public void DeleteEvent()
            {
                string query = "Delete from tbl_BookedEvent where BookedEventId=" + DEventId;
                DataAccess.ExecuteQuery(query);
            }
        
    }
}
