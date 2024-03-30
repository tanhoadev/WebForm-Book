using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace BTCuoiMon
{
    public partial class Book : System.Web.UI.Page
    {
        private string connString = "Data Source=LAPTOP-04ME5USI;Initial Catalog=QL_Book;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FIllCategory();
                FillAuthor();
            }
        }
        private void FIllCategory()
        {
            ddlCategoryID.Items.Clear();
            string sqlString = "Select * from Category";
            SqlConnection Conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(sqlString, Conn);
            SqlDataReader reader;
            try
            {
                Conn.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    ListItem item = new ListItem();
                    item.Value = reader["CategoryID"].ToString();
                    ddlCategoryID.Items.Add(item);
                }
                reader.Close();
            }
            catch (Exception err)
            {
                lblResult.Text = "Error reding list. ";
                lblResult.Text += err.Message;
            }
            finally
            {
                Conn.Close();
            }
        }
        private void FillAuthor()
        {
            ddlAuthorID.Items.Clear();
            string sqlString = "Select * from Author";
            SqlConnection Conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(sqlString, Conn);
            SqlDataReader reader;
            try
            {
                Conn.Open();
                reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    ListItem item = new ListItem();
                    item.Value = reader["AuthorID"].ToString();
                    ddlAuthorID.Items.Add(item);
                }
                reader.Close();
            }
            catch (Exception err)
            {
                lblResult.Text = "Error reading list. ";
                lblResult.Text += err.Message;
            }
            finally
            {
                Conn.Close();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Book.aspx");
        }

        protected void brnSave_Click(object sender, EventArgs e)
        {
            string sqlInsert;
            sqlInsert = "Insert into Book(";
            sqlInsert += "Title, AuthorID, Price, Images, CategoryID, Description, Published, ViewCount) ";
            sqlInsert += "Values(@title, @authorid, @price, @images, @categoryID, @description, @published, @viewCount)";

            SqlConnection Conn = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand(sqlInsert, Conn);

            //Add Parameter
            //@title, @authorid, @price, @images, @categoryID, @description, @published, @viewCount)"
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@authorid", int.Parse(ddlAuthorID.SelectedItem.Value));
            cmd.Parameters.AddWithValue("@price", decimal.Parse(txtPrice.Text));
            cmd.Parameters.AddWithValue("@images", txtImages.Text);
            cmd.Parameters.AddWithValue("@categoryID", int.Parse(ddlCategoryID.SelectedItem.Value));
            cmd.Parameters.AddWithValue("@description", txtDes.Text);
            cmd.Parameters.AddWithValue("@published", DateTime.Parse(txtPublished.Text));
            cmd.Parameters.AddWithValue("@viewCount", int.Parse(txtViewCount.Text));

            int added = 0;
            try
            {
                Conn.Open();
                added = cmd.ExecuteNonQuery();
                lblResult.Text = added.ToString() + " record inserted";
            }
            catch (Exception err)
            {
                lblResult.Text = "Error inserting record. ";
                lblResult.Text += err.Message;
            }
            finally
            {
                Conn.Close();
            }
        }
    }
}