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
    public partial class issuethesis : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strcon = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection con = new SqlConnection(strcon);

            int id = Int16.Parse(TextBox1.Text);
            decimal amount = Decimal.Parse(TextBox2.Text);
            int install = Int16.Parse(TextBox3.Text);
            decimal fp = Decimal.Parse(TextBox4.Text);

            SqlCommand proc5 = new SqlCommand("AdminIssueThesisPayment", con);
            proc5.CommandType = CommandType.StoredProcedure;

            proc5.Parameters.Add(new SqlParameter("@ThesisSerialNo", id));
            proc5.Parameters.Add(new SqlParameter("@amount", amount));
            proc5.Parameters.Add(new SqlParameter("@noOfInstallments", install));
            proc5.Parameters.Add(new SqlParameter("@fundPercentage", fp));

            SqlParameter success = proc5.Parameters.Add("@check", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;

            con.Open();
            proc5.ExecuteNonQuery();
            con.Close();


            if (success.Value.ToString() == "1")
            {
                Response.Write(" Payment issued successfully");
            }
            else
            {
                Response.Write("Serial Number is not in the system");
            }

        }
    }
}