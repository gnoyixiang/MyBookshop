using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyBookshop.Models;

namespace MyBookshop
{
    public partial class Catalog : System.Web.UI.Page
    {
        BusinessModel bm = new BusinessModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            ListView1.DataSource = bm.getAll();
            ListView1.DataBind();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            int bookId = Convert.ToInt32(e.CommandArgument);
            /*
             * Session["bookDetailId"] = bookId;
            Response.Redirect("/BookDetails.aspx");
            */
            Response.Redirect("/BookDetails.aspx?bookId=" + bookId);
        }

        protected void ProductsDataPager_PreRender(object sender, EventArgs e)
        {
            ListView1.DataSource = bm.getAll();
            ListView1.DataBind();
        }
    }
}