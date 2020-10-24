using EventManagement.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.BL
{
    class BL_AddUser
    {
        public string UserName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Address { get; set; }
        public string UserPicture { get; set; }

        public bool Save() {

            Image img = Image.FromFile(UserPicture);
            MemoryStream ms = new MemoryStream();
            img.Save(ms, ImageFormat.Bmp);

            string query = "INSERT INTO tblUser VALUES(@UserName,@Email,@Password,@Address,@UserPicture )";
            SqlParameter[] prm = new SqlParameter[5];
            prm[0] = new SqlParameter("UserName", UserName);
            prm[1] = new SqlParameter("Email", Email);
            prm[2] = new SqlParameter("Password", Password);
            prm[3] = new SqlParameter("Address", Address);
            prm[4] = new SqlParameter("UserPicture", SqlDbType.VarBinary) {Value=ms.ToArray() };
            DataAccess.ExecuteQuery(query, prm);
            return true;
             
        }
        public DataTable Login()
        {
            string query = "select * from tblUser where userName=@UserName and userPassword=@Password";
            SqlParameter[] prm = new SqlParameter[2];
            prm[0] = new SqlParameter("UserName", UserName);
            prm[1] = new SqlParameter("Password", Password);
            DataTable dt = DataAccess.ExecuteTable(query, prm);
            
            return dt;
        }


    }
}
