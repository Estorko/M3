using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace M3
{
    public partial class AddPhoneNumber : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
     
        protected void Add(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String id = ID.Text;
            String p_number = phoneNumber.Text;
            SqlCommand AddPhone = new SqlCommand("addMobile", conn);
            AddPhone.CommandType = CommandType.StoredProcedure;
            SqlParameter found = AddPhone.Parameters.Add("@found", SqlDbType.Int);
            AddPhone.Parameters.Add(new SqlParameter("@ID", id));
            AddPhone.Parameters.Add(new SqlParameter("@mobile_number", p_number));
            found.Direction = ParameterDirection.Output;

            conn.Open();
            if (id == "" || p_number == "")
                Result.Text = "No Data entered !";
            else if (found.Value.ToString() == "1")
                Result.Text = "Phone Number already added !";
            else
            {
                AddPhone.ExecuteNonQuery();
                string message = "Success !, Mobile Number added";
                string t = "";
                DialogResult result = MessageBox.Show(message, t);
                if (result == DialogResult.OK)
                {
                    String type = Session["userType"].ToString();
                    if (type == "0")
                        Response.Redirect("Student_Main.aspx");
                }
            }
            conn.Close();

        }
    }
}