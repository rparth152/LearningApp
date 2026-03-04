using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace ELearningPlatform
{
    public partial class Register : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbConn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                LoadFields();
            }
        }

        public void LoadFields()
        {
            string q = "exec sp_GetAllFields";
            SqlDataAdapter ada = new SqlDataAdapter(q, conn);
            DataSet ds = new DataSet();
            ada.Fill(ds);
            ddlField.DataSource = ds;
            ddlField.DataTextField = "FieldsName";
            ddlField.DataValueField = "FieldsId";
            ddlField.DataBind();
            ddlField.Items.Insert(0, new ListItem("-- Select Field --", "0"));
        }

      
        protected void btnRegister_Click(object sender, EventArgs e)
        {
        
            string username = txtUsername.Text.Trim();
            string email = txtEmail.Text.Trim();
            string password = txtPassword.Text.Trim();
            int fieldId = Convert.ToInt32(ddlField.SelectedValue);

            if (username == "" || email == "" || password == "" || fieldId == 0)
            {
                lblMessage.Text = "Please fill all fields!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return; 
            }

      
            string q = $"exec sp_RegisterUser '{username}','{email}','{password}','{fieldId}', 2";
            SqlCommand cmd = new SqlCommand(q, conn);
            string result = cmd.ExecuteScalar().ToString();
            if (result == "SUCCESS")
            {

                Response.Redirect("Login.aspx");
            }
            else if (result == "EMAIL_EXISTS")
            { 
                lblMessage.Text = "Email already exists! Please use another email.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}
