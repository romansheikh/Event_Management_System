using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventManagement.DAL
{
    class DataAccess
    {

        static SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\EventManagement.mdf;Integrated Security=True");
        public static void ExecuteQuery(string query)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                cmd.ExecuteNonQuery();

            }

            catch (SqlException ex)
            {
                //Msg.Text = ex.ToString();


            }
            finally
            {
                conn.Close();
            }
        }
        public static DataTable ExecuteTable(string query)
        {

            try
            {
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (SqlException ex)
            {
                // Msg.Text = ex.ToString();
                return null;
            }
        }
        public static DataTable ExecuteTable(string query, SqlParameter[] p)
        {
            SqlDataAdapter ad = new SqlDataAdapter(query, conn);
            ad.SelectCommand.Parameters.AddRange(p);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            return dt;

        }
        public static void ExecuteQuery(string query, SqlParameter[] prm)
        {
            try
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddRange(prm);
                conn.Open();
                cmd.ExecuteNonQuery();

            }

            catch (SqlException ex)
            {
                //Msg.Text = ex.ToString() + "<br>" + query;
            }

            finally
            {
                conn.Close();
            }
        }

        public static DataTable sp_ExecuteTable(string SpName)
        {

            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = SpName;
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (SqlException ex)
            {
                //Msg.Text = ex.ToString();
                return null;
            }
        }

    }
}

