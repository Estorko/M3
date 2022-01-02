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
    public partial class view44 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int x = integer(ev.Text.ToString());
            Response.Redirect("view44.aspx");
            if (x >= 3 || x < 0)
            {
                Response.Write("invalid evaluation");
            }
            else
            {
                string strcon = WebConfigurationManager.ConnectionStrings["PostGrad"].ToString();
                SqlConnection con = new SqlConnection(strcon);

                SqlCommand view1 = new SqlCommand("EvaluateProgressReport", con);
                view1.CommandType = CommandType.StoredProcedure;


                view1.Parameters.Add(new SqlParameter("@supervisorID", TextBox1.Text.ToString()));
                view1.Parameters.Add(new SqlParameter("@thesisSerialNo", TextBox2.Text.ToString()));
                view1.Parameters.Add(new SqlParameter("@progressReportNo", TextBox3.Text.ToString()));
                view1.Parameters.Add(new SqlParameter("@evaluation", ev.Text.ToString()));

                con.Open();
                view1.ExecuteNonQuery();
                con.Close();
            }
        }

        private int integer(string v)
        {
            throw new NotImplementedException();
        }
    }
}