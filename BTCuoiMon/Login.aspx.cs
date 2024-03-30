using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTCuoiMon
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

        }

        protected void btnEnter_Click(object sender, EventArgs e)
        {
            if(txtUserName.Text == "aspx" && txtPassWord.Text == "123")
            {
                Response.Redirect("HomeAdmin.aspx");
            }
            else
            {
                lblLog.Text = "Tên đăng nhập hoặc mật khẩu không chính xác";
            }
        }
    }
}