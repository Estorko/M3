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
            conn.Open();
            getID.ExecuteNonQuery();
            ViewProfile.Parameters.Add(new SqlParameter("@sid", id.Value));
            ViewProfile.ExecuteNonQuery();
            SqlDataReader rdr = ViewProfile.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                int Id = rdr.GetInt32(rdr.GetOrdinal("id"));
                String pass = rdr.GetString(rdr.GetOrdinal("password"));
                String first_Name = rdr.GetString(rdr.GetOrdinal("firstName"));
                String last_Name = rdr.GetString(rdr.GetOrdinal("lastName"));
                Label i_d = new Label();
                Label mail = new Label();
                Label password = new Label();
                i_d.Text = "ID: " + Id.ToString();
                mail.Text = "Email: " + email;
                password.Text = "Password: " + pass;
                Output.Controls.Add(i_d);
                Output.Controls.Add(mail);
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