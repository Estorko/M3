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
    public partial class Register_GucianStudent : System.Web.UI.Page
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
            String address = Address.Text;
            int Gucian = 1;
            int type = 0;
            SqlCommand GucianRegister = new SqlCommand("studentRegister", conn);
            SqlCommand userExits = new SqlCommand("userLogin", conn);
            GucianRegister.CommandType = CommandType.StoredProcedure;
            userExits.CommandType = CommandType.StoredProcedure;
            userExits.Parameters.Add(new SqlParameter("@email", email));
            userExits.Parameters.Add(new SqlParameter("@password", password));
            userExits.Parameters.Add(new SqlParameter("@type", type));
            SqlParameter success = userExits.Parameters.Add("@success", SqlDbType.Int);
            GucianRegister.Parameters.Add(new SqlParameter("@first_name", firstName));
            GucianRegister.Parameters.Add(new SqlParameter("@last_name", lastName));
            GucianRegister.Parameters.Add(new SqlParameter("@password", password));
            GucianRegister.Parameters.Add(new SqlParameter("@faculty", faculty));
            GucianRegister.Parameters.Add(new SqlParameter("@Gucian", Gucian));
            GucianRegister.Parameters.Add(new SqlParameter("@email", email));
            GucianRegister.Parameters.Add(new SqlParameter("@address", address));
            success.Direction = ParameterDirection.Output;

            conn.Open();
            userExits.ExecuteNonQuery();
            if (success.Value.ToString() == "1")
                Response.Text = "Invalid Registration, User already exists !";
            else if (firstName == "")
                Response.Text = "NO DATA ENTERED !";
            else
            {
                GucianRegister.ExecuteNonQuery();
                conn.Close();
             //   Response.Redirect("Student_Main.aspx");
            }
            conn.Close();
        }

    
    }
}