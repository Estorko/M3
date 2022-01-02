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
    public partial class AddDefenseGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AddG_Click(object sender, EventArgs e)
        {
            string connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            _ = (int)Session["user"];
            _ = Int16.Parse(SerialNo.Text);
            _ = Date.Text;
            _ = float.Parse(Grade.Text);

            SqlCommand AddDefenseGrade = new SqlCommand("AddDefenseGrade", conn);
            AddDefenseGrade.CommandType = CommandType.StoredProcedure;
            AddDefenseGrade.Parameters.Add(new SqlParameter("@ThesisSerialNo", SerialNo));
            AddDefenseGrade.Parameters.Add(new SqlParameter("@DefenseDate", Date));
            AddDefenseGrade.Parameters.Add(new SqlParameter("@grade", Grade));

            conn.Open();
            AddDefenseGrade.ExecuteNonQuery();
            conn.Close();
        }
    }
}