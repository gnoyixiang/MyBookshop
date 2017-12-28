<%@ Page Title="WYX Bookshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="MyBookshop.Cart" %>
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
            <asp:Label ID="lblNoPending" runat="server" ForeColor="Red"></asp:Label>
            <table class="table">
                <tr>
                    <td class="head">OrderID: </td>
                    <td>
                        <asp:Label ID="lblOrderID" runat="server" Text="Not available"></asp:Label></td>
                </tr>
                <tr>
                    <td class="head">Username: </td>
                    <td>
                        <asp:Label ID="lblUserName" runat="server" Text="Not available"></asp:Label></td>
                </tr>
                <tr>
                    <td class="head">Order Date: </td>
                    <td>
                        <asp:Label ID="lblOrderDate" runat="server" Text="Not available"></asp:Label></td>
                </tr>
                <tr>
                    <td class="head">Status: </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server" Text="Not available"></asp:Label></td>
                </tr>           
            </table>  
            <asp:ListView ID="listDetails" runat="server">
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
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="number head">Grand Total: </td>
                            <td class="number">                      
                            <asp:Label ID="lblGrandTotal" runat="server"><%= String.Format("{0:c}", getGrandTotal()) %></asp:Label></td>
                        </tr>
                         <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td class="number">                      
                                <asp:Button ID="btnCheckout" runat="server" Text="Checkout" OnClick="btnCheckout_Click" 
                                    OnClientClick="return confirm('Are you sure you wish to checkout items from cart?');" /></td>
                        </tr>                                              
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
                        <td>
                            <asp:LinkButton ID="linkDelete" runat="server" CommandName="delete" CommandArgument='<%# Eval("BookID") %>'
                                OnCommand="linkDelete_Command" OnClientClick="return confirm('Are you sure you wish to delete item from cart?');">
                                Delete</asp:LinkButton>
                        </td>                      
                    </tr>
               </ItemTemplate>
            </asp:ListView>     
                           
        </div>
</div>
</asp:Content>
