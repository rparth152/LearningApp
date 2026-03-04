using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearningApp
{
    public partial class Addquiz : System.Web.UI.Page
    {

        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cnf = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cnf);
            conn.Open();
            if (!IsPostBack)
            {
                Session["courseid"] = "";
                Session["userid"] = "2";
                fetchcourse();
            }
        }
        public void fetchcourse()
        {
            string userid = Session["userid"].ToString();
            string q = $"select * from Courses where {userid}= uid";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            DropDownList1.DataSource = rdr;
            DropDownList1.DataTextField = "coursename";
            DropDownList1.DataValueField = "courseid";
            //Session["courseid"] = int.Parse(DropDownList2.DataValueField);
            DropDownList1.DataBind();

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int courseid = int.Parse(DropDownList1.SelectedValue);

            string q = $"select * from Modules where courseid = {courseid}";

            SqlCommand cmd = new SqlCommand(q, conn);
           
            SqlDataReader rdr = cmd.ExecuteReader();

            DropDownList2.DataSource = rdr;
            DropDownList2.DataTextField = "title";
            DropDownList2.DataValueField = "moduleid";
            DropDownList2.DataBind();

        }
        public void fetchQuizname() {
            int courseid = int.Parse(DropDownList1.SelectedValue);
            string q = $"select * from Quizzes where courseid = {courseid}";

            SqlCommand cmd = new SqlCommand(q, conn);

            SqlDataReader rdr = cmd.ExecuteReader();

            DropDownList3.DataSource = rdr;
            DropDownList3.DataTextField = "title";
            DropDownList3.DataValueField = "quizid";
            DropDownList3.DataBind();
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            int selectedCourseId = int.Parse(DropDownList1.SelectedValue);
            int selectedModuleId = int.Parse(DropDownList2.SelectedValue);
            string quizTitle = TextBox1.Text;
            string q = $"exec InsertQuiz '{selectedCourseId}','{selectedModuleId}','{quizTitle}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            TextBox1.Text = "";
            fetchQuizname();
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            int quizid = int.Parse(DropDownList3.SelectedValue);
            string question = TextBox5.Text;
            string optionA = TextBox6.Text;
            string optionB = TextBox7.Text;
            string optionC = TextBox8.Text;
            string optionD = TextBox9.Text;
            string correct = DropDownList4.SelectedValue;
            string q = $"exec InsertQuestion '{quizid}','{question}','{optionA}','{optionB}','{optionC}','{optionD}','{correct}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            TextBox5.Text = "";
            TextBox6.Text = "";
            TextBox7.Text = "";
            TextBox8.Text = "";
            TextBox9.Text = "";

        }
        }
}