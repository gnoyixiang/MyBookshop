<%@ Page Title="WYX Bookshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="MyBookshop.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .number{
            text-align:right;
        }
        .head{
            font-weight:bolder;
        }
        .top{
            margin-top:30px;
        }
    </style>
    <div class="top" />
    <div class="container"> 
        <div><asp:DropDownList ID="ddlUsers" runat="server" Visible="false" AutoPostBack="true"></asp:DropDownList>   </div>
                  
     <asp:ListView ID="OrderListView" runat="server" OnItemDataBound="OrderListView_ItemDataBound">
            <LayoutTemplate>
                    <table id="itemPlaceholder" runat="server">
                    </table>
            </LayoutTemplate>
            <ItemTemplate>
                <table class="table">
                    <tr>
                        <td class="head">OrderID: </td>
                        <td><%# Eval("OrderID") %></td>
                    </tr>
                    <tr>
                         <td class="head">UserName: </td>
                        <td><%# Eval("UserName") %></td>
                    </tr>
                    <tr>
                         <td class="head">Order Date: </td>
                        <td><%# Eval("OrderDate") %></td>
                    </tr>
                    <tr>
                         <td class="head">Status: </td>
                        <td><%# Eval("Status") %></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan ="3">
                        <asp:ListView ID="OrderDetailsListView" runat="server">
                            <LayoutTemplate>
                                <table class="table">
                                     <tr>
                                        <td class="head">OrderID</td>
                                        <td class="head">Book Title</td>
                                        <td class="head">Book ISBN</td>                            
                                        <td class="number head">Unit Price</td>
                                        <td class="number head">Quantity</td>                        
                                        <td class="number head">Total Price</td>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server"></tr>                                    
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr>
                                    <td><%# Eval("OrderID") %></td>
                                    <td><%# getBook(int.Parse(Eval("BookID").ToString())).Title %></td>
                                    <td><%# getBook(int.Parse(Eval("BookID").ToString())).ISBN %></td>
                                    <td class="number"><%# String.Format("{0:c}", getBook(int.Parse(Eval("BookID").ToString())).Price) %></td>
                                    <td class="number"><%# Eval("Quantity") %></td>
                                    <td class="number">
                                        <%# String.Format("{0:c}", getBook(int.Parse(Eval("BookID").ToString())).Price 
                                            * int.Parse(Eval("Quantity").ToString())) %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                        </td>
                    </tr>
                    <tr>
                        
                        <td></td>
                        <td></td>
                        <td class="number head">Grand Total: </td>
                        <td class="number">
                            <asp:Label ID="lblGrandTotal" runat="server" 
                                Text='<%# String.Format("{0:c}", getGrandTotal(int.Parse(Eval("OrderID").ToString()))) %>' >                                               
                            </asp:Label>
                        </td>
                    </tr>
              </table>
            </ItemTemplate>
        </asp:ListView>
        </div> 
</asp:Content>
