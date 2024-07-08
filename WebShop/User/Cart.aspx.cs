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
    public partial class Cart : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        SqlDataReader dr;
        string getQuantity;

        protected void Page_Load(object sender, EventArgs e)
        {
            getCart();
            getSum();
            //getDeliveryPrice();
            getTotalPr();

        }

        void getCart()
        {
            string userId = User.Identity.GetUserId();
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCart.DataSource = dt;
            rCart.DataBind();

        }


        void getTotalPr()
        {
            string none = "";
            if (lblSum.Text != none && lblDelPrice.Text != none)
            {
                int sum = Convert.ToInt32(lblSum.Text);
                int deliveryPr = Convert.ToInt32(lblDelPrice.Text);
                int totalPrice = sum + deliveryPr;
                lblTotalPrice.Text = totalPrice.ToString();
                Session["TotalPrice"] = lblTotalPrice.Text;
            }
            else
            {
                lblSum.Text = "0";
                int sum = 0;
                int deliveryPr = 0;
                int totalPrice = sum + deliveryPr;
                lblTotalPrice.Text = totalPrice.ToString();
            }

        }

        void getSum()
        {
            string userId = User.Identity.GetUserId();

            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SUM");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                lblSum.Text = dr.GetValue(0).ToString();
            }
            con.Close();
            Session["Sum"] = lblSum.Text;
        }

        protected void rCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            string userId = User.Identity.GetUserId();

            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETQW");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                getQuantity = dr.GetValue(0).ToString();
            }
            con.Close();

            int quantInShop = 0;
            int quantInCart = 0;

            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETQuant");
            cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                quantInShop = Convert.ToInt32(dt.Rows[0]["PrdQty"]);
                quantInCart = Convert.ToInt32(dt.Rows[0]["Qty"]);
            }


            int quantity = Convert.ToInt32(getQuantity);
            int totPrice = 1;
            int Price = 1;

            
                switch (e.CommandName)
                {
                    case "minus":
                        if (quantity == 1)
                        {
                            con = new SqlConnection(Utils.getConnection());
                            cmd = new SqlCommand("Cart_Crud", con);
                            cmd.Parameters.AddWithValue("@Action", "DELETE");
                            cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
                            cmd.Parameters.AddWithValue("@UserId", userId);
                            cmd.CommandType = CommandType.StoredProcedure;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            getCart();
                        }
                        else
                        {
                            con = new SqlConnection(Utils.getConnection());
                            cmd = new SqlCommand("Cart_Crud", con);
                            cmd.Parameters.AddWithValue("@Action", "GETPRICE");
                            cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
                            cmd.CommandType = CommandType.StoredProcedure;
                            sda = new SqlDataAdapter(cmd);
                            dt = new DataTable();
                            sda.Fill(dt);
                            if (dt.Rows.Count > 0)
                            {
                                Price = Convert.ToInt32(dt.Rows[0]["Price"]);
                            }

                            int M = quantity - 1;
                            totPrice = Price * M;

                            con = new SqlConnection(Utils.getConnection());
                            cmd = new SqlCommand("Cart_Crud", con);
                            cmd.Parameters.AddWithValue("@Action", "MINUS");
                            cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
                            cmd.Parameters.AddWithValue("@UserId", userId);
                            cmd.Parameters.AddWithValue("@TotPrice", totPrice.ToString());
                            cmd.CommandType = CommandType.StoredProcedure;
                            con.Open();
                            cmd.ExecuteNonQuery();
                            con.Close();
                            getCart();
                        }
                        break;

                    case "plus":
                    if (quantInShop > quantInCart)
                    {
                        con = new SqlConnection(Utils.getConnection());
                        cmd = new SqlCommand("Cart_Crud", con);
                        cmd.Parameters.AddWithValue("@Action", "GETPRICE");
                        cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
                        cmd.CommandType = CommandType.StoredProcedure;
                        sda = new SqlDataAdapter(cmd);
                        dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count > 0)
                        {
                            Price = Convert.ToInt32(dt.Rows[0]["Price"]);
                        }

                        getCart();
                        int P = quantity + 1;
                        totPrice = Price * P;

                        con = new SqlConnection(Utils.getConnection());
                        cmd = new SqlCommand("Cart_Crud", con);
                        cmd.Parameters.AddWithValue("@Action", "PLUS");
                        cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@TotPrice", totPrice.ToString());
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        getCart();
                    }
                    else if (quantInShop == quantInCart)
                    {
                        lblMsg.Visible = true;
                        lblMsg.Text = "Товара недостаточно на складе!";
                    }
                    break;
                    

                case "delete":

                        con = new SqlConnection(Utils.getConnection());
                        cmd = new SqlCommand("Cart_Crud", con);
                        cmd.Parameters.AddWithValue("@Action", "DELETE");
                        cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.CommandType = CommandType.StoredProcedure;
                        con.Open();
                        cmd.ExecuteNonQuery();
                        con.Close();
                        getCart();
                        break;
                }
                getCart();
                getSum();
                getTotalPr();


        }   



        protected void rCart_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {

        }

        protected void btnCupon_Click(object sender, EventArgs e)
        {

        }
}
}