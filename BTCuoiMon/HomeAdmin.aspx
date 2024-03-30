<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="HomeAdmin.aspx.cs" Inherits="BTCuoiMon.HomeAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            color: #FF0066;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-manager">
        <h1 class="text-white fw-bold text-center mb-4">Quản lí thể loại</h1>
                        <table style="width:100%; margin-bottom: 30px">
            <tr>
                <td class="border border-secondary-subtle text-white p-2 fw-bold">Tên thể loại</td>
                <td class="border border-secondary-subtle td-table-top">
                    <asp:TextBox ID="txtCategoryName" CssClass="form-control" placeholder="Tên thể loại" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="border border-secondary-subtle">&nbsp;</td>
                <td class="border border-secondary-subtle td-table-top">
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-outline-light me-2" OnClick="btnSave_Click" Text="Save" />
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-outline-light me-2" OnClick="btnCancel_Click" Text="Cancel" />
                    <asp:Label ID="lblResult" runat="server" CssClass="auto-style2" Text=""></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <asp:GridView ID="GridView1" CssClass="w-100" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="CategoryID" DataSourceID="SqlDataSource2" AllowPaging="True" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
            <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
            <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
            </asp:CommandField>
            <asp:BoundField DataField="CategoryID" HeaderText="Mã loại" InsertVisible="False" ReadOnly="True" SortExpression="CategoryID" >
            <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
            <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
            </asp:BoundField>
            <asp:BoundField DataField="CategoryName" HeaderText="Tên thể loại" SortExpression="CategoryName" >
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
      
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QL_BookConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Category]" UpdateCommand="Update Category set CategoryName=@CategoryName where CategoryID=@CategoryID" DeleteCommand="Delete from Category where CategoryID=@CategoryID">

            </asp:SqlDataSource>
            </div>

      
</asp:Content>
