<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd.Master" AutoEventWireup="true" CodeBehind="BookDetail.aspx.cs" Inherits="BTCuoiMon.BookDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
                               <div class="container-detail">
                    <div class="box">
                        <div class="images">
                            <div class="img-holder active">
                                <asp:Image ID="Image1" CssClass="" runat="server" ImageUrl='<%#"~/img/" + Eval("Images") %>'/>
                            </div>
                        </div>
                        <div class="basic-info">
                            <p class="basic-info-title"><%#Eval("Title") %></p>
                            <p style="color: #1ed760;"><%#Eval("AuthorName") %></p>
                            <p style="color:#b3b3b3; font-weight:bold;">Giá bán: <span class=""><%#string.Format("{0:#,##0.000}đ", (decimal)Eval("Price")) %></span></p>
                            
                        </div>
                        <div class="description">
                            <p><%#Eval("Description")%></p>
                                
                        </div>
                    </div>
                </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:QL_BookConnectionString %>" SelectCommand="            SELECT Book.BookID, Book.Title, Book.Images, Book.Description, Book.Price, Author.AuthorName
            FROM Book
            INNER JOIN Author ON Book.AuthorID = Author.AuthorID
            WHERE Book.BookID = @BookID;">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="BookID" QueryStringField="BookID" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
 
</asp:Content>
