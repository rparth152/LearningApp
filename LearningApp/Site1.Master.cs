using System;
using System.Web;

namespace LearningApp
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Testing ke liye dono true rakhe hain
                phAdmin.Visible = true;
                phUser.Visible = true;

                if (Session["Username"] != null)
                {
                    lblUserName.Text = Session["Username"].ToString();
                }
            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}