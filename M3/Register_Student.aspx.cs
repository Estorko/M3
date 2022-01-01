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
            int Gucian = 0;
            if (Yes.Checked)
                Gucian = 1;
            int type = 0;
            SqlCommand studentRegister = new SqlCommand("studentRegister", conn);
            SqlCommand userExists = new SqlCommand("userLogin", conn);
            studentRegister.CommandType = CommandType.StoredProcedure;
            userExists.CommandType = CommandType.StoredProcedure;
            userExists.Parameters.Add(new SqlParameter("@email", email));
            userExists.Parameters.Add(new SqlParameter("@password", password));
            userExists.Parameters.Add(new SqlParameter("@type", type));
            SqlParameter success = userExists.Parameters.Add("@success", SqlDbType.Int);
            studentRegister.Parameters.Add(new SqlParameter("@first_name", firstName));
            studentRegister.Parameters.Add(new SqlParameter("@last_name", lastName));
            studentRegister.Parameters.Add(new SqlParameter("@password", password));
            studentRegister.Parameters.Add(new SqlParameter("@faculty", faculty));
            studentRegister.Parameters.Add(new SqlParameter("@Gucian", Gucian));
            studentRegister.Parameters.Add(new SqlParameter("@email", email));
            studentRegister.Parameters.Add(new SqlParameter("@address", address));
            success.Direction = ParameterDirection.Output;
            SqlCommand getID = new SqlCommand("getID", conn);
            getID.CommandType = CommandType.StoredProcedure;
            getID.Parameters.Add(new SqlParameter("@email", email));
            SqlParameter id = getID.Parameters.Add("@id", SqlDbType.Int);
            id.Direction = ParameterDirection.Output;

            conn.Open();
            userExists.ExecuteNonQuery();
            if (success.Value.ToString() == "1")
                Result.Text = "Invalid Registration, User already exists !";
            else if (firstName == "")
                Result.Text = "NO DATA ENTERED !";
            else
            {
                studentRegister.ExecuteNonQuery();
                getID.ExecuteNonQuery();
                Session["ID"] = id.Value;
                Session["mail"] = email;
                Session["Gucian"] = Gucian;
                Result.Text = "Success !, User Created";
                userExists.ExecuteNonQuery();
                if (success.Value.ToString() == "1")
                {
                    Response.Redirect("Student_Main.aspx");
                    conn.Close();
                }
            }
            conn.Close();
        }

    
    }
}