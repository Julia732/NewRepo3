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
using Microsoft.AspNet.Identity;

namespace WebShop.User
{
    public partial class ShopDetail : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            getInfoProd();
        }

        void getInfoProd()
        {
            var productID = Session["ProductID"];
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETBYIDW");
            cmd.Parameters.AddWithValue("@ProductID", productID);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                Name.Text = dt.Rows[0]["ProductName"].ToString();
                CompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
                Description.Text = dt.Rows[0]["LongDescription"].ToString();
                Price.Text = dt.Rows[0]["Price"].ToString();
                EnergyValue.Text = dt.Rows[0]["EnergyValue"].ToString();
                //lblQuant.Text = dt.Rows[0]["Quantity"].ToString();
                ProductImg.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ProductImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["ProductImageUrl"].ToString();
            }
        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            var productID = Session["ProductID"];
            string userId = User.Identity.GetUserId();
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@ProductID", productID);
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            int quantity = 0;
            int totPrice = 1;
            int Price = 1;
            if (dt.Rows.Count > 0)
            {
                quantity = Convert.ToInt32(dt.Rows[0]["Quantity"]);
            }
            
                if (Session["UserId"] != null)
                {
                    con = new SqlConnection(Utils.getConnection());
                    cmd = new SqlCommand("Cart_Crud", con);
                    cmd.Parameters.AddWithValue("@Action", "GETPRICE");
                    cmd.Parameters.AddWithValue("@ProductID", productID);
                    cmd.CommandType = CommandType.StoredProcedure;
                    sda = new SqlDataAdapter(cmd);
                    dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        Price = Convert.ToInt32(dt.Rows[0]["Price"]);
                    }

                    totPrice = Price * quantity;
                    // string userId = User.Identity.GetUserId();
                    // bool isCartItemUpdated = false;
                    int i = quantity;
                    if (i == 0)
                    {

                        con = new SqlConnection(Utils.getConnection());
                        cmd = new SqlCommand("Cart_Crud", con);
                        cmd.Parameters.AddWithValue("@Action", "INSERTW");
                        cmd.Parameters.AddWithValue("@ProductID", productID);
                        cmd.Parameters.AddWithValue("@Quantity", 1);
                        cmd.Parameters.AddWithValue("@TotPrice", Price);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.CommandType = CommandType.StoredProcedure;
                        try
                        {
                            con.Open();
                            cmd.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            Response.Write("<script>alert('Error - " + ex.Message + " ');<script>");
                        }
                        finally
                        {
                            con.Close();
                        }

                        lblMsg.Visible = true;
                        lblMsg.Text = "Товар в корзину добавлен";
                        lblMsg.CssClass = "alert alert-success";
                        //Response.AddHeader("REFRESH", "1;URL=Cart.aspx");
                    }
                    else
                    {
                        int Quantity = quantity + 1;
                        //Utils utils = new Utils();
                        //   isCartItemUpdated = utils.updateCartQuantity(i + 1, Convert.ToInt32(e.CommandArgument), userId);
                        bool isUpdated = false;
                        con = new SqlConnection(Utils.getConnection());
                        cmd = new SqlCommand("Cart_Crud", con);
                        cmd.Parameters.AddWithValue("@Action", "UPDATE");
                        cmd.Parameters.AddWithValue("@ProductID", productID);
                        cmd.Parameters.AddWithValue("@Quantity", Quantity);
                        cmd.Parameters.AddWithValue("@TotPrice", totPrice.ToString());
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.CommandType = CommandType.StoredProcedure;
                        try
                        {
                            con.Open();
                            cmd.ExecuteNonQuery();
                            isUpdated = true;
                        }
                        catch (Exception ex)
                        {
                            isUpdated = false;
                            //System.Web.HttpContext.Current.Response.Write("<script>alert('Error - " + ex.Message + " ');<script>");
                        }
                        finally
                        {
                            con.Close();
                        }
                    }
                }
                else
                {
                    Response.Redirect("../Identity/Login.aspx");
                }
            
            //if (Session["UserId"] != null)
            //{
            //    var productID = Session["ProductID"];
            //    string userId = User.Identity.GetUserId();
            //    con = new SqlConnection(Utils.getConnection());
            //    cmd = new SqlCommand("Cart_Crud", con);
            //    cmd.Parameters.AddWithValue("@Action", "GETBYID");
            //    cmd.Parameters.AddWithValue("@ProductID", productID);
            //    cmd.Parameters.AddWithValue("@UserId", userId);
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    sda = new SqlDataAdapter(cmd);
            //    dt = new DataTable();
            //    sda.Fill(dt);
            //    int quantity = 0;
            //    int totPrice = 1;
            //    int Price = 1;
            //    if (dt.Rows.Count > 0)
            //    {
            //        quantity = Convert.ToInt32(dt.Rows[0]["Quantity"]);
            //    }

            //    // string userId = User.Identity.GetUserId();
            //    // bool isCartItemUpdated = false;
            //    int i = quantity;
            //    if (i == 0)
            //    {

            //        con = new SqlConnection(Utils.getConnection());
            //        cmd = new SqlCommand("Cart_Crud", con);
            //        cmd.Parameters.AddWithValue("@Action", "INSERTW");
            //        cmd.Parameters.AddWithValue("@ProductID", productID);
            //        cmd.Parameters.AddWithValue("@Quantity", 1);
            //        cmd.Parameters.AddWithValue("@TotPrice", totPrice.ToString());
            //        cmd.Parameters.AddWithValue("@UserId", userId);
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        try
            //        {
            //            con.Open();
            //            cmd.ExecuteNonQuery();
            //        }
            //        catch (Exception ex)
            //        {
            //            Response.Write("<script>alert('Error - " + ex.Message + " ');<script>");
            //        }
            //        finally
            //        {
            //            con.Close();
            //        }

            //        lblMsg.Visible = true;
            //        lblMsg.Text = "Товар в корзину добавлен";
            //        lblMsg.CssClass = "alert alert-success";
            //        //Response.AddHeader("REFRESH", "1;URL=Cart.aspx");
            //    }
            //    else
            //    {
            //        int Quantity = quantity + 1;
            //        //Utils utils = new Utils();
            //        //   isCartItemUpdated = utils.updateCartQuantity(i + 1, Convert.ToInt32(e.CommandArgument), userId);
            //        bool isUpdated = false;
            //        con = new SqlConnection(Utils.getConnection());
            //        cmd = new SqlCommand("Cart_Crud", con);
            //        cmd.Parameters.AddWithValue("@Action", "UPDATE");
            //        cmd.Parameters.AddWithValue("@ProductID", productID);
            //        cmd.Parameters.AddWithValue("@Quantity", Quantity);
            //        cmd.Parameters.AddWithValue("@TotPrice", totPrice.ToString());
            //        cmd.Parameters.AddWithValue("@UserId", userId);
            //        cmd.CommandType = CommandType.StoredProcedure;
            //        try
            //        {
            //            con.Open();
            //            cmd.ExecuteNonQuery();
            //            isUpdated = true;
            //        }
            //        catch (Exception ex)
            //        {
            //            isUpdated = false;
            //            //System.Web.HttpContext.Current.Response.Write("<script>alert('Error - " + ex.Message + " ');<script>");
            //        }
            //        finally
            //        {
            //            con.Close();
            //        }
            //    }
            //}
            //else
            //{
            //    Response.Redirect("../Identity/Login.aspx");
            //}
        }

        //protected void lbMinus_Click(object sender, EventArgs e)
        //{
        //    string userId = User.Identity.GetUserId();
        //    var productID = Session["ProductID"];
        //    con = new SqlConnection(Utils.getConnection());
        //    cmd = new SqlCommand("Cart_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "GETQW");
        //    cmd.Parameters.AddWithValue("@UserId", userId);
        //    cmd.Parameters.AddWithValue("@ProductID", productID);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    con.Open();
        //    dr = cmd.ExecuteReader();
        //    while (dr.Read())
        //    {
        //        lblQuant.Text = dr.GetValue(0).ToString();
        //    }
        //    con.Close();


        //    int quantity = Convert.ToInt32(lblQuant.Text);
        //    int totPrice = 1;
        //    int Price = 1;

        //    if (quantity == 1)
        //    {
        //        con = new SqlConnection(Utils.getConnection());
        //        cmd = new SqlCommand("Cart_Crud", con);
        //        cmd.Parameters.AddWithValue("@Action", "DELETE");
        //        cmd.Parameters.AddWithValue("@ProductID", productID);
        //        cmd.Parameters.AddWithValue("@UserId", userId);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //        getInfoProd();
        //    }
        //    else
        //    {
        //        con = new SqlConnection(Utils.getConnection());
        //        cmd = new SqlCommand("Cart_Crud", con);
        //        cmd.Parameters.AddWithValue("@Action", "GETPRICE");
        //        cmd.Parameters.AddWithValue("@ProductID", productID);
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        sda = new SqlDataAdapter(cmd);
        //        dt = new DataTable();
        //        sda.Fill(dt);
        //        if (dt.Rows.Count > 0)
        //        {
        //            Price = Convert.ToInt32(dt.Rows[0]["Price"]);
        //        }

        //        int M = quantity - 1;
        //        totPrice = Price * M;

        //        con = new SqlConnection(Utils.getConnection());
        //        cmd = new SqlCommand("Cart_Crud", con);
        //        cmd.Parameters.AddWithValue("@Action", "MINUS");
        //        cmd.Parameters.AddWithValue("@ProductID", productID);
        //        cmd.Parameters.AddWithValue("@UserId", userId);
        //        cmd.Parameters.AddWithValue("@TotPrice", totPrice.ToString());
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        con.Open();
        //        cmd.ExecuteNonQuery();
        //        con.Close();
        //        getInfoProd();

        //    }
        //}

        //protected void lbPlus_Click(object sender, EventArgs e)
        //{

        //}
    }
}