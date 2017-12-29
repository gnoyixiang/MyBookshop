using MyBookshop.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

namespace MyBookshop
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service1" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select Service1.svc or Service1.svc.cs at the Solution Explorer and start debugging.
    public class Service1 : IService1
    {
        public WCFBook GetBook(string id)
        {
            Book b = new BusinessModel().getBook(int.Parse(id));
            return WCFBook.create(b.BookID, b.Title, b.CategoryID, b.ISBN, b.Author, b.Stock, b.Price, b.Discount);
        }

        public List<Book> List()
        {
            return new BusinessModel().getAll();
        }

        public void Update(Book b)
        {
            BusinessModel bm = new BusinessModel();
            Book book = bm.getBook(b.BookID);
            book.Stock = b.Stock;
            book.Price = b.Price;
            book.Discount = b.Discount;
            bm.updateBook(book);
        }

        public List<User> GetUsers()
        {
            return new UserContext().getAllUsers();
        }
    }
}
