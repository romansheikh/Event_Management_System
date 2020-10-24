<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookEvent.aspx.cs" Inherits="EventManagement.BookEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



    <div class="form-row">
        <asp:Label ID="Label1" runat="server" CssClass="offset-4 col-form-label text-lg-right" Text="ID:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-outline-success" OnClick="btnSearch_Click" Text="Search" />
    </div>
    <hr />
    <h2>Book Event Here</h2>
    <table class="table ">
        <tr>
            <td>Select Customer</td>
            <td colspan="2">
                <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="cname" DataValueField="CostomerId" Width="280px">
                    <asp:ListItem>--select one--</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Select Event Type</td>
            <td colspan="2">
                <asp:DropDownList ID="ddlEventType" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="EventType" DataValueField="EventTypeId" Width="280px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_src_EventManageMent %>" SelectCommand="SELECT [EventTypeId], [EventType] FROM [tbl_Event]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_src_EventManageMent %>" SelectCommand="SELECT [CostomerId], [Name]+'('+Mobile+')' as cname FROM [tbl_Costomer]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Start Time</td>
            <td colspan="2">
                <asp:TextBox ID="txtStartdate" runat="server" CssClass="form-control" Width="343px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtStartdate_CalendarExtender" runat="server" TargetControlID="txtStartdate" />
            </td>
        </tr>
        <tr>
            <td>End Type</td>
            <td colspan="2">
                <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control" Width="343px"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtEndDate_CalendarExtender" runat="server" TargetControlID="txtEndDate" />
            </td>
        </tr>
    </table>
    <asp:Button ID="btnInsert" runat="server" CssClass="offset-5 btn btn-success" OnClick="btnInsert_Click" Text="Insert" />
    <asp:Button ID="btnUpdate" runat="server" CssClass=" btn btn-info" OnClick="btnUpdate_Click" Text="Update" />
    <asp:Button ID="btnDelete" runat="server" CssClass=" btn btn-danger" OnClick="btnDelete_Click" Text="Delete" />
    <br />
    <br />
    <br />
    <hr />
    <h2 class="display-4">All Event </h2>
    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-hover table-active" >
    </asp:GridView>



</asp:Content>
