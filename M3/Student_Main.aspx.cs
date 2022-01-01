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
        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AddP_R")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[rowIndex];
                Session["serialNumber"] = row.Cells[2].Text;
                Response.Redirect("FillProgressReport.aspx");
            }
            if (e.CommandName == "AddPub")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[rowIndex];
                Session["serialNumber"] = row.Cells[2].Text;
                Response.Redirect("AddPublication.aspx");
            }
        }
        protected void Profile_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = false;
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
                Output.Controls.Add(Fname); Output.Controls.Add(Lname); Output.Controls.Add(Type);
                Output.Controls.Add(fac); Output.Controls.Add(addr); Output.Controls.Add(gpa);
                Output.Controls.Add(undergrad_ID);Output.Controls.Add(mail);
            }
        }

        protected void Theses_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String id = Session["ID"].ToString();
            SqlCommand listThesis = new SqlCommand("ViewStudentThesis", conn);
            listThesis.Parameters.Add(new SqlParameter("@sid", id));
            listThesis.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader r = listThesis.ExecuteReader();
            GridView1.DataSource = r;
            GridView1.DataBind();
            conn.Close();
        }

        protected void Grades_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView2.Visible = false;
            String id = Session["ID"].ToString();
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            SqlCommand listcourse = new SqlCommand("ViewCoursesGrades", conn);
            listcourse.Parameters.Add(new SqlParameter("@studentID", id));
            listcourse.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader r = listcourse.ExecuteReader();
            GridView1.DataSource = r;
            GridView1.DataBind();
            conn.Close();
        }

        protected void pReport_Click(object sender, EventArgs e)
        {
            GridView1.Visible = false;
            GridView2.Visible = true;
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String id = Session["ID"].ToString();
            SqlCommand listThesis = new SqlCommand("ViewStudentOngoingTheis", conn);
            listThesis.Parameters.Add(new SqlParameter("@sid", id));
            listThesis.CommandType = CommandType.StoredProcedure;
            conn.Open();
            SqlDataReader r = listThesis.ExecuteReader();
            GridView2.DataSource = r;
            GridView2.DataBind();
            conn.Close();
        }


        
    }
}