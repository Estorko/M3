using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace M3
{
    public partial class Register_Homepage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GUCianRegister(object sender, EventArgs e)
        {
            Response.Redirect("Register_GucianStudent.aspx");     
        }
        protected void NonGUCianRegister(object sender, EventArgs e)
        {
            Response.Redirect("Register_NonGucianStudent.aspx");     
            
        } protected void SupervisorRegister(object sender, EventArgs e)
        {
            Response.Redirect("Register_Supervisor.aspx");     
            
        } protected void ExaminerRegister(object sender, EventArgs e)
        {
            Response.Redirect("Register_Examiner.aspx");
            
        }
    }
}