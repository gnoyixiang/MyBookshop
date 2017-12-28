<%@ Page Title="WYX Bookshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetails.aspx.cs" Inherits="MyBookshop.BookDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       .imagediv{
           float:left;
           width:30%;
       }
       .image{
           width:100%;
       }
       .tablediv{
           float:right;
           width:70%;
       }
       .table{
           font-size:large;
           text-align:center;
       }
       .tablerow{
       }
       .tablecell{
           padding-top: 10px !important;
           padding-bottom: 10px !important;
       }
       .container{
           width:100%;
       }
       .detailbox{           
           margin-top:30px;
       }
       .previous{
           float:left;
           font-size:large;
       }
       .next{
           float:right;
           font-size:large;
       }
    </style>
    
    <div class="container detailbox">
        <div class="imagediv">
            <asp:Image ID="Image1" runat="server" CssClass="image"/>
            <p></p>
            <asp:Button ID="btnEdit" runat="server" Text="Edit" OnClick="btnEdit_Click" Visible="false" />  
        </div>
        <div class="tablediv">
            <table class="table" >
                <tr class="tablerow">
                    <td>Title: </td>
                    <td><asp:Label ID="lblTitle" runat="server" /></td>
                </tr>
                <tr><td class="tablecell">Author: </td><td><asp:Label ID="lblAuthor" runat="server" /></td></tr>
                <tr><td class="tablecell">ISBN: </td><td><asp:Label ID="lblIsbn" runat="server" /></td></tr>
                <tr><td class="tablecell">Category: </td><td><asp:Label ID="lblCategory" runat="server" /></td></tr>
                <tr><td class="tablecell">Stock: </td><td><asp:Label ID="lblStock" runat="server" /></td></tr>
                <tr><td class="tablecell">Price: </td><td><asp:Label ID="lblPrice" runat="server" /></td></tr>
                <tr><td class="tablecell">Discount: </td><td><asp:Label ID="lblDiscount" runat="server" /></td></tr>
                <tr>
                    <td colspan="2">
                        <asp:DropDownList ID="ddlQuantity" runat="server"></asp:DropDownList>
                        <asp:Button runat="server" ID="addToCart" OnClick="addToCart_Click" Text="Add to cart" 
                            OnClientClick="return confirm('Are you sure you wish to add to cart?');"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblInvalid" runat="server" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblSuccessful" runat="server" ForeColor="Green" />
                    </td>
                </tr>                
            </table>
                   
            <div>
                <div class="previous">
                    <asp:LinkButton id="linkPrevious" runat="server" OnCommand="linkPrevious_Command">
                        <<
                    </asp:LinkButton>
                </div>
                <div class="next">
                    <asp:LinkButton id="linkNext" runat="server" OnCommand="linkNext_Command">
                        >>
                    </asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
