using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyBookshop.Models;

namespace MyBookshop
{
    public partial class Login : System.Web.UI.Page
    {
        

        UserContext uc;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            uc = new UserContext();
            if (!IsPostBack)
            {
                lblValidPassword.Text = lblValidUsername.Text = lblInvalidLogin.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (txtUsername.Text == "")
            {
                lblValidUsername.Text = "Username cannot be empty";
                return;
            }
            else lblValidUsername.Text = "";

            string username = txtUsername.Text;
            
            if (txtPassword.Text == "")
            {
                lblValidPassword.Text = "Password cannot be empty";
                return;
            }
            else lblValidPassword.Text = "";

            string password = txtPassword.Text;

            User user = uc.GetUser(username, password);

            if (user == null)
            {
                lblInvalidLogin.Text = "Invalid username or password";
                return;
            }
            else lblInvalidLogin.Text = "";

            Session["Username"] = user.UserName;
            Session["Role"] = user.Role;
            Response.Redirect("/Catalog.aspx");
        }
    }
}