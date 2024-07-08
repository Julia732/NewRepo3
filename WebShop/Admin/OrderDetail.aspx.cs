using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop.Admin
{
    public partial class OrderDetail : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getCart();
                getStatus();
                Session["breadCumbPage"] = "Детали заказа";
                //getCategory();
            }
        }

        void getCart()
        {
            var commandArgument = Session["CommandArguments"];
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETDET");
            cmd.Parameters.AddWithValue("@OrderNo", commandArgument);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);           
            rDetail.DataSource = dt;
            rDetail.DataBind();
            lblForText.Text = "Детали заказа с кодом: " + commandArgument;
            lblForText.Visible = true;
            
        }

        void getStatus()
        {
            var commandArgument = Session["CommandArguments"];
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETSTATUS");
            cmd.Parameters.AddWithValue("@OrderNo", commandArgument);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            ddlCompany.SelectedValue = dt.Rows[0]["StatusID"].ToString();
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            var itemId = Session["CommandArguments"];
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "UPDATEITEM");
            cmd.Parameters.AddWithValue("@OrderNo", itemId.ToString());  
            cmd.Parameters.AddWithValue("@StatusID", ddlCompany.SelectedValue);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Redirect("Dashboard.aspx");
        }

        protected void rDetail_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            //Session["Value"] = e.CommandArgument;
            //con = new SqlConnection(Utils.getConnection());
            //cmd = new SqlCommand("Order_Crud", con);
            //cmd.Parameters.AddWithValue("@Action", "GETITEM");
            //cmd.Parameters.AddWithValue("@OrderDetailID", e.CommandArgument);
            //cmd.CommandType = CommandType.StoredProcedure;
            //sda = new SqlDataAdapter(cmd);
            //dt = new DataTable();
            //sda.Fill(dt);
            //txtProductSize.Text = dt.Rows[0]["Quantity"].ToString();
            //txtPrice.Text = dt.Rows[0]["Price"].ToString();
        }
    }
}