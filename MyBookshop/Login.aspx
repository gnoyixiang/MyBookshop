<%@ Page Title="WYX Bookshop" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MyBookshop.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    
    <input type="text" id="txtbox" runat="server">
    
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
            <td colspan="2"><asp:Label ID="lblInvalidLogin" runat="server" ForeColor="Red" /></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" /></td>
        </tr>
    </table>
</div>
</asp:Content>
