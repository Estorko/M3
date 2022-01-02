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
    public partial class FillProgressReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String Snum = Session["serialNumber"].ToString();
            String Sid = Session["ID"].ToString();
            String Date = PrDate.Text;
            String R_number = Rnumber.Text;
            String State = state.Text;
            String desc = description.Text;
            SqlCommand addPR = new SqlCommand("AddProgressReport", conn);
            SqlCommand fillPR = new SqlCommand("FillProgressReport", conn);
            addPR.CommandType = CommandType.StoredProcedure;
            fillPR.CommandType = CommandType.StoredProcedure;
            addPR.Parameters.Add(new SqlParameter("@thesisSerialNo", Snum));
            addPR.Parameters.Add(new SqlParameter("@progressReportDate", Date));
            addPR.Parameters.Add(new SqlParameter("@studentID", Sid));
            addPR.Parameters.Add(new SqlParameter("@progressReportNo", R_number));
            fillPR.Parameters.Add(new SqlParameter("@thesisSerialNo", Snum));
            fillPR.Parameters.Add(new SqlParameter("@studentID", Sid));
            fillPR.Parameters.Add(new SqlParameter("@progressReportNo", R_number));
            fillPR.Parameters.Add(new SqlParameter("@state", State));
            fillPR.Parameters.Add(new SqlParameter("@description", desc));
            conn.Open();
            if (Date == "" || R_number == "" || State == "" || desc == "")
                Result.Text = "NO DATA ENTERED ! or MISSING DATA";
            else
            {
                addPR.ExecuteNonQuery();
                fillPR.ExecuteNonQuery();
                conn.Close();
                string message = "Progress Report Number: "+ R_number+
                    "has been added to the ongoing Thesis with serial Number: "+ Snum;
                string t = "";
                DialogResult result = MessageBox.Show(message, t);
                if (result == DialogResult.OK)
                    Response.Redirect("Student_Main.aspx");
            }
        }
    }
}