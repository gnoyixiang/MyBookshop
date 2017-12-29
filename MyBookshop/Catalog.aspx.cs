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
        BusinessModel bm;
        List<Book> catalog;

        private static string[] searchList = { "Title", "Category", "Author" };

        protected void Page_Load(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin Page_Load\n----\n");

            bm = new BusinessModel();
            
            if (!IsPostBack)
            {
                //Response.Cache.SetNoStore();

                catalog = bm.getAll();
                ViewState["catalog"] = catalog;

                for (int i=0; i<searchList.Length; i++)
                {
                    radioSearchList.Items.Add(new ListItem(searchList[i], i.ToString()));
                }
                radioSearchList.SelectedIndex = -1;

                List<Category> categories = bm.getAllCategory();                
                foreach (Category c in categories)
                {
                    radioCatList.Items.Add(new ListItem(c.Name, c.CategoryID.ToString()));
                }
                radioCatList.SelectedIndex = -1;                
            }
            else
            {
                catalog = (List<Book>) ViewState["catalog"];
            }
            
            ListDataBind();
        }

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin LinkButton1_Command\n----\n");
            
            int bookId = Convert.ToInt32(e.CommandArgument);
            /*
             * Session["bookDetailId"] = bookId;
            Response.Redirect("/BookDetails.aspx");
            */
            Response.Redirect("/BookDetails.aspx?bookId=" + bookId);

        }
        
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin txtSearch_TextChanged\n----\n");

            doTextSearch();
        }

        protected void radioSearchList_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin radioSearchList_SelectedIndexChanged\n----\n");

            checkSearchState();
            
        }

        protected void radioCatList_SelectedIndexChanged(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin radioCatList_SelectedIndexChanged\n----\n");

            doCatSearch();
        }

        private void checkSearchState()
        {
            string selectedText = radioSearchList.SelectedItem.Text;
            if (selectedText == "Title" || selectedText == "Author")
            {
                radioCatList.Visible = false;
                txtSearch.Visible = true;
                txtSearch.Text = "";
                doTextSearch();
            }
            if (selectedText == "Category")
            {
                radioCatList.Visible = true;
                txtSearch.Visible = false;
                radioCatList.SelectedIndex = -1;
                doCatSearch();
            }
        }

        private void doTextSearch()
        {
            if (txtSearch.Text == "")
            {
                catalog = bm.getAll();
            }
            else
            {
                string search = txtSearch.Text;
                string selectedText = radioSearchList.SelectedItem.Text;

                catalog = bm.searchBook(search, selectedText);
                
            }
            ViewState["catalog"] = catalog;
            ListDataBind();
        }

        private void doCatSearch()
        {

            if (radioCatList.SelectedIndex == -1)
            {
                catalog = bm.getAll();
            }
            else
            {
                catalog = bm.searchBookByCategory(int.Parse(radioCatList.SelectedValue));
            }

            ViewState["catalog"] = catalog;
            ListDataBind();
        }

        protected void ProductsDataPager_PreRender1(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin ProductsDataPager_PreRender1\n----\n");

            ListDataBind();
        }

        private void ListDataBind()
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin ListDataBind\n----\n");

            ListView1.DataSource = catalog;
            ListView1.DataBind();
        }

        protected void ListView1_PreRender(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin ListView1_PreRender\n----\n");
        }

        protected void ProductsDataPager_PreRender(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin ProductsDataPager_PreRender\n----\n");
        }

        protected void LinkButton1_PreRender(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin LinkButton1_PreRender\n----\n");
        }

        protected override void OnLoadComplete(EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin OnLoadComplete\n----\n");
            base.OnLoadComplete(e);
        }

        protected override void OnSaveStateComplete(EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin OnSaveStateComplete\n----\n");
            base.OnSaveStateComplete(e);
        }

        protected override void OnInitComplete(EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin OnInitComplete\n----\n");
            base.OnInitComplete(e);
        }

        protected override void OnLoad(EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin OnLoad\n----\n");
            base.OnLoad(e);
        }

        protected override void LoadControlState(object savedState)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin LoadControlState\n----\n");
            base.LoadControlState(savedState);
        }

        protected override void LoadViewState(object savedState)
        {
            System.Diagnostics.Debug.WriteLine("\n----\nin LoadViewState\n----\n");
            base.LoadViewState(savedState);
        }

        
    }
}