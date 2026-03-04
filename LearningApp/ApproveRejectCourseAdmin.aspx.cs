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
    public partial class ApproveRejectCourseAdmin : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
                LoadCourses();
            }


        }


        public void getDataTable()
        {
            if (gvCourses.Rows.Count > 0)
            {

                gvCourses.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        void LoadCourses()
        {


            string query = "exec sp_ApproveRejectPedndingCourse";

                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvCourses.DataSource = dt;
                gvCourses.DataBind();

            getDataTable();



        }

        protected void gvCourses_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {


            if (e.CommandName == "Approve" || e.CommandName == "Reject" || e.CommandName == "Pending")
            {
                int courseId = int.Parse(e.CommandArgument.ToString());

                string status = "";

                if (e.CommandName == "Approve")
                    status = "Approved";
                else if (e.CommandName == "Reject")
                    status = "Rejected";
                else if (e.CommandName == "Pending")
                    status = "Pending";

                string q = $"exec sp_UpdateCourseStatus '{courseId}','{status}' "; 
                SqlCommand cmd = new SqlCommand( q , conn);
                    cmd.ExecuteNonQuery();

                getDataTable();
                LoadCourses();
            }
        }

    }

}
