using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace milestone3
{
    public partial class suprvisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userType"] = 2;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("view1.aspx");
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("view3.aspx");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("view22.aspx");
        }
        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("view333.aspx");
        }
        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("view44.aspx");
        }
        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("view55.aspx");
        }
    }
}