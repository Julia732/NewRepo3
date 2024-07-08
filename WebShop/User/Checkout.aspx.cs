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
using WebShop.Admin;

namespace WebShop.User
{
    public partial class Checkout : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            getInformation();

            var sum = Session["Sum"];
            var totalPrice = Session["TotalPrice"];
            if(sum == null)
            {
                Response.Redirect("../User/Default.aspx");
            }
            else
            {
                lblSum.Text = sum.ToString();
            }
            if(totalPrice == null)
            {
                Response.Redirect("../User/Default.aspx");
            }
            else
            {
                lblTotQuant.Text = totalPrice.ToString();
            }
        }

        void getInformation()
        {
            string userId = User.Identity.GetUserId();
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Profile_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETFORCHECK");
            cmd.Parameters.AddWithValue("@Id", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            lblPhoneNumber.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
            lblTown.Text = Convert.ToString(dt.Rows[0]["Town"]);
            lblStreet.Text = Convert.ToString(dt.Rows[0]["Street"]);
            lblApartment.Text = Convert.ToString(dt.Rows[0]["Apartment"]);

            //con = new SqlConnection(Utils.getConnection());
            //cmd = new SqlCommand("Order_Crud", con);
            //cmd.Parameters.AddWithValue("@Action", "GETPAY");
            //cmd.Parameters.AddWithValue("@UserId", userId);
            //cmd.CommandType = CommandType.StoredProcedure;
            //sda = new SqlDataAdapter(cmd);
            //dt = new DataTable();
            //sda.Fill(dt);
            //if (dt.Rows.Count > 0)
            //{
            //    txtCardNumber.Text = Convert.ToString(dt.Rows[0]["CardNo"]);
            //    txtDateEnd.Text = Convert.ToString(dt.Rows[0]["ExpirtDate"]);
            //}
           
        }

        protected void btnAddChange_Click(object sender, EventArgs e)
        {
            Response.Redirect("../User/Profile.aspx");
        }
        

        protected void btnPay_Click(object sender, EventArgs e)
        {
            var none = "";
            var totalPrice = Session["TotalPrice"];
            if (lblPhoneNumber.Text != none && lblTown.Text != none &&  lblTown.Text != "" && lblStreet.Text != none && txtCardNumber.Text != none && txtDateEnd.Text != none && txtCVC.Text != none)
            {
                string orderId = Guid.NewGuid().ToString();
                string userId = User.Identity.GetUserId();

                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Order_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "INSERT");
                cmd.Parameters.AddWithValue("@UserID", userId);
                cmd.Parameters.AddWithValue("@TotPrice", totalPrice);
                cmd.Parameters.AddWithValue("@OrderNo", orderId.ToString());
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    //lblMsg.Visible = true;
                    //lblMsg.Text = "Заказ отправлен в магазин!";
                    lblMsg.CssClass = "alert alert-success";
                }
                catch (Exception ex)
                {
                    lblMsg.Visible = true;
                    lblMsg.Text = "Error- " + ex.Message;
                    lblMsg.CssClass = "alert alert-danger";
                }
                finally
                {
                    con.Close();
                }


                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Order_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "ADD");
                cmd.Parameters.AddWithValue("@UserId", userId.ToString());
                cmd.Parameters.AddWithValue("@OrderNo", orderId.ToString());
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                //con = new SqlConnection(Utils.getConnection());
                //cmd = new SqlCommand("Order_Crud", con);
                //cmd.Parameters.AddWithValue("@Action", "UPDATEKOLPRODUCT");
                //cmd.Parameters.AddWithValue("@UserId", userId.ToString());
                //cmd.CommandType = CommandType.StoredProcedure;
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();

                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Cart_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "CLEAR");
                cmd.Parameters.AddWithValue("@UserId", userId);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

                //con = new SqlConnection(Utils.getConnection());
                //cmd = new SqlCommand("Order_Crud", con);
                //cmd.Parameters.AddWithValue("@Action", "PLUS");
                //cmd.Parameters.AddWithValue("@UserId", userId);
                //cmd.Parameters.AddWithValue("@OrderNo", orderId.ToString());
                //cmd.CommandType = CommandType.StoredProcedure;
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();
                lblMsg.Visible = true;
                lblMsg.Text = "Заказ отправлен в магазин!";
                Response.Redirect("../User/Default.aspx");

                
            }
            else
            {
                lblMsg.Visible = true;
                lblMsg.Text = "Проверьте правильность введенных данных!";
            }
            
           
        }
    }
}