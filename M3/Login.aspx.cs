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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            String connStr =WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            int id = Int16.Parse(Username.Text);
            String pass = password.Text;
            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.Parameters.Add(new SqlParameter("@id", id));
            loginproc.Parameters.Add(new SqlParameter("@password", pass));
            SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Bit);
            SqlParameter type = loginproc.Parameters.Add("@type", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            type.Direction = ParameterDirection.Output;
            conn.Open();
            loginproc.ExecuteNonQuery();
            conn.Close();
            if (success.Value.ToString() == "1")
            {
                Response.Write("TRUE");
                //Response.Redirect
            }
        

        }
    }
}