using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Viewallsup.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Viewallthesis.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("ongoingthesis.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Response.Redirect("Viewallthesis.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Response.Redirect("update.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Response.Redirect("issuepayment.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("issuethesis.aspx");
        }
    }
}