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
    public partial class view11 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["PostGrad"].ToString();
            SqlConnection con = new SqlConnection(strcon);

            SqlCommand view1 = new SqlCommand("ViewSupStudentsYears", con);
            view1.CommandType = CommandType.StoredProcedure;

            string x = (Session["id"]).ToString();
            view1.Parameters.Add(new SqlParameter("@supervisorID", x));


            con.Open();

            SqlDataReader rdr1 = view1.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

            while (rdr1.Read())
            {

                
                String f = rdr1.GetString(rdr1.GetOrdinal("firstname"));
                String T = rdr1.GetString(rdr1.GetOrdinal("years"));
           

                TableRow x2 = new TableRow();

                TableCell x3 = new TableCell();
                x3.Text = T;
                x3.Font.Size = FontUnit.XLarge;
                x3.Font.Bold = true;

                TableCell x4 = new TableCell();
                x4.Text = f;
                x4.Font.Size = FontUnit.XLarge;
                x4.Font.Bold = true;
                

                x2.Controls.Add(x3);
                x2.Controls.Add(x4);
                

                Table1.Controls.Add(x2);
            }
        }

       

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("suprvisor.aspx");
        }
    }
}