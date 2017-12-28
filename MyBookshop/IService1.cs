using MyBookshop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace MyBookshop
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService1" in both code and config file together.
    [ServiceContract]
    public interface IService1
    {
        [OperationContract]
        [WebGet(UriTemplate = "/Book/{id}", ResponseFormat = WebMessageFormat.Json)]
        WCFBook GetBook(string id);

        [OperationContract]
        [WebGet(UriTemplate = "/Books", ResponseFormat = WebMessageFormat.Json)]
        List<Book> List();

        [OperationContract]
        [WebInvoke(UriTemplate = "/Update", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        void Update(Book book);
    }

    [DataContract]
    public class WCFBook
    {
        int bookID;
        string title;
        int categoryID;
        string isbn;
        string author;
        int stock;
        decimal price;
        decimal? discount;

        string categoryName;

        public static WCFBook create(
        int bookID,
        string title,
        int categoryID,
        string isbn,
        string author,
        int stock,
        decimal price,
        decimal? discount)
        {
            WCFBook b = new WCFBook();
            b.bookID = bookID;
            b.title = title;
            b.categoryID = categoryID;
            b.isbn = isbn;
            b.author = author;
            b.stock = stock;
            b.price = price;
            b.discount = discount;

            b.categoryName = new BusinessModel().getCategory(categoryID);
            return b;
        }

        [DataMember]
        public int BookID
        {
            get { return bookID; }
            set { bookID = value; }
        }

        [DataMember]
        public string Title
        {
            get { return title; }
            set { title = value; }
        }

        [DataMember]
        public int CategoryID
        {
            get { return categoryID; }
            set { categoryID = value; }
        }

        [DataMember]
        public string ISBN
        {
            get { return isbn; }
            set { isbn = value; }
        }

        [DataMember]
        public string Author
        {
            get { return author; }
            set { author = value; }
        }

        [DataMember]
        public int Stock
        {
            get { return stock; }
            set { stock = value; }
        }

        [DataMember]
        public decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        [DataMember]
        public decimal? Discount
        {
            get { return discount; }
            set { discount = value; }
        }

        [DataMember]
        public string CategoryName
        {
            get { return categoryName; }
            set { categoryName = value; }
        }
    }
}
