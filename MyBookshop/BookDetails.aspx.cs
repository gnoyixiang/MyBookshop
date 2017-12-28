using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyBookshop.Models;

namespace MyBookshop
{
    public partial class BookDetails : System.Web.UI.Page
    {
        BusinessModel bm;
        Book b;
        int bookId;

        protected void Page_Load(object sender, EventArgs e)
        {
            bm = new BusinessModel();
            if (Session["bookDetailId"] == null)
            {
                Response.Redirect("/404.aspx");
            }

            bookId = (int)Session["bookDetailId"];

            b = bm.getBook(bookId);

            lblTitle.Text = b.Title.ToString();
            lblAuthor.Text = b.Author.ToString();
            lblCategory.Text = bm.getCategory(b.CategoryID);
            lblIsbn.Text = b.ISBN.ToString();
            lblStock.Text = b.Stock.ToString();
            lblPrice.Text = String.Format("{0:c}", b.Price);
            lblDiscount.Text = b.Discount != null ? String.Format("{0:p}", b.Discount) : "No discount :(";
            Image1.ImageUrl = "images/" + b.ISBN + ".jpg";

            if (!IsPostBack)
            {                
                refreshStock();
            }

            lblInvalid.Text = "";
            lblSuccessful.Text = "";

            if (Session["Role"] != null)
            {                
                btnEdit.Visible = Session["Role"].ToString()=="Admin"? true : false;
            }

        }

        private void refreshStock()
        {
            lblStock.Text = b.Stock.ToString();

            List<int> quantity = new List<int>();
            for (int i = 1; i <= b.Stock; i++)
            {
                quantity.Add(i);
            }
            ddlQuantity.DataSource = quantity;
            ddlQuantity.DataBind();
        }

        protected void addToCart_Click(object sender, EventArgs e)
        {
            //check if user is logged in 
            if (Session["Username"] == null)
            {
                Response.Redirect("login.aspx");
            }
            //check if user is customer
            if(Session["Role"].ToString() != "Customer")
            {
                lblInvalid.Text = "You are not allowed to order!";
                return;
            }
            //check stock
            if (b.Stock < 1)
            {
                lblInvalid.Text = "Insufficient stock!";
                return;
            }

            //check if user has pending order
            Order pendingOrder = bm.getPendingOrder(Session["Username"].ToString());
            if (pendingOrder == null)
            {
                pendingOrder = new Order();
                pendingOrder.UserName = Session["Username"].ToString();
                pendingOrder.OrderDate = DateTime.Now;
                pendingOrder.Status = "PENDING";
                bm.addOrder(pendingOrder);
            }

            //check if item already in orderdetails under same orderid
            OrderDetail orderDetail = bm.getOrderDetail(pendingOrder.OrderID, b.BookID);
            int quantity = Convert.ToInt32(ddlQuantity.SelectedValue);
            if (orderDetail == null)
            {
                orderDetail = new OrderDetail();
                orderDetail.OrderID = pendingOrder.OrderID;
                orderDetail.BookID = b.BookID;                
                orderDetail.Quantity = quantity;
                bm.addOrderDetail(orderDetail);
            }
            else
            {
                orderDetail.Quantity += quantity;
                bm.updateOrderDetail(orderDetail);
            }
            
            b.Stock -= quantity;
            bm.updateBook(b);   
             
            lblSuccessful.Text = "Added " + quantity + " books to cart!";
            refreshStock();
        }

        protected void linkPrevious_Command(object sender, CommandEventArgs e)
        {
            int prevBookID = (int)Session["bookDetailId"] - 1;
            while (true)
            {
                if (prevBookID < 1) return;
                b = bm.getBook(prevBookID);                
                if (b != null) break;
                prevBookID--;
            }            
            Session["bookDetailId"] = prevBookID;
            Response.Redirect("/BookDetails.aspx");
        }

        protected void linkNext_Command(object sender, CommandEventArgs e)
        {
            int nextBookID = (int)Session["bookDetailId"] + 1;
            int total = bm.getCount();
            while (true)
            {
                if (nextBookID > total) return;
                b = bm.getBook(nextBookID);
                if (b != null) break;
                nextBookID++;
            }
            Session["bookDetailId"] = nextBookID;
            Response.Redirect("/BookDetails.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("/EditBookDetails.aspx");
        }
    }
}