using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LearningApp
{
    public partial class CreateCourse : System.Web.UI.Page
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
                fetchfields();
                fetchcourse();
                //Label4.Visible = false;
                //Label5.Visible = false;
                //Label6.Visible = false;
                //TextBox3.Visible = false;
                //TextBox4.Visible = false;
                //FileUpload1.Visible = false;
                //Button2.Visible = false;
                //Label7.Visible = false;
            }
            
            
        }

        public void fetchfields() {
            string q = "select * from Fields";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            DropDownList1.DataSource=rdr;
            DropDownList1.DataTextField = "FieldName";
            DropDownList1.DataValueField = "FieldID";
            DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string userid = Session["userid"].ToString();
            string courseName = TextBox1.Text;
            Session["Coursename"] = courseName;
            string courseDesc = TextBox2.Text;
            int fieldID = int.Parse(DropDownList1.SelectedValue);
            string q = $"exec addCourse '{courseName}','{courseDesc}','{fieldID}','{userid}'";

            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();
            //if (rdr.Read())
            //{
            //    Session["courseid"] = Convert.ToInt32(rdr["courseid"]);
            //}
            Label1.Visible = false;
            Label2.Visible = false;
            Label3.Visible = false;
            TextBox1.Visible = false;
            TextBox2.Visible = false;
            DropDownList1.Visible = false;

            //Label4.Visible = true;
            //Label5.Visible = true;
            //Label6.Visible = true;
            //TextBox3.Visible = true;
            //TextBox4.Visible = true;
            //FileUpload1.Visible = true;
            //Button2.Visible = true;
            //Label7.Visible = true;

            Label7.Text = $"Select {courseName} from dropdown list to add modules in the course";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string Modulename= TextBox3.Text;
            string Moduledesc= TextBox4.Text;
            FileUpload1.SaveAs(Server.MapPath("Videos/") + Path.GetFileName(FileUpload1.FileName));
            string video = "Videos/" + Path.GetFileName(FileUpload1.FileName);
            int courseid = int.Parse(DropDownList2.SelectedValue);
            //int courseid = Convert.ToInt32(Session["courseid"]);
            string q = $"exec InsertModule '{courseid}','{Modulename}','{Moduledesc}','{video}'";
            SqlCommand cmd = new SqlCommand(q, conn);
            cmd.ExecuteNonQuery();
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;

            ClientScript.RegisterStartupScript(this.GetType(), "clearFile",
                "document.getElementById('" + FileUpload1.ClientID + "').value = '';", true);
            Response.Write("<Script>aleart('Module added succesfully')</Script>"); 


        }
        public void fetchcourse() {
            string userid = Session["userid"].ToString();
            string q = $"select * from Courses where {userid}= uid";
            SqlCommand cmd = new SqlCommand(q, conn);
            SqlDataReader rdr = cmd.ExecuteReader();

            DropDownList2.DataSource = rdr;
            DropDownList2.DataTextField = "coursename";
            DropDownList2.DataValueField = "courseid";
            //Session["courseid"] = int.Parse(DropDownList2.DataValueField);
            DropDownList2.DataBind();

        }
    }
}