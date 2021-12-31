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
        public Student_Main()
        {

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Profile_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String email = Session["mail"].ToString();
            String id = Session["ID"].ToString();
            SqlCommand ViewProfile = new SqlCommand("viewMyProfile", conn);
            ViewProfile.CommandType = CommandType.StoredProcedure;
            conn.Open();
            ViewProfile.Parameters.Add(new SqlParameter("@studentId", id));
            ViewProfile.ExecuteNonQuery();
            SqlDataReader rdr = ViewProfile.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                String first_Name = rdr.GetString(rdr.GetOrdinal("firstName"));
                String last_Name = rdr.GetString(rdr.GetOrdinal("lastName"));
                String type = rdr.GetString(rdr.GetOrdinal("type"));
                String faculty = rdr.GetString(rdr.GetOrdinal("faculty"));
                String address = rdr.GetString(rdr.GetOrdinal("address"));
                Decimal GPA = rdr.GetDecimal(rdr.GetOrdinal("GPA"));
                Label Fname = new Label();
                Label Lname = new Label();
                Label Type = new Label();
                Label fac = new Label();
                Label addr = new Label();
                Label gpa = new Label();
                Label mail = new Label();
                Label undergrad_ID = new Label();
                Fname.Text = "First Name: " + first_Name + "<br>";
                Lname.Text = "Last Name: " + last_Name + "<br>";
                mail.Text = "Email: " + email + "<br>";
                if (type == "0")
                    Type.Text = "Type: Non-Gucian <br>";
                else
                {
                    Type.Text = "Type: Gucian <br>";
                    int undergradID = rdr.GetInt32(rdr.GetOrdinal("undergradID"));
                    undergrad_ID.Text = "UnderGrad_ID: " + undergradID.ToString() + "<br>";
                }
                fac.Text = "Faculty: " + faculty + "<br>";
                addr.Text = "Address: " + address + "<br>";
                gpa.Text = "GPA: " + GPA.ToString() + "<br>";
                Output.Controls.Add(Fname);
                Output.Controls.Add(Lname);
                Output.Controls.Add(Type);
                Output.Controls.Add(fac);
                Output.Controls.Add(addr);
                Output.Controls.Add(gpa);
                Output.Controls.Add(undergrad_ID);
                Output.Controls.Add(mail);
            }
        }

        protected void Theses_Click(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String id = Session["ID"].ToString();
            DataTable res = new DataTable();
            Label outp = new Label();
            using (SqlCommand ViewThesis = new SqlCommand("ViewStudentThesis", conn))
            {
                ViewThesis.CommandType = CommandType.StoredProcedure;
                ViewThesis.Parameters.Add(new SqlParameter("@sid", id));
                using (SqlDataAdapter da = new SqlDataAdapter(ViewThesis))
                {
                    conn.Open();
                    da.Fill(res);
                    conn.Close();
                }
            }
            for (int j = 0; j < res.Rows.Count; j++)
            {
                for (int i = 0; i < res.Columns.Count; i++)
                {
                    outp.Text+=(res.Columns[i].ColumnName.ToUpper() + ": "+(res.Rows[j].ItemArray[i]+"<br>"));
                    if (i+1 >= res.Columns.Count)
                        outp.Text += "<br>";
                }
            }
            Output.Controls.Add(outp);
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