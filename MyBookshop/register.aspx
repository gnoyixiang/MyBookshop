<%@ Page Title="WYX Bookshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="MyBookshop.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        h1{
            margin:30px 10px;
        }
        td{
            padding:10px 10px;
        }
        .rbt{
            padding:0 20px 0 0;
        }
    </style>

    <h1 >Register</h1>
    <table>
        <tr>
            <td><asp:Label ID="lblUsername" runat="server" Text="Username"></asp:Label></td>
            <td><asp:TextBox ID="txtUsername" runat="server"></asp:TextBox></td>
            <td><asp:Label ID="lblValidUsername" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td><asp:Label ID="lblPassword" runat="server" Text="Password"></asp:Label></td>
            <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox></td>
            <td><asp:Label ID="lblValidPassword" runat="server" ForeColor="Red"></asp:Label></td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:RadioButton ID="rbtAdmin" runat="server" Text="Admin" GroupName="role" CssClass="rbt"/>
                <asp:RadioButton ID="rbtCust" runat="server"  Text="Customer" GroupName="role" CssClass="rbt"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"><asp:Button runat="server" ID="btnRegister" Text="Register" OnClick="btnRegister_Click" /></td>
        </tr>
    </table>
   

</asp:Content>
