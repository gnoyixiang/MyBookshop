<%@ Page Title="WYX Bookshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalog.aspx.cs" Inherits="MyBookshop.Catalog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h1>Books Catalog</h1>
    <br />
    
    <asp:ListView ID="ListView1" runat="server" GroupItemCount="3">
        <LayoutTemplate>
            <table style="width:100%;" >
                <tr id="groupPlaceholder" runat="server">
                </tr>
            </table>
        </LayoutTemplate>  
        <GroupTemplate>
            <tr runat="server" id="bookList">
                <td runat="server" id="itemPlaceholder"></td>
            </tr>
        </GroupTemplate>     
        <ItemTemplate>
            <td style="padding:20px; text-align:center;">                
                <p style="padding:2px">
                    <asp:LinkButton id="LinkButton1" runat="server" CommandArgument='<%#Eval("BookID")%>' OnCommand="LinkButton1_Command">
                        <img src="images/<%# Eval("ISBN") %>.jpg" />
                    </asp:LinkButton>
                </p>
                <p style="padding:2px"><%# Eval("Title") %></p>
                <p style="padding:2px"><%# Eval("Author") %></p>
                <p style="padding:2px"><%# Eval("ISBN") %></p>
            </td>
        </ItemTemplate>
    </asp:ListView>    


</asp:Content>
