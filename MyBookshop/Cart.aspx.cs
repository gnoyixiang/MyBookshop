using MyBookshop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyBookshop
{
    public partial class Cart : System.Web.UI.Page
    {
        BusinessModel bm;
        Order pendingOrder;
        List<OrderDetail> orderDetails;


        protected void Page_Load(object sender, EventArgs e)
        {
            bm = new BusinessModel();

            if (Session["Username"] == null || Session["Role"] == null)
            {
                Response.Redirect("404.aspx");
            }

            if (Session["Role"].ToString() == "Admin")
            {
                Response.Redirect("404.aspx");

            }
            else
            {
                pendingOrder = bm.getPendingOrder(Session["Username"].ToString());
                if (pendingOrder == null)
                {
                    lblNoPending.Text = "No items added to cart!";
                    return;
                }
                orderDetails = bm.getOrderDetails(pendingOrder.OrderID);
                if (orderDetails.Count < 1)
                {
                    lblNoPending.Text = "No items added to cart!";
                    return;
                }

                lblOrderID.Text = pendingOrder.OrderID.ToString();
                lblUserName.Text = pendingOrder.UserName.ToString();
                lblOrderDate.Text = pendingOrder.OrderDate.ToString();
                lblStatus.Text = pendingOrder.Status.ToString();

                listDetails.DataSource = orderDetails;
                listDetails.DataBind();
            }


        }

        protected Book getBook(int bookId)
        {
            return bm.getBook(bookId);//String.Format("{0:c}",bm.getOne(bookId).Price);
        }

        protected decimal getGrandTotal()
        {
            decimal grandTotal = 0;
            foreach(OrderDetail od in orderDetails)
            {
                decimal unitPrice = getBook(od.BookID).Price;
                grandTotal += unitPrice * od.Quantity;
            }
            return grandTotal;
        }

        protected void linkDelete_Command(object sender, CommandEventArgs e)
        {
            int bookId = int.Parse(e.CommandArgument.ToString());
            OrderDetail orderDetail = bm.getOrderDetail(pendingOrder.OrderID, bookId);
            Book book = bm.getBook(bookId);
            book.Stock += orderDetail.Quantity;
            bm.updateBook(book);
            bm.deleteOrderDetail(orderDetail);
            
            Response.Redirect("/Cart.aspx");
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            pendingOrder.Status = "CHECKOUT";
            bm.updateOrder(pendingOrder);

            Response.Redirect("/Orders.aspx");
        }
    }
}