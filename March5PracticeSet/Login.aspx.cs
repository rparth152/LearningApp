using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ELearningPlatform
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        { 
            string cs = ConfigurationManager.ConnectionStrings["ELearningConn"].ConnectionString;

           
            conn = new SqlConnection(cs);
            conn.Open();
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (email == "" || password == "")
            {
                lblMessage.Text = "Please fill all fields!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return; 
            }

            string q = $"exec sp_LoginUser '{email}','{password}'";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();

            
            ada.Fill(ds);

            if (ds.Tables[0].Rows.Count == 0)
            {
                lblMessage.Text = "Invalid Email or Password!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return; 
            }

            
            DataRow row = ds.Tables[0].Rows[0];

        
            string userId = row["UserId"].ToString();
            string username = row["Username"].ToString();
            string roleName = row["RoleName"].ToString();
            string fieldName = row["FieldsName"].ToString();

       
            Session["UserId"] = userId;
            Session["Username"] = username;
            Session["RoleName"] = roleName;
            Session["FieldName"] = fieldName;

            if (roleName == "Admin")
            {
               // admin dashboard
                Response.Redirect(" "); 
            }
            else if (roleName == "User")
            {
                // user dashboard
                Response.Redirect(" "); 
            }
           
        }
    }
}