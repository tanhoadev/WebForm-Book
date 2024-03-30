<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BTCuoiMon.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <%--<form id="form1" runat="server">--%>
<div class="containers">
        <div class="card">
            <a class="login">Log in</a>
            <div class="inputBox">
                <asp:TextBox ID="txtUserName" runat="server" required="required"></asp:TextBox>
                <span class="user">Username</span>
            </div>

            <div class="inputBox">
                <asp:TextBox ID="txtPassWord" type="password" runat="server" required="required"></asp:TextBox>
                <span>Password</span>
            </div>
            <asp:Label ID="lblLog" runat="server" CssClass="px-3 my-n2" ForeColor="Red" Text=""></asp:Label>
            <asp:Button ID="btnEnter" runat="server" CssClass="enter" Text="Enter" OnClick="btnEnter_Click" />

        </div>
    </div>
    <%--</form>--%>
</asp:Content>
