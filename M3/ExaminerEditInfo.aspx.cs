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
    public partial class ExaminerEditInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            //created connection
            String id = Session["ID"].ToString();
            String name = (TextBox1.Text);
            String fieldofwork = (TextBox2.Text);
            String password = (TextBox3.Text);
            String email = (TextBox4.Text);
            String National = ListBox1.SelectedValue;

            SqlCommand profProc = null; ;
            if (ListBox1.SelectedValue.Equals("True") || (ListBox1.SelectedValue.Equals("False")))
            {
                profProc = new SqlCommand("editexaminerprof", conn);
            }
            else
            {
                Response.Write("Choose National or not");
            }
            profProc.CommandType = CommandType.StoredProcedure;
            profProc.Parameters.Add(new SqlParameter("@examinerId", id));
            profProc.Parameters.Add(new SqlParameter("@name", SqlDbType.VarChar)).Value = name;
            profProc.Parameters.Add(new SqlParameter("@fieldOfWork", SqlDbType.VarChar)).Value = fieldofwork;
            profProc.Parameters.Add(new SqlParameter("@isNational", SqlDbType.Bit)).Value = National;
            profProc.Parameters.Add(new SqlParameter("@password", SqlDbType.VarChar)).Value = password;
            profProc.Parameters.Add(new SqlParameter("@email", SqlDbType.VarChar)).Value = email;
            conn.Open();
            profProc.ExecuteNonQuery();
            Response.Write("You have edited your profile");
            conn.Close();
        }
        protected void search(object sender, EventArgs e)
        {
            Response.Redirect("Examinersearch.aspx");
        }
        protected void signout(object sender, EventArgs e)
        {
            Response.Redirect("Login Page.aspx");

        }
        protected void comment(object sender, EventArgs e)
        {
            Response.Redirect("Examinercomment.aspx");
        }
        protected void list(object sender, EventArgs e)
        {
            Response.Redirect("Examinerlist.aspx");
        }
        protected void grade(object sender, EventArgs e)
        {
            Response.Redirect("Examinergrade.aspx");
        }


    }
}
