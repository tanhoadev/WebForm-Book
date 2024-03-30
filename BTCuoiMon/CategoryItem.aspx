<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd.Master" AutoEventWireup="true" CodeBehind="CategoryItem.aspx.cs" Inherits="BTCuoiMon.CategoryItem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- CategoryItem.aspx --%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="conntent-all">
        <p style="color: aliceblue;">Sách - <asp:Label ID="lblName" runat="server" ForeColor="aliceblue" Text="Label"></asp:Label></p>
            <%--<asp:Label ID="lblName" runat="server" ForeColor="aliceblue" Text="Label"></asp:Label>--%>
            <asp:Label ID="lblID" runat="server" ForeColor="Pink" Text="Label" Font-Size="0px"></asp:Label>
    <asp:Panel runat="server" ID="pagerContainer"></asp:Panel>
    </div>
    <div class="content-p">
        <asp:Repeater runat="server" OnItemCommand="Unnamed1_ItemCommand" ID="Repeater1">
            <ItemTemplate>
                <div class="content-ch">
                    <div class="content-img">
                        <asp:Image ID="Image1" CssClass="content-img-ch" runat="server" ImageUrl='<%#"~/img/" + Eval("Images") %>'/>
                    </div>
                    <div class="content-title">
                        <p class="truncate"><%#Eval("Title")%></p>
                    </div>
                    <div class="content-author">
                        <p><%# Eval("AuthorName") %></p>
                    </div>
                    <div class="content-price-btn">
                        <span class="price"><%#string.Format("{0:#,##0.000}đ", (decimal)Eval("Price")) %></span>
                        <a href='<%#$"BookDetail.aspx?BookID={Eval("BookID")}" %>' class="btn btn-outline-primary">Xem Ngay</a>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div class="page">
        <asp:Button runat="server" CssClass="btn btn-outline-primary page-previous" ID="btnPrevious" Text="< Trước" OnClick="btnPrevious_Click" />
        <asp:Button runat="server" CssClass="btn btn-outline-primary page-next" ID="btnNext" Text="Sau >" OnClick="btnNext_Click" />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QL_BookConnectionString %>" SelectCommand="
            SELECT Book.BookID, Book.Title, Book.Images, Book.Price, Author.AuthorName
            FROM Book
            INNER JOIN Author ON Book.AuthorID = Author.AuthorID
            WHERE Book.CategoryID = @CategoryID;">
            <SelectParameters>
                <asp:QueryStringParameter Name="CategoryID" QueryStringField="CategoryID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
