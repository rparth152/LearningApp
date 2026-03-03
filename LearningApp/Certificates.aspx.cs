using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace LearningApp
{
    public partial class Certificates : System.Web.UI.Page
    {
        // Connection string (Web.config se uthayega)
        // string connString = ConfigurationManager.ConnectionStrings["MyDbConn"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Agar session user null hai to login pe bhej do (Optional)
                if (Session["Username"] == null)
                {
                    // Response.Redirect("Login.aspx");
                }

                // Database se data load karne ke liye niche wala function call karein
                // LoadCertificates();
            }
        }

        /* DATABASE SE DATA LANE KA LOGIC (Table 10):
           Jab tumhara database ready ho jaye, is function ko uncomment kar dena.
        */
        /*
        private void LoadCertificates()
        {
            using (SqlConnection con = new SqlConnection(connString))
            {
                // Table 10 se data uthane ki query
                string query = "SELECT CourseName, CompletionDate, CertificateID FROM Table10 WHERE UserID = @UserID";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserID", Session["UserID"]);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                // Agar Repeater use kar rahe ho to yahan bind hoga
                // rptCertificates.DataSource = dt;
                // rptCertificates.DataBind();
            }
        }
        */
    }
}
