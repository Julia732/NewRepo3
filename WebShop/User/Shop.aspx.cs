using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebShop.Admin;
using Microsoft.AspNet.Identity;

namespace WebShop.User
{
    public partial class Shop : System.Web.UI.Page
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
                //getCategory();
            }
        }
        //void getCategory()
        //{
        //   con = new SqlConnection(Utils.getConnection());
        //   cmd = new SqlCommand("Category_Crud", con);
        //   cmd.Parameters.AddWithValue("@Action", "ACTIVECATEGORY");
        //   cmd.CommandType = CommandType.StoredProcedure;
        //   sda = new SqlDataAdapter(cmd);
        //   dt = new DataTable();
        //   sda.Fill(dt);
        //   rCategory.DataSource = dt;
        //   rCategory.DataBind();
        //}

        void getCart()
        {
            string userId = User.Identity.GetUserId();
            var commandArgument = Session["CommandArgument"];
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETW");
            cmd.Parameters.AddWithValue("@UserId", userId);
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

        protected void rOrder_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }
    }
}