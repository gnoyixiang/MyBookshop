using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace MyBookshop.Models
{
    public class UserContext
    {
        public void AddUser(User user)
        {
            using(BookshopEntities bs = new BookshopEntities())
            {
                bs.Users.Add(user);
                bs.SaveChanges();
            }
        }

        public List<User> getAllUsers()
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                return bs.Users.ToList();
            }
        }

        public User GetUser(string userName)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                var user = bs.Users.SingleOrDefault(u => u.UserName == userName);
                return user;
            }
        }

        public User GetUser(string userName, string password)
        {
            using (BookshopEntities bs = new BookshopEntities())
            {
                var user = bs.Users.SingleOrDefault(u => u.UserName == userName && u.Password == password);
                return user;
            }
        }

    }
}