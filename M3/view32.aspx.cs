using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace milestone3
{
    public partial class view32 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["PostGrad"].ToString();
            SqlConnection con = new SqlConnection(strcon);
            SqlCommand view1 = new SqlCommand("ViewAStudentPublications", con);
            view1.CommandType = CommandType.StoredProcedure;

            string x = (Session["id2"]).ToString();
            view1.Parameters.Add(new SqlParameter("@StudentID", x));


            con.Open();

            SqlDataReader rdr1 = view1.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            while (rdr1.Read())
            {
                


                int s = rdr1.GetInt32(rdr1.GetOrdinal("id"));
                String f = rdr1.GetString(rdr1.GetOrdinal("title"));
                
                DateTime SD = rdr1.GetDateTime(rdr1.GetOrdinal("dateOfPublication"));
                String f1 = rdr1.GetString(rdr1.GetOrdinal("place"));
                int N = rdr1.GetInt32(rdr1.GetOrdinal("accepted"));
                String f2 = rdr1.GetString(rdr1.GetOrdinal("host"));


                


                TableRow x2 = new TableRow();

                TableCell x3 = new TableCell();
                x3.Text = s.ToString();
                x3.Font.Size = FontUnit.XLarge;
                x3.Font.Bold = true;

                TableCell x4 = new TableCell();
                x4.Text = f;
                x4.Font.Size = FontUnit.XLarge;
                x4.Font.Bold = true;
                TableCell x5 = new TableCell();
                x5.Text = SD.ToString();
                x5.Font.Size = FontUnit.XLarge;
                x5.Font.Bold = true;
                TableCell x6 = new TableCell();
                x6.Text = f1;
                x6.Font.Size = FontUnit.XLarge;
                x6.Font.Bold = true;
                TableCell x7 = new TableCell();
                x7.Text = N.ToString();
                x7.Font.Size = FontUnit.XLarge;
                x7.Font.Bold = true;
                TableCell x8 = new TableCell();
                x8.Text =f2;
                x8.Font.Size = FontUnit.XLarge;
                x8.Font.Bold = true;


                x2.Controls.Add(x3);
                x2.Controls.Add(x4);
                x2.Controls.Add(x5);
                x2.Controls.Add(x6);
                x2.Controls.Add(x7);
                x2.Controls.Add(x8);


                Table1.Controls.Add(x2);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("suprvisor.aspx");
        }
    }
}