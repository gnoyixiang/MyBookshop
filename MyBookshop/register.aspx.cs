using MyBookshop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyBookshop
{
    public partial class register : System.Web.UI.Page
    {
        UserContext uc;

        protected void Page_Load(object sender, EventArgs e)
        {
            uc = new UserContext();
            if (!IsPostBack)
            {
                rbtCust.Checked = true;
                lblValidUsername.Text = "";
                lblValidPassword.Text = "";
            }

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if(txtUsername.Text=="")
            {
                lblValidUsername.Text = "Username cannot be empty";
                return;
            }
            else lblValidUsername.Text = "";

            string username = txtUsername.Text;

            User user = uc.GetUser(username);
            if (user != null)
            {
                lblValidUsername.Text = "Username is taken";
                return;
            }
            else lblValidUsername.Text = "";

            if (txtPassword.Text == "")
            {
                lblValidPassword.Text = "Password cannot be empty";
                return;
            }
            else lblValidPassword.Text = "";

            string password = txtPassword.Text;

            string role = "Customer";
            if (rbtAdmin.Checked)
            {
                role = "Admin";
            }

            user = new User();
            user.UserName = username;
            user.Password = password;
            user.Role = role;

            uc.AddUser(user);

            Response.Redirect("/login.aspx");
        }

    }
}