using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3
{
    public partial class Examiner_Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userType"] = 3;
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExaminerEditInfo.aspx");
        }

        protected void List_Click(object sender, EventArgs e)
        {
            Response.Redirect("ExaminerListAll.aspx");
        }

        protected void AddG_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDefenseGrade.aspx");
        }

        protected void AddC_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddComments.aspx");
        }

        protected void search(object sender, EventArgs e)
        {
            Response.Redirect("ExaminerSearch.aspx");
        }
    }
}
