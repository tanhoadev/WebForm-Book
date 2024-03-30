using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTCuoiMon
{
    public partial class Author : System.Web.UI.Page
    {
        private SqlConnection Conn = new SqlConnection();
        private string connString = "Data Source=LAPTOP-04ME5USI;Initial Catalog=QL_Book;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GridView1.DataBind();
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            Response.Redirect("Author.aspx");
        }

        protected void btnThem_Click(object sender, EventArgs e)
        {
            string sqlInsert;
            sqlInsert = "Insert into Author(AuthorName, AuthorEmail, AuthorAddress) Values('" + txtName.Text + "', '"+txtEmail.Text+"', '"+txtAddress.Text+"')";

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

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {

        }
    }
}