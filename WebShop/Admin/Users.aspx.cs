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

namespace WebShop.Admin
{
    public partial class Users : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCumbPage"] = "Пользователи";
                getUsers();
            }
            lblMsg.Visible = false;
        }

        void getUsers()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT4ADMIN");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rUsers.DataSource = dt;
            rUsers.DataBind();
        }

        protected void rUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            Session["GetId"] = e.CommandArgument;
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETINF");
            cmd.Parameters.AddWithValue("@UserId", e.CommandArgument);
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            lblUserName.Text = dt.Rows[0]["UserName"].ToString();
            ddlRole.SelectedValue = dt.Rows[0]["Id"].ToString();
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            var itemId = Session["GetId"];
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("User_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "UPDATEITEM");
            cmd.Parameters.AddWithValue("@UserID", itemId.ToString());
            cmd.Parameters.AddWithValue("@RoleID", ddlRole.SelectedValue);
            cmd.CommandType = CommandType.StoredProcedure;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            getUsers();
        }
    }
}