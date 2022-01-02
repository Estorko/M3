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
    public partial class ExaminerListAll : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void List_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand ExaminerListAll = new SqlCommand("AdminViewStudentThesisBySupervisor", conn);
            ExaminerListAll.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader rdr = ExaminerListAll.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String info1 = rdr.GetString(rdr.GetOrdinal("first_name"));
                String info2 = rdr.GetString(rdr.GetOrdinal("title"));
                String info3 = rdr.GetString(rdr.GetOrdinal("first_name"));
                Label ssfirst_name = new Label();
                ssfirst_name.Text = info1 + "<br >";
                form1.Controls.Add(ssfirst_name);
                Label title = new Label();
                title.Text = info2 + "<br >";
                form1.Controls.Add(title);
                Label sfirst_name = new Label();
                sfirst_name.Text = info3 + "<br >";
                form1.Controls.Add(sfirst_name);
            }
        }
    }
}