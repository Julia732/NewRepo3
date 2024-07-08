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

namespace WebShop.Supplay
{
    public partial class OrdersDone : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        SqlDataReader dr;

        protected void Page_Load(object sender, EventArgs e)
        {
            Done();
        }

        void Done()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Order_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "ORD5");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rOrder3.DataSource = dt;
            rOrder3.DataBind();
        }
    }
}