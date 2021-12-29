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
    public partial class Register_Examiner : System.Web.UI.Page
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
            String fieldofWork = fieldOfWork.Text;
            String email = Email.Text;
            int is_National=0;
            bool isChecked = Yes.Checked;
            if (isChecked)
                is_National = 1;
            int type = 3;
            SqlCommand ExaminerRegister = new SqlCommand("examinerRegister", conn);
            SqlCommand userExits = new SqlCommand("userLogin", conn);
            ExaminerRegister.CommandType = CommandType.StoredProcedure;
            userExits.CommandType = CommandType.StoredProcedure;
            userExits.Parameters.Add(new SqlParameter("@email", email));
            userExits.Parameters.Add(new SqlParameter("@password", password));
            userExits.Parameters.Add(new SqlParameter("@type", type));
            SqlParameter success = userExits.Parameters.Add("@success", SqlDbType.Int);
            ExaminerRegister.Parameters.Add(new SqlParameter("@first_name", firstName));
            ExaminerRegister.Parameters.Add(new SqlParameter("@last_name", lastName));
            ExaminerRegister.Parameters.Add(new SqlParameter("@password", password));
            ExaminerRegister.Parameters.Add(new SqlParameter("@fieldOfWork", fieldofWork));
            ExaminerRegister.Parameters.Add(new SqlParameter("@email", email));
            ExaminerRegister.Parameters.Add(new SqlParameter("@isNational", is_National));
            success.Direction = ParameterDirection.Output;

            conn.Open();
            userExits.ExecuteNonQuery();
            if (success.Value.ToString() == "1")
                Response.Text = "Invalid Registration, User already exists !";
            else if (firstName == "" || lastName == "" || password == "" || fieldofWork == "" || 
                email == "" ||(Yes.Checked == false && No.Checked==false))
                Response.Text = "NO DATA ENTERED !";
            else
            {
                ExaminerRegister.ExecuteNonQuery();
                Response.Text = "Success !, User Created";
                conn.Close();
                //   Response.Redirect("Student_Main.aspx");
            }
            conn.Close();
        }


    }
}
