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
    public partial class ongoingthesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String strcon = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection con = new SqlConnection(strcon);

            SqlCommand proc2 = new SqlCommand("AdminViewOnGoingTheses", con);
            proc2.CommandType = CommandType.StoredProcedure;
            SqlParameter count = proc2.Parameters.Add("@thesesCount", SqlDbType.Int);
            count.Direction = System.Data.ParameterDirection.Output;


            con.Open();
            proc2.ExecuteNonQuery();
            con.Close();
           Response.Write(count.Value.ToString());

        }
    }
}