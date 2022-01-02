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
    public partial class view55 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["PostGrad"].ToString();
            SqlConnection con = new SqlConnection(strcon);

            SqlCommand view1 = new SqlCommand("CancelThesis", con);
            view1.CommandType = CommandType.StoredProcedure;


            view1.Parameters.Add(new SqlParameter("@ThesisSerialNo", TextBox1.Text.ToString()));
            con.Open();
            view1.ExecuteNonQuery();
            con.Close();
        }
    }
}