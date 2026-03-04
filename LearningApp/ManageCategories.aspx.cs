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
    public partial class ManageCategories : System.Web.UI.Page
    {
        SqlConnection conn;
        protected void Page_Load(object sender, EventArgs e)
        {
            string cs = ConfigurationManager.ConnectionStrings["dbconn"].ConnectionString;
            conn = new SqlConnection(cs);
            conn.Open();

            if (!IsPostBack)
            {
               LoadCategories();
            }
        
            

        }

        public void getDataTable()
        {
            if (gvCategories.Rows.Count > 0)
            {

                gvCategories.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }

        void LoadCategories()
        {
           
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Fields", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvCategories.DataSource = dt;
                gvCategories.DataBind();
            getDataTable();


        }

        // ADD CATEGORY
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string fieldName = txtCategory.Text;

            string q = $"exec sp_saveFields '{fieldName}'";
            SqlCommand cmd = new SqlCommand(q,conn);
            cmd.ExecuteNonQuery();
           
            Response.Write("<script>alert('FieldName Added')</script>");
            LoadCategories();

            txtCategory.Text = "";
            getDataTable();
        }

         
        

        // edit
        protected void gvCategories_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvCategories.EditIndex = e.NewEditIndex;
            LoadCategories();
        }

        // cancel editing
        protected void gvCategories_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvCategories.EditIndex = -1;
            getDataTable();
            LoadCategories();

        }

        //Row Updating
        protected void gvCategories_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = int.Parse(gvCategories.DataKeys[e.RowIndex].Value.ToString());
            string name = ((System.Web.UI.WebControls.TextBox)gvCategories.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            string q = $"exec sp_UpdateFields '{id}','{name}'";
                SqlCommand cmd = new SqlCommand(q, conn);
               
                cmd.ExecuteNonQuery();
            

            gvCategories.EditIndex = -1;
            LoadCategories();
        }

        // delete
        protected void gvCategories_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = int.Parse(gvCategories.DataKeys[e.RowIndex].Value.ToString());

            string q = $"exec sp_deleteFields '{id}'";
                SqlCommand cmd = new SqlCommand(q, conn);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.ExecuteNonQuery();
            

            LoadCategories();
        }

        


    }
    }