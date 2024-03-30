﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTCuoiMon
{
    public partial class CategoryItem : System.Web.UI.Page
    {
        private int CategoryID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { // Giới hạn số lượng bản ghi trả về thành 4
              //Repeater1.DataSource = SqlDataSource1;
              //Repeater1.DataBind();
              //lblRPT.Text = Repeater1.Items.Count.ToString();
                
                if (Request.QueryString["CategoryID"] != null && Request.QueryString["CategoryName"] != null)
                {
                    string categoryID = Request.QueryString["CategoryID"];
                    string categoryName = Request.QueryString["CategoryName"];
                    lblID.Text = categoryID;
                    lblName.Text = categoryName;
                    CategoryID=int.Parse(categoryID);
                }
                    BindData();
            }
        }

        protected void btnPrevious_Click(object sender, EventArgs e)
        {
            int currentPage = GetCurrentPage();
            if (currentPage > 1)
            {
                SetCurrentPage(currentPage - 1);
                BindData();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            int currentPage = GetCurrentPage();
            int totalPages = GetTotalPages();
            if (currentPage < totalPages)
            {
                SetCurrentPage(currentPage + 1);
                BindData();
            }
        }
        private int GetRowCount()
        {
            int countItem = 0;
            SqlConnection conn = new SqlConnection("Data Source=LAPTOP-04ME5USI;Initial Catalog=QL_Book;Integrated Security=True");
            conn.Open();
            int CateID = int.Parse(lblID.Text);
            string sqlString = $"SELECT COUNT(*) FROM Book where CategoryID={CateID}";
            SqlCommand cmd = new SqlCommand(sqlString, conn);
            countItem = (int)cmd.ExecuteScalar();
            conn.Close();
            return countItem;
        }

        private void BindData()
        {
            int currentPage = GetCurrentPage();
            int pageSize = 8; // Số lượng item trên mỗi trang
            int startIndex = (currentPage - 1) * pageSize;
            int endIndex = startIndex + pageSize - 1;
            int CateID = int.Parse(lblID.Text);

            // Lấy dữ liệu từ SqlDataSource và áp dụng phân trang
            //SqlDataSource2.SelectCommand = $@"SELECT * FROM
            //(SELECT ROW_NUMBER() OVER (ORDER BY Title) AS RowNum, *
            //FROM Book
            //WHERE CategoryID = {CateID}) AS BookWithRowNum
            //WHERE RowNum BETWEEN {startIndex + 1} AND {endIndex + 1}";

            SqlDataSource2.SelectCommand = $@"SELECT * FROM
            (SELECT ROW_NUMBER() OVER (ORDER BY Book.Title) AS RowNum, Book.BookID, Book.Title, Book.Images, Book.Price, Author.AuthorName
            FROM Book
            INNER JOIN Author ON Book.AuthorID = Author.AuthorID
            WHERE Book.CategoryID = {CateID}) AS BookWithRowNum
            WHERE RowNum BETWEEN {startIndex + 1} AND {endIndex + 1}";
            Repeater1.DataSource = SqlDataSource2;
            Repeater1.DataBind();

            // Ẩn hiển thị nút "Previous" nếu đang ở trang đầu tiên
            btnPrevious.Enabled = (currentPage > 1);

            // Ẩn hiển thị nút "Next" nếu đang ở trang cuối cùng
            btnNext.Enabled = (currentPage < GetTotalPages());
        }

        private int GetCurrentPage()
        {
            if (ViewState["CurrentPage"] == null)
            {
                ViewState["CurrentPage"] = 1;
            }

            return (int)ViewState["CurrentPage"];
        }

        private void SetCurrentPage(int page)
        {
            ViewState["CurrentPage"] = page;
        }

        private int GetTotalPages()
        {
            // Đếm số trang dựa trên tổng số item và số lượng item trên mỗi trang
            int totalItems = GetRowCount();
            int pageSize = 8; // Số lượng item trên mỗi trang
            int totalPages = (int)Math.Ceiling((double)totalItems / pageSize);
            return totalPages;
        }

        protected void Unnamed1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}