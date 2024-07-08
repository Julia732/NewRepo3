using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

namespace WebShop.User
{
    public partial class Tea : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getTea();
            }
        }

        void getTea()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("GetProduct_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETTEA");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rTea.DataSource = dt;
            rTea.DataBind();

        }

        protected void rTea_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["ProductID"] = e.CommandArgument;
            string userId = User.Identity.GetUserId();
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Cart_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
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
            if (e.CommandName == "addToCart")
            {
                if (Session["UserId"] != null)
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

                    totPrice = Price * quantity;
                    // string userId = User.Identity.GetUserId();
                    // bool isCartItemUpdated = false;
                    int i = quantity;
                    if (i == 0)
                    {

                        con = new SqlConnection(Utils.getConnection());
                        cmd = new SqlCommand("Cart_Crud", con);
                        cmd.Parameters.AddWithValue("@Action", "INSERTW");
                        cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
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

                        //lblMsg.Visible = true;
                        //lblMsg.Text = "Товар в корзину добавлен";
                        //lblMsg.CssClass = "alert alert-success";
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
                        cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
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
            }
            else if (e.CommandName == "getInform")
            {
                Response.Redirect("ShopDetail.aspx");
            }
        }
    }
}