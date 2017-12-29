using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MyBookshop.Models
{
    public class BusinessModel
    {
        public List<string> ListBooks()
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Books.Select<Book, String>(b => b.BookID.ToString()).ToList<String>();
            }
        }
        
        public List<Book> getAll()
        {
            using(BookshopEntities bs = new BookshopEntities())
            {
                return bs.Books.ToList();
            }
        }

        public List<Book> searchBook(string searchText, string type)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                if (type == "Title")
                {
                    return bs.Books.Where(b=>b.Title.ToUpper().Contains(searchText.Trim().ToUpper())).ToList();
                }
                if (type == "Author")
                {
                    return bs.Books.Where(b => b.Author.ToUpper().Contains(searchText.Trim().ToUpper())).ToList();
                }
                return bs.Books.ToList();
            }
        }

        public List<Book> searchBookByCategory(int categoryID)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
               return bs.Books.Where(b=>b.CategoryID==categoryID).ToList();
            }
        }

        public int getCount()
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Books.Count();
            }
        }

        public Book getBook(int bookID)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Books.SingleOrDefault(b => b.BookID == bookID);
            }
        }

        public Book getBook(string isbn)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Books.SingleOrDefault(b => b.ISBN == isbn);
            }
        }

        public string getCategory(int catID)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Categories.Where(c => c.CategoryID == catID).First().Name.ToString();
            }
        }

        public List<Category> getAllCategory()
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Categories.ToList();
            }
        }

        public void updateBook(Book book)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                bs.Entry(book).State = EntityState.Modified;
                bs.SaveChanges();
            }
        }

        public Order getOrder(int orderID)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Orders.SingleOrDefault(o => o.OrderID == orderID);
            }
        }

        public List<Order> getOrders(string username)
        {
            using(BookshopEntities bs = new BookshopEntities())
            {
                return bs.Orders.Where(o => o.UserName == username).OrderByDescending(o=>o.OrderID).ToList();
            }
        }

        public List<Order> getAllOrders()
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Orders.OrderByDescending(o => o.OrderID).ToList();
            }
        }

        public void updateOrder(Order order)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                bs.Entry(order).State = EntityState.Modified;
                bs.SaveChanges();
            }
        }

        public Order getPendingOrder(string username)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Orders.SingleOrDefault(o => o.UserName == username && o.Status == "PENDING");
            }
        }

        public List<Order> getCompletedOrders(string username)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Orders.Where(o => o.UserName == username && o.Status == "PENDING").ToList();
            }
        }

        public List<OrderDetail> getOrderDetails(int orderID)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.OrderDetails.Where(o => o.OrderID == orderID).ToList();
            }
        }

        public OrderDetail getOrderDetail(int orderID, int bookId)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.OrderDetails.SingleOrDefault(o => o.OrderID == orderID && o.BookID == bookId);
            }
        }

        public void addOrder(Order order)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                bs.Orders.Add(order);
                bs.SaveChanges();
            }
        }

        public void deleteOrder(Order order)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                bs.Entry(order).State = EntityState.Deleted;
                bs.SaveChanges();
            }
        }

        public void addOrderDetail(OrderDetail orderDetail)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                bs.OrderDetails.Add(orderDetail);
                bs.SaveChanges();
            }
        }

        public void deleteOrderDetail(OrderDetail orderDetail)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                int orderId = orderDetail.OrderID;

                bs.Entry(orderDetail).State = EntityState.Deleted;
                bs.SaveChanges();

                List<OrderDetail> orderDetails = getOrderDetails(orderId);
                if (orderDetails.Count < 1)
                {
                    deleteOrder(getOrder(orderId));
                }
            }
        }

        public void updateOrderDetail(OrderDetail orderDetail)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                bs.Entry(orderDetail).State = EntityState.Modified;
                bs.SaveChanges();   
            }
        }


    }
}