<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="BTCuoiMon.Book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            color: #FF0066;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="content-manager">
        <h1 class="text-white fw-bold text-center mb-4">Quản lí sách</h1>
                <table style="width: 100%; margin-bottom: 30px;">
        <tr>
            <td class="border border-secondary-subtle text-white p-2 fw-bold">Tên sách</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:TextBox ID="txtTitle" CssClass="form-control" placeholder="Tên sách" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="*" ForeColor="Red" Font-Size="30px"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="border border-secondary-subtle text-white p-2 fw-bold">Mã tác giả</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:DropDownList ID="ddlAuthorID" CssClass="form-select" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="border border-secondary-subtle text-white p-2 fw-bold">Giá bán</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:TextBox ID="txtPrice" CssClass="form-control" placeholder="Giá bán" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="Red" Font-Size="30px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Vui lòng nhập số thập phân" ControlToValidate="txtPrice" ForeColor="Red" ValidationExpression="^\d+(\.\d+)?$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="border border-secondary-subtle text-white p-2 fw-bold">Hình ảnh</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:TextBox ID="txtImages" CssClass="form-control" placeholder="Hình ảnh" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="border border-secondary-subtle text-white p-2 fw-bold">Mã loại</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:DropDownList ID="ddlCategoryID" CssClass="form-select" runat="server">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="border border-secondary-subtle text-white p-2 fw-bold">Mô tả</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:TextBox ID="txtDes" CssClass="form-control" placeholder="Mô tả" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="border border-secondary-subtle text-white p-2 fw-bold">Ngày đăng</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:TextBox ID="txtPublished" CssClass="form-control" placeholder="Ngày đăng" runat="server"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPublished" ErrorMessage="*" ForeColor="Red" Font-Size="30px"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="compareValidator" ForeColor="Red" runat="server" ErrorMessage="Vui lòng nhập ngày tháng hợp lệ" ControlToValidate="txtPublished" Type="Date" Operator="DataTypeCheck" Display="Dynamic"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="border border-secondary-subtle text-white p-2 fw-bold">Lượt xem</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:TextBox ID="txtViewCount" CssClass="form-control" placeholder="Lượt xem" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtViewCount" ErrorMessage="*" ForeColor="Red" Font-Size="30px"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexValidator" ForeColor="Red" runat="server" ErrorMessage="Vui lòng nhập số nguyên" ControlToValidate="txtViewCount" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="border border-secondary-subtle">&nbsp;</td>
            <td class="border border-secondary-subtle td-table-top">
                <asp:Button ID="brnSave" runat="server" CssClass="btn btn-outline-light me-2" Text="Save" OnClick="brnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-outline-light me-2" Text="Cancel" OnClick="btnCancel_Click" />
                <asp:Label ID="lblResult" runat="server" CssClass="auto-style2" Text=""></asp:Label>
            </td>
        </tr>
    </table>
        <asp:GridView ID="GridView1" CssClass="w-100" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="BookID" DataSourceID="SqlDataSource1" AllowPaging="True" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:CommandField>
                <asp:BoundField DataField="BookID" HeaderText="Mã sách" InsertVisible="False" ReadOnly="True" SortExpression="BookID" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="Title" HeaderText="Tên sách" SortExpression="Title" >
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="AuthorID" HeaderText="Mã tác giả" SortExpression="AuthorID" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="Price" HeaderText="Giá bán" SortExpression="Price" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="Images" HeaderText="Hình ảnh" SortExpression="Images" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="CategoryID" HeaderText="Mã loại" SortExpression="CategoryID" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="Description" HeaderText="Mô tả" SortExpression="Description" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="Published" HeaderText="Ngày đăng" SortExpression="Published" >
                <HeaderStyle BorderStyle="Solid" BorderWidth="2px" />
                <ItemStyle BorderStyle="Solid" BorderWidth="2px" />
                </asp:BoundField>
                <asp:BoundField DataField="ViewCount" HeaderText="Lượt xem" SortExpression="ViewCount" >
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:QL_BookConnectionString %>" SelectCommand="SELECT DISTINCT * FROM [Book]" UpdateCommand="Update Book set Title=@Title, AuthorID=@AuthorID, Price=@Price, Images=@Images, CategoryID=@CategoryID, Description=@Description, Published=@Published, ViewCount=@ViewCount where BookID=@BookID" DeleteCommand="Delete from Book where BookID=@BookID"></asp:SqlDataSource>

            </div>

</asp:Content>
