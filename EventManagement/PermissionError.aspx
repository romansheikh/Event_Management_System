<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PermissionError.aspx.cs" Inherits="EventManagement.PermissionError" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="card">
            <div class="card card-header badge-danger">
                <h1>!Warning</h1>
            </div>
            <div class="card card-body badge-dark">
                <h2 class="display-3">
                    You Have Not Permission To Acces This Page , Please Log in to acces this page..

                    Thank you!!!
                </h2>
            </div>
            <div class="card card-footer badge-danger">
                <asp:HyperLink CssClass="btn btn-primary btn-sm" NavigateUrl="~/Default.aspx" ID="HyperLink1" runat="server">Go To Home</asp:HyperLink>
                <hr /><asp:HyperLink CssClass="btn btn-info btn-sm" NavigateUrl="~/Account/Login.aspx" ID="HyperLink2" runat="server">Go To Login</asp:HyperLink>

            </div>
        </div>
    </div>
</asp:Content>
