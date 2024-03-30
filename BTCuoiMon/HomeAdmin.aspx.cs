using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Xml.Linq;

namespace BTCuoiMon
{
    public partial class HomeAdmin : System.Web.UI.Page
    {
        private SqlConnection Conn = new SqlConnection();
        private string connString = "Data Source=LAPTOP-04ME5USI;Initial Catalog=QL_Book;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //GridView1.DataSource = SqlDataSource2;
                GridView1.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string sqlInsert;
            sqlInsert = "Insert into Category(CategoryName) Values('"+txtCategoryName.Text+"')";

            SqlConnection Conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(sqlInsert, Conn);

            //Add Parameter
            //cmd.Parameters.AddWithValue("@categoryname", txtCategoryName.Text);

            int Added = 0;
            try
            {
                Conn.Open();
                Added = cmd.ExecuteNonQuery();
                lblResult.Text = Added.ToString() + " record inserted";
            }
            catch (Exception err)
            {
                lblResult.Text = "Error inserting record. ";
                lblResult.Text += err.Message;
            }
            finally { Conn.Close(); }
            if (Added > 0)
            {
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomeAdmin.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}