<%@ Page Title="WYX Bookshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="MyBookshop.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                <asp:RadioButton ID="rbtAdmin" runat="server" Text="Admin" GroupName="role" />
                <asp:RadioButton ID="rbtCust" runat="server"  Text="Customer" GroupName="role"/>
            </td>
        </tr>
        <tr>
            <td colspan="3"><asp:Button runat="server" ID="btnRegister" Text="Register" OnClick="btnRegister_Click" /></td>
        </tr>
    </table>
   

</asp:Content>
