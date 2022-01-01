﻿using System;
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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login(object sender, EventArgs e)
        {
            String connStr =WebConfigurationManager.ConnectionStrings["PostGradOffice"].ToString();
            //create new connection
            SqlConnection conn = new SqlConnection(connStr);
            String email = Email.Text;
            String pass = password.Text;
            SqlCommand loginproc = new SqlCommand("userLogin", conn);
            loginproc.CommandType = CommandType.StoredProcedure;
            loginproc.Parameters.Add(new SqlParameter("@email", email));
            loginproc.Parameters.Add(new SqlParameter("@password", pass));
            SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);
            SqlParameter type = loginproc.Parameters.Add("@type", SqlDbType.Int);
            success.Direction = ParameterDirection.Output;
            type.Direction = ParameterDirection.Output;
            conn.Open();
            loginproc.ExecuteNonQuery();
            if (success.Value.ToString() == "1")
            {
                Session["mail"] = email;
                SqlCommand getID = new SqlCommand("getID", conn);
                getID.CommandType = CommandType.StoredProcedure;
                getID.Parameters.Add(new SqlParameter("@email", email));
                SqlParameter id = getID.Parameters.Add("@id", SqlDbType.Int);
                id.Direction = ParameterDirection.Output;
                getID.ExecuteNonQuery();
                Session["ID"] = id.Value;
                SqlCommand Gucian = new SqlCommand("checkType", conn);
                Gucian.Parameters.Add(new SqlParameter("@id", id.Value));
                SqlParameter gucian = Gucian.Parameters.Add("@type", SqlDbType.Int);
                gucian.Direction = ParameterDirection.Output;
                Gucian.ExecuteNonQuery();
                Session["Gucian"] = gucian.Value;
                conn.Close();
                if (type.Value.ToString() == "0")
                    Response.Redirect("Student_Main.aspx");
                //else if(type.Value.ToString()=="1")
                //else if (type.Value.ToString()=="2")
                //else if (type.Value.ToString()=="3")
            }
            else Response.Write("Wrong password or email !");
        }
    }
}