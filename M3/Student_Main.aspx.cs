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
    public partial class Student_Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Profile_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String email = Session["user"].ToString();
            SqlCommand getID = new SqlCommand("getID", conn);
            SqlCommand ViewProfile = new SqlCommand("AdminViewStudentProfile", conn);
            getID.CommandType = CommandType.StoredProcedure;
            ViewProfile.CommandType = CommandType.StoredProcedure;
            getID.Parameters.Add(new SqlParameter("@email", email));
            SqlParameter id = getID.Parameters.Add("@id", SqlDbType.Int);
            id.Direction=ParameterDirection.Output;
            ViewProfile.Parameters.Add(new SqlParameter("@sid", id.Value));
            conn.Open();
            getID.ExecuteNonQuery();
            ViewProfile.ExecuteNonQuery();
            SqlDataReader rdr = ViewProfile.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String Id = rdr.GetString(rdr.GetOrdinal("id"));
                Label i_d = new Label();
                i_d.Text = Id;
                Output.Controls.Add(i_d);
            }



        }

        protected void Theses_Click(object sender, EventArgs e)
        {

        }

        protected void Grades_Click(object sender, EventArgs e)
        {

        }

        protected void pReport_Click(object sender, EventArgs e)
        {

        }

        protected void Publication_Click(object sender, EventArgs e)
        {

        }
       
    }
}