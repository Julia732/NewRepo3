using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop.Admin
{
    public partial class Company : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Session["breadCumbTitle"] = "Управление категориями";
            Session["breadCumbPage"] = "Производители";
            lblMsg.Visible = false;
            getCompany();
        }

        void getCompany()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Company_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETALL");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rCompany.DataSource = dt;
            rCompany.DataBind();
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecure = false;
            int companyId = Convert.ToInt32(hfCompanyId.Value);
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Company_Crud", con);
            cmd.Parameters.AddWithValue("@Action", companyId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@CompanyId", companyId);
            cmd.Parameters.AddWithValue("@CompanyName", txtCompanyName.Text.Trim());
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);
            if (fuCompanyImage.HasFile)
            {
                if (Utils.isValidExtension(fuCompanyImage.FileName))
                {
                    string newImageName = Utils.getUniqueId();
                    fileExtension = Path.GetExtension(fuCompanyImage.FileName);
                    imagePath = "Images/Company/" + newImageName.ToString() + fileExtension;
                    fuCompanyImage.PostedFile.SaveAs(Server.MapPath("~/Images/Company/") + newImageName.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@CompanyImageUrl", imagePath);
                    isValidToExecure = true;
                }
                else
                {
                    lblMsg.Visible = false;
                    lblMsg.Text = "Пожалуйста, выберите фото для категории";
                    lblMsg.CssClass = "alert alert-danger";
                    isValidToExecure = false;
                }
            }
            else
            {
                isValidToExecure = true;
            }

            if (isValidToExecure)
            {
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    actionName = companyId == 0 ? "inserted" : "Updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Компания" + actionName + " успешно!";
                    lblMsg.CssClass = "alert alert-success";
                    getCompany();
                    Clear();
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
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        void Clear()
        {
            txtCompanyName.Text = string.Empty;
            cbIsActive.Checked = false;
            hfCompanyId.Value = "0";
            btnAddOrUpdate.Text = "Добавить";
            imagePreview.ImageUrl = string.Empty;
        }

        protected void rCompany_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            if (e.CommandName == "edit")
            {
                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Company_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@CompanyID", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtCompanyName.Text = dt.Rows[0]["CompanyName"].ToString();
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imagePreview.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["CompanyImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["CompanyImageUrl"].ToString();
                imagePreview.Height = 200;
                imagePreview.Width = 200;
                hfCompanyId.Value = dt.Rows[0]["CompanyId"].ToString();
                btnAddOrUpdate.Text = "Изменить";
            }
            else if (e.CommandName == "delete")
            {
                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Company_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@CompanyID", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Компания удалена!";
                    lblMsg.CssClass = "alert alert-success";
                    getCompany();
                    Clear();
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
            }
        }
    }
    
}