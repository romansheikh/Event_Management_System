<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MyClock.ascx.cs" Inherits="EventManagement.MyClock" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <div style="background-color:gray">
            <center><asp:Label ID="Label1"  runat="server" Text=""></asp:Label></center>
            <asp:Timer Interval="1000" OnTick="Timer1_Tick" ID="Timer1" runat="server"></asp:Timer>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
