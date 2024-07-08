using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebShop.Admin.MainCategory
{
    public partial class MainCategory : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCumbPage"] = "Категории";
                getCategories();
            }
            lblMsg.Visible = false;
        }

        void getCategories()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Category_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "GETALL");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rMainCategory.DataSource = dt;
            rMainCategory.DataBind();
        }

        //protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        //{
        //    string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
        //    bool isValidToExecure = false;
        //    int mainCategoryId = Convert.ToInt32(hfMainCategoryId.Value);
        //    con = new SqlConnection(Utils.getConnection());
        //    cmd = new SqlCommand("MainCategory_Crud", con);
        //    cmd.Parameters.AddWithValue("@Action", mainCategoryId == 0 ? "INSERT" : "UPDATE");
        //    cmd.Parameters.AddWithValue("@MainCategoryID", mainCategoryId);
        //    cmd.Parameters.AddWithValue("@NameCategory", txtMainCategoryName.Text.Trim());
        //    cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);
        //    if (fuCategoryImage.HasFile)
        //    {
        //        if (Utils.isValidExtension(fuCategoryImage.FileName))
        //        {
        //            string newImageName = Utils.getUniqueId();
        //            fileExtension = Path.GetExtension(fuCategoryImage.FileName);
        //            imagePath = "Images/MainCategory/" + newImageName.ToString() + fileExtension;
        //            fuCategoryImage.PostedFile.SaveAs(Server.MapPath("~/Images/MainCategory/") + newImageName.ToString() + fileExtension);
        //            cmd.Parameters.AddWithValue("@CategoryImageUrl", imagePath);
        //            isValidToExecure = true;
        //        }
        //        else
        //        {
        //            lblMsg.Visible = false;
        //            lblMsg.Text = "Пожалуйста, выберите фото для категории";
        //            lblMsg.CssClass = "alert alert-danger";
        //            isValidToExecure = false;
        //        }
        //    }
        //    else
        //    {
        //        isValidToExecure = true;
        //    }

        //    if (isValidToExecure)
        //    {
        //        cmd.CommandType = CommandType.StoredProcedure;
        //        try
        //        {
        //            con.Open();
        //            cmd.ExecuteNonQuery();
        //            actionName = mainCategoryId == 0 ? "inserted" : "Updated";
        //            lblMsg.Visible = true;
        //            lblMsg.Text = "Category " + actionName + " successfully!";
        //            lblMsg.CssClass = "alert alert-success";
        //            getCategories();
        //            Clear();
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

        //protected void btnClear_Click(object sender, EventArgs e)
        //{
        //    Clear();
        //}

        //void Clear()
        //{
        //    txtMainCategoryName.Text = string.Empty;
        //    cbIsActive.Checked = false;
        //    hfMainCategoryId.Value = "0";
        //    btnAddOrUpdate.Text = "Add";
        //    imagePreview.ImageUrl = string.Empty;
        //}

        protected void rMainCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
           
        }
    }
}