using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Admin;

namespace WebShop.User
{
    public partial class User : System.Web.UI.MasterPage
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

            var userId = Session["UserId"];
            if (userId == null)
            {
                Response.Redirect("../Identity/Login.aspx");
            }
            else
            {
                SqlDataReader dr;
                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Cart_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "COUNT");
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                con.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    QwInCart.Text = dr.GetValue(0).ToString();
                }
                con.Close();
            }
           
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string text = txtSearch.Text;
            string n = "";
            if (text == n)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                Session["SearchText"] = txtSearch.Text;
                Response.Redirect("ForSearch.aspx");
            }
            
        }
    }
}