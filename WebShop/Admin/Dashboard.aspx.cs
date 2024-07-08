using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            getOrderHistory();
            getOrder2();
            getOrder3();
            getOrder4();
            getOrder1();
            getOrder5();
            Session["breadCumbPage"] = "Заказы";
        }
                
        void getOrderHistory()
        {

            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETALL");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrders.DataSource = dt;
            rOrders.DataBind();
        }

        protected void rOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["CommandArguments"] = e.CommandArgument;
            Response.Redirect("OrderDetail.aspx");
        }

        protected void rOrder2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["CommandArguments"] = e.CommandArgument;
            Response.Redirect("OrderDetail.aspx");
        }

        void getOrder1()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GET1");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrder2.DataSource = dt;
            rOrder2.DataBind();
        }

        protected void rOrder3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["CommandArguments"] = e.CommandArgument;
            Response.Redirect("OrderDetail.aspx");
        }

        void getOrder2()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GET2");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrder3.DataSource = dt;
            rOrder3.DataBind();
        }

        protected void rOrder4_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["CommandArguments"] = e.CommandArgument;
            Response.Redirect("OrderDetail.aspx");
        }

        void getOrder3()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GET3");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrder4.DataSource = dt;
            rOrder4.DataBind();
        }

        protected void rOrder5_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["CommandArguments"] = e.CommandArgument;
            Response.Redirect("OrderDetail.aspx");
        }

        void getOrder4()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GET4");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrder5.DataSource = dt;
            rOrder5.DataBind();
        }

        void getOrder5()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GET5");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrder6.DataSource = dt;
            rOrder6.DataBind();
        }

        protected void rOrder6_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["CommandArguments"] = e.CommandArgument;
            Response.Redirect("OrderDetail.aspx");
        }
    }
}