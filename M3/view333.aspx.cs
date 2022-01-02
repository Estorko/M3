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
    public partial class view333 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
          //  if (x1.text.toString() => "3" || x1.text.toString() < "0" ) {
              //  Response.Write("invalid evaluation");
             //   else
               // {



                    string strcon = WebConfigurationManager.ConnectionStrings["PostGrad"].ToString();
                    SqlConnection con = new SqlConnection(strcon);

                    SqlCommand view1 = new SqlCommand("AddExaminer", con);
                    view1.CommandType = CommandType.StoredProcedure;


                    view1.Parameters.Add(new SqlParameter("@ThesisSerialNo", TextBox1.Text.ToString()));
                    view1.Parameters.Add(new SqlParameter("@DefenseDate", TextBox2.Text.ToString()));
                    view1.Parameters.Add(new SqlParameter("@ExaminerName", TextBox3.Text.ToString()));
                    view1.Parameters.Add(new SqlParameter("@National", TextBox1.Text.ToString()));
                    view1.Parameters.Add(new SqlParameter("@fieldOfWork", TextBox2.Text.ToString()));
                    view1.Parameters.Add(new SqlParameter("@Password", TextBox3.Text.ToString()));
           

                    con.Open();

                    view1.ExecuteNonQuery();
                    con.Close();
                }
          //  }
    }
}