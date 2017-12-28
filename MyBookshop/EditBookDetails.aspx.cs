using MyBookshop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyBookshop
{
    public partial class EditBookDetails : System.Web.UI.Page
    {
        BusinessModel bm;
        Book b;
        int bookId;
        protected void Page_Load(object sender, EventArgs e)
        {
            bm = new BusinessModel();
            
            if (Session["bookDetailId"] == null || Session["Role"] == null)
            {
                Response.Redirect("/404.aspx");
            }

            if (Session["Role"].ToString() != "Admin")
            {
                Response.Redirect("/404.aspx");
            }

            bookId = (int)Session["bookDetailId"];

            b = bm.getBook(bookId);

            lblTitle.Text = b.Title.ToString();
            lblAuthor.Text = b.Author.ToString();
            lblCategory.Text = bm.getCategory(b.CategoryID);
            lblIsbn.Text = b.ISBN.ToString();
            if (!IsPostBack)
            {
                txtStock.Attributes.Add("placeholder", b.Stock.ToString());
                txtPrice.Attributes.Add("placeholder", String.Format("{0:0.00}", b.Price));
                txtDiscount.Attributes.Add("placeholder", b.Discount.ToString());
            }
            Image1.ImageUrl = "images/" + b.ISBN + ".jpg";
            
            lblInvalidDiscount.Text = "";
            lblInvalidPrice.Text = "";
            lblInvalidStock.Text = "";
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            int stock = 0;
            decimal price = 0;
            decimal? discount = null;
            decimal dc = 0;

            if(!int.TryParse(txtStock.Text.Trim(), out stock))
            {
                lblInvalidStock.Text = "Stock input must be whole number";
                return;
            }
            if (!decimal.TryParse(txtPrice.Text.Trim(), out price))
            {
                lblInvalidPrice.Text = "Price input must be decimal";
                return;
            }

            if (!decimal.TryParse(txtDiscount.Text.Trim(), out dc))
            {
                lblInvalidDiscount.Text = "Discount input must be whole number";
                return;
            }

            if(stock < 0)
            {
                lblInvalidStock.Text = "Stock input must be >= 0";
                return;
            }
            if (price < 0)
            {
                lblInvalidPrice.Text = "Price input must be >= 0";
                return;
            }
                        
            if (dc > 0)
            {
                discount = dc;
            }
            if (discount > 1)
            {
                lblInvalidDiscount.Text = "Discount must be between 0 and 1";
                return;
            }

            b.Stock = stock;
            b.Price = Math.Round(price,2);
            b.Discount = discount;

            bm.updateBook(b);
            Response.Redirect("/BookDetails.aspx");
        }
    }
}