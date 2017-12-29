<%@ Page Title="WYX Bookshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="MyBookshop.Catalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server" >

    <style>
        .rbtList label{
            padding:10px 30px 10px 5px;
        }
        .searchDiv{
            width:40%; 
            margin-left:30%;
            margin-right:30%;
            align-self:center;           
        }
    </style>

    <h1>Books Catalog</h1>

    <div class="container">
        <div class="searchDiv">
            
            Search by:
            <asp:RadioButtonList runat="server" ID="radioSearchList" RepeatDirection="Horizontal" CssClass="rbtList" 
                RepeatLayout="Flow" AutoPostBack="true" OnSelectedIndexChanged="radioSearchList_SelectedIndexChanged">
            </asp:RadioButtonList> 
            <div>
            <asp:TextBox ID="txtSearch" runat="server" Visible="false" AutoPostBack="true" OnTextChanged="txtSearch_TextChanged">
            
            </asp:TextBox>
            </div>
            <div>
            <asp:RadioButtonList runat="server" ID="radioCatList" Visible="false" RepeatDirection="Horizontal"
                 CssClass="rbtList" RepeatLayout="Flow" AutoPostBack="true" 
                OnSelectedIndexChanged="radioCatList_SelectedIndexChanged">
            </asp:RadioButtonList>
            </div>
            
        </div>
    

        <br />

        
            
        <asp:ListView ID="ListView1" runat="server" GroupItemCount="4" OnPreRender="ListView1_PreRender">
            <LayoutTemplate>
                <table style="width:100%;" >
                    <tr id="groupPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>  
            <GroupTemplate>
                <tr runat="server">
                    <td runat="server" id="itemPlaceholder"></td>
                </tr>
            </GroupTemplate>     
            <ItemTemplate>
                <td style="padding:20px; text-align:center;">                
                    <p style="padding:2px">
                        <asp:LinkButton id="LinkButton1" runat="server" CommandArgument='<%#Eval("BookID")%>' OnCommand="LinkButton1_Command"
                             OnPreRender="LinkButton1_PreRender">
                            <img src="images/<%# Eval("ISBN") %>.jpg" />
                        </asp:LinkButton>
                    </p>
                    <p style="padding:2px"><%# Eval("BookID") %></p>
                    <p style="padding:2px"><%# Eval("Title") %></p>
                    <p style="padding:2px"><%# Eval("Author") %></p>
                    <p style="padding:2px"><%# Eval("ISBN") %></p>
                </td>
            </ItemTemplate>
        </asp:ListView>    

        <asp:DataPager runat="server" ID="ProductsDataPager"  OnPreRender="ProductsDataPager_PreRender1"
            PagedControlID="ListView1" PageSize="8">
            <Fields>
              <asp:NextPreviousPagerField ButtonType="Link"
                ShowFirstPageButton="false"
                ShowNextPageButton="false" 
                ShowPreviousPageButton="true" />
              <asp:NumericPagerField ButtonCount="10" />
              <asp:NextPreviousPagerField ButtonType="Link"
                ShowLastPageButton="false"
                ShowNextPageButton="true" 
                ShowPreviousPageButton="false" />
            </Fields>
        </asp:DataPager>
        
    </div>

</asp:Content>
