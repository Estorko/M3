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
    public partial class issuepayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String strcon = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection con = new SqlConnection(strcon);

            int id = Int16.Parse(TextBox1.Text);
            string date = TextBox2.Text;

            SqlCommand AdminIssueInstallPayment = new SqlCommand("AdminIssueInstallPayment3", con);
            AdminIssueInstallPayment.CommandType = CommandType.StoredProcedure;

            AdminIssueInstallPayment.Parameters.Add(new SqlParameter("@paymentID", id));
            AdminIssueInstallPayment.Parameters.Add(new SqlParameter("@InstallStartDate", date));

            SqlParameter s = AdminIssueInstallPayment.Parameters.Add("@check", SqlDbType.Int);
            s.Direction = ParameterDirection.Output;

            con.Open();
            AdminIssueInstallPayment.ExecuteNonQuery();
            con.Close();

            if (s.Value.ToString() == "1")
            {
                Response.Write("Payment issued Successfully");
            }
            else
            {
                Response.Write("Payment ID not in the system");
            }

        }
    }
}