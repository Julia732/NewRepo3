using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop.Supplay
{
    public partial class OrdersS : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            readyToGet();
            //onTheRoad();
            //Done();
        }

        void readyToGet()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "ORD3");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrders.DataSource = dt;
            rOrders.DataBind();
        }

        protected void rOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {           
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "UPDATES");
            cmd.Parameters.AddWithValue("@OrderID", e.CommandArgument);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            readyToGet();
            //onTheRoad();
        }

        //void onTheRoad()
        //{
        //    con = new SqlConnection(Utils.getConnection());
        //    cmd = new SqlCommand("Order_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "ORD4");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    sda.Fill(dt);
        //    rOrder2.DataSource = dt;
        //    rOrder2.DataBind();            
        //}

        //protected void rOrder2_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
            
        //    con = new SqlConnection(Utils.getConnection());
        //    cmd = new SqlCommand("Order_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "UPDATEITEM3");
        //    cmd.Parameters.AddWithValue("@OrderID", e.CommandArgument);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    con.Open();
        //    cmd.ExecuteNonQuery();
        //    con.Close();

        //    onTheRoad();
        //    Done();
        //}

        //void Done()
        //{
        //    con = new SqlConnection(Utils.getConnection());
        //    cmd = new SqlCommand("Order_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "ORD5");
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    sda.Fill(dt);
        //    rOrder3.DataSource = dt;
        //    rOrder3.DataBind();
        //}

       

       
    }
}