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
    public partial class Product : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["breadCumbPage"] = "Товары";
                getProducts();
            }
            lblMsg.Visible = false;
        }

        void getProducts()
        {
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", "SELECT");
            cmd.CommandType = CommandType.StoredProcedure;
            sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            rProduct.DataSource = dt;
            rProduct.DataBind();
        }

        protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        {
           
        }

        void Clear()
        {
            txtProductName.Text = string.Empty;
            txtDescription.Text = string.Empty;
            txtEnergyValue.Text = string.Empty;
            txtPrice.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            txtSize.Text = string.Empty;
            ddlCompany.ClearSelection();
            ddlCategories.ClearSelection();
            cbIsActive.Checked = false;
            hfProductId.Value = "0";
            btnAddOrUpdate.Text = "Добавить";
            imagePreview.ImageUrl = string.Empty;
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void rProduct_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            lblMsg.Visible = false;
            if (e.CommandName == "edit")
            {
                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "GETBYID");
                cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
                txtProductName.Text = dt.Rows[0]["ProductName"].ToString();
                txtDescription.Text = dt.Rows[0]["LongDescription"].ToString();
                txtEnergyValue.Text = dt.Rows[0]["EnergyValue"].ToString();
                txtPrice.Text = dt.Rows[0]["Price"].ToString();
                txtQuantity.Text = dt.Rows[0]["Quantity"].ToString();
                txtSize.Text = dt.Rows[0]["Size"].ToString();
                ddlCompany.SelectedValue = dt.Rows[0]["CompanyId"].ToString();
                ddlCategories.SelectedValue = dt.Rows[0]["CategoryId"].ToString(); 
                cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);
                imagePreview.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ProductImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["ProductImageUrl"].ToString();
                imagePreview.Height = 200;
                imagePreview.Width = 200;
                hfProductId.Value = dt.Rows[0]["ProductId"].ToString();
                btnAddOrUpdate.Text = "Изменить";
            }
            else if (e.CommandName == "delete")
            {
                con = new SqlConnection(Utils.getConnection());
                cmd = new SqlCommand("Product_Crud", con);
                cmd.Parameters.AddWithValue("@Action", "DELETE");
                cmd.Parameters.AddWithValue("@ProductID", e.CommandArgument);
                cmd.CommandType = CommandType.StoredProcedure;
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    lblMsg.Visible = true;
                    lblMsg.Text = "Товар удален!";
                    lblMsg.CssClass = "alert alert-success";
                    getProducts();
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

        protected void rProduct_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
           
        }

        protected void rCategory_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }

        protected void btnAddOrUpdate_Click1(object sender, EventArgs e)
        {
            string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
            bool isValidToExecure = false;
            int productId = Convert.ToInt32(hfProductId.Value);
            con = new SqlConnection(Utils.getConnection());
            cmd = new SqlCommand("Product_Crud", con);
            cmd.Parameters.AddWithValue("@Action", productId == 0 ? "INSERT" : "UPDATE");
            cmd.Parameters.AddWithValue("@ProductID", productId);
            cmd.Parameters.AddWithValue("@ProductName", txtProductName.Text.Trim());
            cmd.Parameters.AddWithValue("@LongDescription", txtDescription.Text.Trim());
            cmd.Parameters.AddWithValue("@EnergyValue", txtEnergyValue.Text.Trim());
            cmd.Parameters.AddWithValue("@Price", txtPrice.Text.Trim());
            cmd.Parameters.AddWithValue("@Quantity", txtQuantity.Text.Trim());
            cmd.Parameters.AddWithValue("@Size", txtSize.Text.Trim());
            cmd.Parameters.AddWithValue("@CompanyId", ddlCompany.SelectedValue);
            cmd.Parameters.AddWithValue("@CategoryId", ddlCategories.SelectedValue);
            cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);
            if (fuProductImage.HasFile)
            {
                if (Utils.isValidExtension(fuProductImage.FileName))
                {
                    string newImageName = Utils.getUniqueId();
                    fileExtension = Path.GetExtension(fuProductImage.FileName);
                    imagePath = "Images/Product/" + newImageName.ToString() + fileExtension;
                    fuProductImage.PostedFile.SaveAs(Server.MapPath("~/Images/Product/") + newImageName.ToString() + fileExtension);
                    cmd.Parameters.AddWithValue("@ProductImageUrl", imagePath);
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
                    actionName = productId == 0 ? "inserted" : "Updated";
                    lblMsg.Visible = true;
                    lblMsg.Text = "Товар " + actionName + " успешно!";
                    lblMsg.CssClass = "alert alert-success";
                    getProducts();
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