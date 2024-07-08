using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop.User
{
    public partial class Sausage : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getSausege();
            }
        }

        void getSausege()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("GetProduct_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETSAUSAGE");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rMilk.DataSource = dt;
            rMilk.DataBind();

        }
    }
}