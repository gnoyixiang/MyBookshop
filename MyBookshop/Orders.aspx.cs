using MyBookshop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MyBookshop
{
    public partial class Orders : System.Web.UI.Page
    {
        BusinessModel bm;
        List<Order> orders;
        List<string> listUsers;

        protected void Page_Load(object sender, EventArgs e)
        {
            bm = new BusinessModel();
            if (!IsPostBack)
            {
                listUsers = new List<string>();
                listUsers.Add("All");
                UserContext uc = new UserContext();
                List<User> users = uc.getAllUsers();
                foreach(User u in users)
                {
                    listUsers.Add(u.UserName);
                }
                ddlUsers.DataSource = listUsers;
                ddlUsers.DataBind();
                ddlUsers.SelectedIndex = 0;
            }            
            if (Session["Username"] == null || Session["Role"] == null)
            {
                Response.Redirect("404.aspx");
            }
            if (Session["Role"].ToString() == "Admin")
            {               
                ddlUsers.Visible = true;
                if (ddlUsers.SelectedValue == "All")
                    orders = bm.getAllOrders();
                else
                    orders = bm.getOrders(ddlUsers.SelectedValue);

                OrderListView.DataSource = orders;
                OrderListView.DataBind();
            }
            else
            {
                orders = bm.getOrders(Session["Username"].ToString());
                OrderListView.DataSource = orders;
                OrderListView.DataBind();
            }
        }

        protected void OrderListView_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            var subList = (ListView)e.Item.FindControl("OrderDetailsListView");

            if ((e.Item.ItemType == ListViewItemType.DataItem))
            {
                var order = (Order)e.Item.DataItem;
                subList.DataSource = bm.getOrderDetails(order.OrderID);
                subList.DataBind();
            }
        }

        protected Book getBook(int bookId)
        {
            return bm.getBook(bookId);//String.Format("{0:c}",bm.getOne(bookId).Price);
        }

        protected decimal getGrandTotal(int orderID)
        {
            decimal grandTotal = 0;
            List<OrderDetail> orderDetails = bm.getOrderDetails(orderID);
            foreach (OrderDetail od in orderDetails)
            {
                decimal unitPrice = getBook(od.BookID).Price;
                grandTotal += unitPrice * od.Quantity;
            }
            return grandTotal;
        }
    }
}