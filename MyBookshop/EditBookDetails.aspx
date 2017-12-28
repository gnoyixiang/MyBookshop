<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditBookDetails.aspx.cs" Inherits="MyBookshop.EditBookDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
       .imagediv{
           float:left;
           width:25%;
       }
       .image{
           width:100%;
       }
       .tablediv{
           float:right;
           width:75%;
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
        </div>
        <div class="tablediv">
            <table class="table" >
                <tr class="tablerow">
                    <td>Title: </td>
                    <td><asp:Label ID="lblTitle" runat="server" /></td>
                </tr>
                <tr><td class="tablecell">Author: </td><td colspan="2"><asp:Label ID="lblAuthor" runat="server" /></td></tr>
                <tr><td class="tablecell">ISBN: </td><td colspan="2"><asp:Label ID="lblIsbn" runat="server" /></td></tr>
                <tr><td class="tablecell">Category: </td><td colspan="2"><asp:Label ID="lblCategory" runat="server" /></td></tr>
                <tr><td class="tablecell">Stock: </td>
                    <td><asp:TextBox ID="txtStock" runat="server" TextMode="Number"></asp:TextBox>
                        <br />
                        <asp:Label ID="lblInvalidStock" runat="server" ForeColor="Red" /></td>
                </tr>
                <tr><td class="tablecell">Price (S$): </td>
                    <td><asp:TextBox ID="txtPrice" runat="server"/>
                        <br />
                        <asp:Label ID="lblInvalidPrice" runat="server" ForeColor="Red" /></td>
                </tr>
                <tr><td class="tablecell">Discount: </td>
                    <td><asp:TextBox ID="txtDiscount" runat="server"/>
                        <br />
                        <asp:Label ID="lblInvalidDiscount" runat="server" ForeColor="Red" /></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Button runat="server" ID="btnUpdate" OnClick="btnUpdate_Click" 
                            OnClientClick="return confirm('Are you sure you wish to update?');" Text="Update"/>
                    </td>
                </tr>                    
            </table>
                   
            <div>
                <a href="Catalog.aspx">Return to Catalog</a>
            </div>
        </div>
    </div>
</asp:Content>
