<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="EventManagement.EventDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <asp:GridView  ID="GridView1" CssClass="table table-bordered table-success table-hover" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="BookedEventId" DataSourceID="SqlDataSource1" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="BookedEventId" HeaderText="BookedEventId" InsertVisible="False" ReadOnly="True" SortExpression="BookedEventId" />
                <asp:BoundField DataField="Customer" HeaderText="Customer" SortExpression="Customer" />
                <asp:BoundField DataField="Email Address" HeaderText="Email Address" SortExpression="Email Address" />
                <asp:BoundField DataField="Mobile" HeaderText="Mobile" SortExpression="Mobile" />
                <asp:BoundField DataField="Event" HeaderText="Event" SortExpression="Event" />
                <asp:BoundField DataField="Start Time" HeaderText="Start Time" SortExpression="Start Time" />
                <asp:BoundField DataField="End Time" HeaderText="End Time" SortExpression="End Time" />
                <asp:BoundField DataField="Date &amp; Time" HeaderText="Date &amp; Time" SortExpression="Date &amp; Time" />
            </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_src_EventManageMent %>" SelectCommand="sp_ViewSchedule" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

</asp:Content>
