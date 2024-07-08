using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Configuration;
using MySql.Data.MySqlClient;

namespace WebShop
{
   
    public class Utils
    {
        MySqlConnection con;
        MySqlCommand cmd;
        MySqlDataAdapter sda;
        MySqlDataReader sdr;
        DataTable dt;

        public static string getConnection()
        {
            return ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
        }

        public static bool isValidExtension(string fileName)
        {
            bool isValid = false;
            string[] fileExension = { ".jpg", ".png", ".jpeg" };
            foreach(string file in fileExension)
            {
                if (fileName.Contains(file))
                {
                    isValid = true;
                    break;
                }               
            }
            return isValid;
        }

        public static string getUniqueId()
        {
            Guid guid = Guid.NewGuid();
            return guid.ToString();
        }

        public static string getImageUrl(Object url)
        {
            string url1 = string.Empty;
            if(string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "../Images/No_image.png";
            }
            else
            {
                url1 = string.Format("../{0}", url);
            }
            return url1;
        }

        //public bool updateCartQuantity(int quantity, int productID, string userID)
        //{
        //    bool isUpdated = false;
        //    con = new MySqlConnection(Utils.getConnection());
        //    cmd = new MySqlCommand("Cart_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "UPDATE");
        //    cmd.Parameters.AddWithValue("@ProductID", productID);
        //    cmd.Parameters.AddWithValue("@Quantity", quantity);
        //    cmd.Parameters.AddWithValue("@UserId", userID);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    try
        //    {
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        isUpdated = true;
        //    }
        //    catch (Exception ex)
        //    {
        //        isUpdated = false;
        //        //System.Web.HttpContext.Current.Response.Write("<script>alert('Error - " + ex.Message + " ');<script>");
        //    }
        //    finally
        //    {
        //        con.Close();
        //    }
        //    return isUpdated;
        //}

    }
}