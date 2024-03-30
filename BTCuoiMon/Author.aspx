<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Author.aspx.cs" Inherits="BTCuoiMon.Author" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            color: #FF0066;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="content-manager">
        <h1 class="text-white fw-bold text-center mb-4">Quản lí tác giả</h1>
                <table class="" style="width:100%; margin-bottom: 30px">
            <tr>
                <td class="border border-secondary-subtle text-white p-2 fw-bold">Tên tác giả</td>
                <td class="border border-secondary-subtle td-table-top">
                    <asp:TextBox ID="txtName" runat="server" placeholder="Tên tác giả" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ForeColor="Red" Font-Size="30px" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="border border-secondary-subtle text-white p-2 fw-bold">Email</td>
                <td class="border border-secondary-subtle input-group td-table-top">
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Email" CssClass="form-control"></asp:TextBox>
                    <span class="input-group-text" id="basic-addon2">@example.com</span>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ForeColor="Red" Font-Size="30px" ErrorMessage="*"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexValidator" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email hợp lệ" ControlToValidate="txtEmail" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="border border-secondary-subtle text-white p-2" style="font-weight:bold;">Địa chỉ</td>
                <td class="border border-secondary-subtle td-table-top">
                    <asp:TextBox ID="txtAddress" runat="server" placeholder="Địa chỉ" CssClass="form-control" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="border border-secondary-subtle p-2">&nbsp;</td>
                <td class="border border-secondary-subtle td-table-top">
                    <asp:Button ID="btnThem" runat="server" CssClass="btn btn-outline-light me-2" Text="Save" OnClick="btnThem_Click" />
                    <asp:Button ID="btnReset" runat="server" CssClass="btn btn-outline-light me-2" Text="Cancel" OnClick="btnReset_Click" />
                    <asp:Label ID="lblResult" runat="server" CssClass="auto-style1" Text=""></asp:Label>
                </td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" CssClass="w-100" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="AuthorID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:CommandField>
                <asp:BoundField DataField="AuthorID" HeaderText="Mã tác giả" InsertVisible="False" ReadOnly="True" SortExpression="AuthorID" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="AuthorName" HeaderText="Tên tác giả" SortExpression="AuthorName" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="AuthorEmail" HeaderText="Email" SortExpression="AuthorEmail" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="AuthorAddress" HeaderText="Địa chỉ" SortExpression="AuthorAddress" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QL_BookConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Author]" UpdateCommand="Update Author set AuthorName=@AuthorName, AuthorEmail=@AuthorEmail, AuthorAddress=@AuthorAddress where AuthorID=@AuthorID" DeleteCommand="Delete from Author where AuthorID=@AuthorID">

        </asp:SqlDataSource>
    </div>


</asp:Content>
