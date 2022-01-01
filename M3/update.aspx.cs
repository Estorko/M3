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
    public partial class update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String strcon = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection con = new SqlConnection(strcon);


            int id = Int16.Parse(TextBox1.Text);


            SqlCommand proc3 = new SqlCommand("AdminUpdateExtension", con);
            proc3.CommandType = CommandType.StoredProcedure;

            proc3.Parameters.Add(new SqlParameter("@ThesisSerialNo", id));

            SqlParameter s = proc3.Parameters.Add("@Check", SqlDbType.Int);
            s.Direction = ParameterDirection.Output;

            con.Open();
            proc3.ExecuteNonQuery();
            con.Close();

            if (s.Value.ToString() == "1")
            {
                Response.Write(" Updated Sucessfulyy");
            }
            else
            {
                Response.Write("serial number is not in the system");

            }

        }
    }
}