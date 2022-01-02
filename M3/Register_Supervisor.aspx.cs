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
    public partial class Register_Supervisor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String firstName = FName.Text;
            String lastName = LName.Text;
            String password = Password.Text;
            String faculty = Faculty.Text;
            String email = Email.Text;
            int type = 2;
            SqlCommand SupervisorRegister = new SqlCommand("supervisorRegister", conn);
            SqlCommand userExits = new SqlCommand("userLogin", conn);
            SupervisorRegister.CommandType = CommandType.StoredProcedure;
            userExits.CommandType = CommandType.StoredProcedure;
            userExits.Parameters.Add(new SqlParameter("@email", email));
            userExits.Parameters.Add(new SqlParameter("@password", password));
            userExits.Parameters.Add(new SqlParameter("@type", type));
            SqlParameter success = userExits.Parameters.Add("@success", SqlDbType.Int);
            SupervisorRegister.Parameters.Add(new SqlParameter("@first_name", firstName));
            SupervisorRegister.Parameters.Add(new SqlParameter("@last_name", lastName));
            SupervisorRegister.Parameters.Add(new SqlParameter("@password", password));
            SupervisorRegister.Parameters.Add(new SqlParameter("@faculty", faculty));
            SupervisorRegister.Parameters.Add(new SqlParameter("@email", email));
            success.Direction = ParameterDirection.Output;

            conn.Open();
            userExits.ExecuteNonQuery();
            if (success.Value.ToString() == "1")
                Result.Text = "Invalid Registration, User already exists !";
            else if (firstName == "" || lastName == "" || password == "" || email == "")
                Result.Text = "NO DATA ENTERED !";
            else
            {
                SupervisorRegister.ExecuteNonQuery();
                Result.Text = "Success !, User Created";
                conn.Close();
                   Response.Redirect("suprvisor.aspx");
            }
            conn.Close();
        }
    }
}