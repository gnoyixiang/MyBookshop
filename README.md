# MyBookshop

1. Generate database from sql script located in sql > bookshop_script.sql
2. Build and run solution.
3. Main page to access is ~/Catalog
4. Login accounts:
   <br>Admin - **yxong**
   <br>Customers - **cc, haha, me**
   <br>Passwords (same for all) - **password**  
  
_Note: Admin users will not be able to add items to cart or view cart. When view cart page is clicked, will redirect admin to 404 page._

## Some problems unresolved
1. List&lt;Book&gt; catalog is saved in viewstate so that the correct linkbutton event is fired after Page_Load on postback when photo is clicked. However, problem resurfaces when the user press the browser back button.
2. Did not configure login and register with ASP.NET security.
3. 
