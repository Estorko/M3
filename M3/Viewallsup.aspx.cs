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
    public partial class Viewallsup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strcon = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection con = new SqlConnection(strcon);

            SqlCommand proc1 = new SqlCommand("AdminListSup", con);
            proc1.CommandType = CommandType.StoredProcedure;

            con.Open();
            SqlDataReader r = proc1.ExecuteReader();
            GridView1.DataSource = r;
            GridView1.DataBind();
            con.Close();

        }
    }
}