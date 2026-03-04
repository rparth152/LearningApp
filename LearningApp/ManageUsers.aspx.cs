using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearningApp
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                LoadUsers();
            }


        }

        public void getDataTable()
        {
            if (gvUsers.Rows.Count > 0)
            {

                gvUsers.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        void LoadUsers()
        {


            string query = "exec sp_ManageUsers";

            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvUsers.DataSource = dt;
            gvUsers.DataBind();
            getDataTable();
        }

       

        protected void gvUSers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label l2 = (Label)gvUsers.Rows[e.RowIndex].FindControl("Label1");
            int id = int.Parse(l2.Text);
            string q = $"exec sp_DeleteUser '{id}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            Response.Write("<script>alert('User Deleted successfully')</script>");

            LoadUsers();
            getDataTable();




        }
    }
}