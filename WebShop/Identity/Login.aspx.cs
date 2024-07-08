using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using MySqlX.XDevAPI.Common;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using Microsoft.AspNetCore.Identity;
using IdentityUser = Microsoft.AspNet.Identity.EntityFramework.IdentityUser;
using static Mysqlx.Datatypes.Scalar.Types;
using System.Web.Http;

namespace WebShop.Identity
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (User.Identity.IsAuthenticated)
                {
                    StatusText.Text = string.Format( User.Identity.GetUserName() + ", вы уверены, что хотите выйти?");
                    LoginStatus.Visible = true;
                    LogoutButton.Visible = true;
                    lblText.Text = "ВЫХОД";
                }
                else
                {
                    LoginForm.Visible = true;
                    lblText.Text = "АВТОРИЗАЦИЯ";
                }
            }
        }
       
        protected void SignIn_Click(object sender, EventArgs e)
        {
            var userStore = new UserStore<IdentityUser>();
            var userManager = new Microsoft.AspNet.Identity.UserManager<IdentityUser>(userStore);
            var user = userManager.Find(UserName.Text, Password.Text);

            if (user != null)
            {
                var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
                var userIdentity = userManager.CreateIdentity(user, DefaultAuthenticationTypes.ApplicationCookie);

                authenticationManager.SignIn(new AuthenticationProperties() { IsPersistent = false }, userIdentity);

                
                var strCurrentUserId = userIdentity.GetUserId();
                string UserId = strCurrentUserId.ToString();

               
                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Roles_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "INSERT");                
                con.Open();
                cmd.Parameters.AddWithValue("@UserId", UserId);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.ExecuteNonQuery();
                con.Close();

                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Roles_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@UserID", UserId);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                string roleID = dt.Rows[0]["RoleId"].ToString();
                int myInt = int.Parse(roleID);

                if (myInt == 1) 
                {
                    Session["Admin"] = UserId;
                    Response.Redirect("../Admin/Dashboard.aspx");
                }
                else if (myInt == 2)
                {
                    Session["Supplayer"] = UserId;
                    Response.Redirect("../Supplay/OrdersS.aspx");
                }
                else if(myInt == 3)
                {
                    Session["UserId"] = UserId;
                    Response.Redirect("../User/Default.aspx");
                }
            }
            else
            {
                StatusText.Text = "Неверный пароль или логин.";
                LoginStatus.Visible = true;
            }
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            authenticationManager.SignOut();
            Response.Redirect("../Identity/Login.aspx");
        }
               

    }
}