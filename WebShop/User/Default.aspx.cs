using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebShop.User
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //    if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            //    {
            //        form1.Attributes.Remove("class", "sub_page");
            //    }
            //    else
            //    {
            //        form1.Attributes.Remove("class");
            //        Control sliderUserControl = (Control)Page.LoadControl("SliderUserControl.aspx");
            //        pnlSliderUs.Controls.Add(sliderUserControl);
            //    }


            //if (Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
            //{
            //    Control SliderUserControl = (Control)Page.LoadControl("SliderUserControl.ascx");
            //    pnlSlider.Controls.Add(SliderUserControl);
            //}
        }

        //protected void btnGetMilk_Click(object sender, ImageClickEventArgs e)
        //{
        //    Response.Redirect("Cart.aspx");
        //}

        //protected void btnAddOrUpdate_Click(object sender, EventArgs e)
        //{

        //}
    }
}