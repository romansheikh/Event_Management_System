using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using EventManagement.DAL;

namespace EventManagement.BL
{
    class BL_AddCustomer
    {

        public int Id { get; set; }
        public string Name { get; set; }
        public string FatherName { get; set; }
        public string Address { get; set; }
        public string Mobile { get; set; }
        public string Email { get; set; }

        public bool Save()
        {
            string query = "insert into tbl_Costomer values(@Name,@FatherName,@Address,@Mobile,@Email)";
            SqlParameter[] prm = new SqlParameter[5];
            prm[0] = new SqlParameter("@Name", Name);
            prm[1] = new SqlParameter("@FatherName", FatherName);
            prm[2] = new SqlParameter("@Address", Address);
            prm[3] = new SqlParameter("@Mobile", Mobile);
            prm[4] = new SqlParameter("@Email", Email);
            DataAccess.ExecuteQuery(query, prm);
            return true;
        }


    }
}
