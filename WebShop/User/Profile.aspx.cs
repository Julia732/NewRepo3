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
using WebShop.User.Catalogue;
using System.Web.UI.WebControls.WebParts;
using Microsoft.AspNetCore.Authentication;

namespace WebShop.User
{
    public partial class Profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
           

            getInformation();
            getOrderHistory();
            //getCardInf();
        }
                
        void getInformation()
        {
            string userId = User.Identity.GetUserId();
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Profile_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETBYID");
            cmd.Parameters.AddWithValue("@Id", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            txtLogin.Text = Convert.ToString(dt.Rows[0]["UserName"]);
            txtEmail.Text = Convert.ToString(dt.Rows[0]["Email"]);
            txtPhoneNumber.Text = Convert.ToString(dt.Rows[0]["PhoneNumber"]);
            txtTown.Text = Convert.ToString(dt.Rows[0]["Town"]);
            txtStreet.Text = Convert.ToString(dt.Rows[0]["Street"]);
            txtApartment.Text = Convert.ToString(dt.Rows[0]["Apartment"]);            
            
        }

        //void getCardInf()
        //{
        //    string userId = User.Identity.GetUserId();
        //    con = new SqlConnection(Utils.getConnection());
        //    cmd = new SqlCommand("Order_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "GETPAY");
        //    cmd.Parameters.AddWithValue("@UserId", userId);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    sda = new SqlDataAdapter(cmd);
        //    dt = new DataTable();
        //    sda.Fill(dt);
        //    if (dt.Rows.Count > 0)
        //    {
        //        txtCardNumber.Text = Convert.ToString(dt.Rows[0]["CardNo"]);
        //        txtDateEnd.Text = Convert.ToString(dt.Rows[0]["ExpirtDate"]);
        //    }            
        //}

        //void getDetail()
        //{
        //    var commandArgument = Session["CommandArgument"];
        //    lbl
        //}

        void getOrderHistory()
        {
            int sr = 1;
            string userId = User.Identity.GetUserId();
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GET");
            cmd.Parameters.AddWithValue("@UserId", userId);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            dt.Columns.Add("SrNo", typeof(Int32));
            if(dt.Rows.Count > 0)
            {
                foreach(DataRow dataRow in dt.Rows)
                {
                    dataRow["SrNo"] = sr;
                    sr++;
                }
            }
            rHistory.DataSource = dt;
            rHistory.DataBind();
        }

        void Clear()
        {
            tbLogin.Text = string.Empty;
            tbEmail.Text = string.Empty;
            tbPhoneNumber.Text = string.Empty;
            tbTown.Text = string.Empty;
            tbStreet.Text = string.Empty;
            tbApartment.Text = string.Empty;
            //txtDateEndNew.Text = string.Empty;
            //txtCardNumberNew.Text = string.Empty;
        }

        protected void btn_Click(object sender, EventArgs e)
        {
            string none = "";
            string userId = User.Identity.GetUserId();
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Profile_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "UPDATE");
            cmd.Parameters.AddWithValue("@Id", userId); 
            if(tbLogin.Text == none)
            {
                cmd.Parameters.AddWithValue("@UserName", txtLogin.Text.Trim());
            }
            else
            {
                cmd.Parameters.AddWithValue("@UserName", tbLogin.Text.Trim());
            }
            if (tbEmail.Text == none)
            {
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Email", tbEmail.Text.Trim());
            }
            if (tbPhoneNumber.Text == none)
            {
                cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text.Trim());
            }
            else
            {
                cmd.Parameters.AddWithValue("@PhoneNumber", tbPhoneNumber.Text.Trim());
            }
            if (tbTown.Text == none)
            {
                cmd.Parameters.AddWithValue("@Town", txtTown.Text.Trim());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Town", tbTown.Text.Trim());
            }
            if (tbStreet.Text == none)
            {
                cmd.Parameters.AddWithValue("@Street", txtStreet.Text.Trim());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Street", tbStreet.Text.Trim());
            }
            if (tbApartment.Text == none)
            {
                cmd.Parameters.AddWithValue("@Apartment", txtApartment.Text.Trim());
            }
            else
            {
                cmd.Parameters.AddWithValue("@Apartment", tbApartment.Text.Trim());
            }               
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                lblMsg.Visible = true;
                lblMsg.Text = "Изменения сохранены!";
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
           

            //if(txtCardNumberNew.Text == none && txtDateEndNew.Text == none)
            //{
            //    //string _cardNo = txtCardNumber.Text.Trim();
            //    //_cardNo = string.Format("************{0}", txtCardNumber.Text.Trim().Substring(12, 4));
            //    con = new SqlConnection(Utils.getConnection());
            //    cmd = new SqlCommand("Profile_Crud", con);
            //    cmd.Parameters.AddWithValue("@Action", "INSERT");
            //    cmd.Parameters.AddWithValue("@UserID", userId);
            //    cmd.Parameters.AddWithValue("@CardNo", txtCardNumber.Text.Trim());
            //    cmd.Parameters.AddWithValue("@ExpirtDate", txtDateEnd.Text.Trim());
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    try
            //    {
            //        con.Open();
            //        cmd.ExecuteNonQuery();
            //        lblMsg.Visible = true;
            //        lblMsg.Text = "Данные успешно изменены!";
            //        lblMsg.CssClass = "alert alert-success";
            //    }
            //    catch (Exception ex)
            //    {
            //        lblMsg.Visible = true;
            //        lblMsg.Text = "Error- " + ex.Message;
            //        lblMsg.CssClass = "alert alert-danger";
            //    }
            //    finally
            //    {
            //        con.Close();
            //    }
            //}
            //else
            //{
            //    con = new SqlConnection(Utils.getConnection());
            //    cmd = new SqlCommand("Order_Crud", con);
            //    cmd.Parameters.AddWithValue("@Action", "UPDATE");
            //    cmd.Parameters.AddWithValue("@UserID", userId);
            //    //string _cardNo = txtCardNumber.Text.Trim();
            //    //_cardNo = string.Format("************{0}", txtCardNumber.Text.Trim().Substring(12, 4));
            //    //string _cardNo2 = txtCardNumber.Text.Trim();
            //    //_cardNo2 = string.Format("************{0}", txtCardNumberNew.Text.Trim().Substring(12, 4));
            //    if (txtCardNumberNew.Text == none)
            //    {
            //        cmd.Parameters.AddWithValue("@CardNo", txtCardNumber.Text.Trim());
            //    }
            //    else
            //    {
            //        cmd.Parameters.AddWithValue("@CardNo", txtCardNumberNew.Text.Trim());
            //    }
            //    if (txtDateEndNew.Text == none)
            //    {
            //        cmd.Parameters.AddWithValue("@ExpirtDate", txtDateEnd.Text.Trim());
            //    }
            //    else
            //    {
            //        cmd.Parameters.AddWithValue("@ExpirtDate", txtDateEndNew.Text.Trim());
            //    }
            //    cmd.CommandType = CommandType.StoredProcedure;
            //    try
            //    {
            //        con.Open();
            //        cmd.ExecuteNonQuery();
            //        lblMsg.Visible = true;
            //        lblMsg.Text = "Изменения сохранены!";
            //        lblMsg.CssClass = "alert alert-success";
            //    }
            //    catch (Exception ex)
            //    {
            //        lblMsg.Visible = true;
            //        lblMsg.Text = "Error- " + ex.Message;
            //        lblMsg.CssClass = "alert alert-danger";
            //    }
            //    finally
            //    {
            //        con.Close();
            //    }
            //}
            getInformation();
            //getCardInf();
            Clear();
        }

        protected void rHistory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
            Session["CommandArgument"] = e.CommandArgument;
            Response.Redirect("Shop.aspx");
            //string userId = User.Identity.GetUserId();
            //con = new SqlConnection(Utils.getConnection());
            //cmd = new SqlCommand("Order_Crud", con);
            //cmd.Parameters.AddWithValue("@Action", "GETW");
            //cmd.Parameters.AddWithValue("@UserId", userId);
            //cmd.Parameters.AddWithValue("@OrderNo", e.CommandArgument);
            //cmd.CommandType = CommandType.StoredProcedure;
            //sda = new SqlDataAdapter(cmd);
            //dt = new DataTable();
            //sda.Fill(dt);
            //rDetail.DataSource = dt;
            //rDetail.DataBind();
            //lblForText.Text = "Детали заказа с кодом: " + e.CommandArgument;
            //lblForText.Visible = true;
        }

        //internal class CustomTemplate : ITemplate
        //{
        //    private ListItemType ListItemType { get; set; }

        //    public CustomTemplate(ListItemType type)
        //    {
        //        ListItemType = type;
        //    }

        //    public void InstantiateIn(Control container)
        //    {
        //        if (ListItemType == ListItemType.Footer)
        //        {
        //            var footer = new LiteralControl("<tr>");
        //            container.Controls.Add(footer);
        //        }
        //    }
        //}
    }

    
}
