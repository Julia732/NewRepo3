using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNetCore.Identity;
using IdentityResult = Microsoft.AspNet.Identity.IdentityResult;
using System.Data.SqlClient;
using System.Data;
using MySql.Data.MySqlClient;
using WebShop.Admin;
using Microsoft.Owin.Security;
using System.Xml.Linq;
using IdentityUser = Microsoft.AspNet.Identity.EntityFramework.IdentityUser;

namespace WebShop.Identity
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {

        }


        //protected void btnRegister_Click(object sender, EventArgs e)
        //{
        //    string actionName = string.Empty;
        //    bool isValidToExecure = false;
        //    int userId = Convert.ToInt32(Request.QueryString["id"]);
        //    con = new SqlConnection(Utils.getConnection());
        //    cmd = new SqlCommand("User_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", "INSERT");
        //    cmd.Parameters.AddWithValue("@Id", userId);
        //    cmd.Parameters.AddWithValue("@UserName", txtName.Text.Trim());
        //    cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
        //    isValidToExecure = true;

        //    if (isValidToExecure)
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        try
        //        {
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            actionName = userId == 0 ? "inserted" : "Updated";
        //            lblMsg.Visible = true;
        //            lblMsg.Text = "Вы зарегистрированы!";
        //            lblMsg.CssClass = "alert alert-success";
        //            Response.Redirect("Login.aspx");
        //            //getProducts();
        //            //Clear();
        //        }
        //        catch (Exception ex)
        //        {
        //            lblMsg.Visible = true;
        //            lblMsg.Text = "Error- " + ex.Message;
        //            lblMsg.CssClass = "alert alert-danger";
        //        }
        //        finally
        //        {
        //            con.Close();
        //        }
        //    }
        //}

      
        protected void CreateUser_Click(object sender, EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();
            var manager = new Microsoft.AspNet.Identity.UserManager<IdentityUser>(userStore);

            var user = new IdentityUser() { UserName = UserName.Text };
            IdentityResult result = manager.Create(user, Password.Text);

            if (result.Succeeded)
            {                
                Response.Redirect("Login.aspx");
                //StatusMessage.Text = string.Format("User {0} was created successfully!", user.UserName);
            }
            else
            {
                StatusMessage.Text = result.Errors.FirstOrDefault();
            }
        }
    }
}