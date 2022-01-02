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
    public partial class AddPublication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Add(object sender, EventArgs e)
        {
            String connStr = WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String title = Title.Text;
            String pubDate = PubDate.Text;
            String Host = host.Text;
            String Place = place.Text;
            int accepted = 0;
            String Snum = Session["serialNumber"].ToString();
            SqlCommand getPid = new SqlCommand("getPubID", conn);
            SqlCommand addpub = new SqlCommand("addPublication", conn);
            SqlCommand linkPub = new SqlCommand("linkPubThesis", conn);
            getPid.CommandType = CommandType.StoredProcedure;
            addpub.CommandType= CommandType.StoredProcedure;
            linkPub.CommandType= CommandType.StoredProcedure;
            getPid.Parameters.Add(new SqlParameter("@title", title));
            SqlParameter id=getPid.Parameters.Add(new SqlParameter("@id",SqlDbType.Int));
            id.Direction = ParameterDirection.Output;
            addpub.Parameters.Add(new SqlParameter("@title", title));
            addpub.Parameters.Add(new SqlParameter("@pubDate", pubDate));
            addpub.Parameters.Add(new SqlParameter("@host", Host));
            addpub.Parameters.Add(new SqlParameter("@place", Place));
            addpub.Parameters.Add(new SqlParameter("@accepted", accepted));
            conn.Open();
            if (title == "" || pubDate == "" || Host == "" || Place == "")
                Result.Text = "NO DATA ENTERED ! or MISSING DATA";
            else
            {
                addpub.ExecuteNonQuery();
                getPid.ExecuteNonQuery();
                linkPub.Parameters.Add(new SqlParameter("@PubID", id.Value));
                linkPub.Parameters.Add(new SqlParameter("@thesisSerialNo", Snum));
                linkPub.ExecuteNonQuery();
                conn.Close();
                string message = "Publication has been added to the ongoing Thesis with serial Number: "
                    +Snum;
                string t = "";
                DialogResult result = MessageBox.Show(message, t);
                if (result==DialogResult.OK)
                    Response.Redirect("Student_Main.aspx");
            }
        }
    }
}