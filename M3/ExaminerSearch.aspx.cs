using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3
{
    public partial class ExaminerSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void search(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            String keyword = TextBox1.Text;
            SqlCommand profProc = new SqlCommand("Examinersearch", conn);
            profProc.CommandType = CommandType.StoredProcedure;
            profProc.Parameters.Add(new SqlParameter("@keyword", SqlDbType.VarChar)).Value = keyword;
            conn.Open();
            SqlDataReader reader = profProc.ExecuteReader();
            GridView1.DataSource = reader;
            GridView1.DataBind();
            conn.Close();
        }
        protected void signout(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void edit(object sender, EventArgs e)
        {
            Response.Redirect("ExaminerEditInfo.aspx");
        }

        protected void list(object sender, EventArgs e)
        {
            Response.Redirect("ExaminerListAll.aspx");
        }

        protected void comment(object sender, EventArgs e)
        {
            Response.Redirect("AddComments.aspx");
        }

        protected void grade(object sender, EventArgs e)
        {
            Response.Redirect("AddDefenseGrade.aspx");
        }
    }
}
