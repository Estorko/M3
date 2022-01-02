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
    public partial class AddComments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddC_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            _ = (int)Session["user"];
            _ = Int16.Parse(SerialNo.Text);
            _ = Date.Text;
            _ = Comments.Text;
            SqlCommand AddComments = new SqlCommand("AddCommentsGrade", conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            AddComments.Parameters.Add(new SqlParameter("@ThesisSerialNo", SerialNo));
            AddComments.Parameters.Add(new SqlParameter("@DefenseDate", Date));
            AddComments.Parameters.Add(new SqlParameter("@comments", Comments));
            conn.Open();
            AddComments.ExecuteNonQuery();
            conn.Close();
        }
    }
}