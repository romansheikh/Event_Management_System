<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventType.aspx.cs" Inherits="EventManagement.EventType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <h2 class="display-4">Events Type Here</h2>

    </div>
    <div class="table">
        <asp:GridView ID="GridView1" CssClass="table table-bordered table-success table-hover" RowStyle-CssClass="d-table-row" runat="server" AutoGenerateColumns="False" DataKeyNames="EventTypeId" DataSourceID="EventManagementDB_SRC" OnRowUpdating="GridView1_RowUpdating">
               <Columns>
                <asp:BoundField DataField="EventTypeId" HeaderText="Event Type ID" InsertVisible="False" ReadOnly="True" SortExpression="EventTypeId" />
                <asp:BoundField DataField="EventType" HeaderText="Event Type" SortExpression="EventType" />
                <asp:TemplateField HeaderText="Event Type Image" SortExpression="EventTypeImage">
                    <EditItemTemplate>
                        <%--                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventTypeImage") %>'></asp:TextBox>--%>
                        <asp:HiddenField ID="HiddenField1"  Value='<%# Bind("EventTypeImage") %>' runat="server" />
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%--                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EventTypeImage") %>'></asp:Label>--%>
                        <%--<asp:Image ImageUrl='<%#"data:image/png;base64,"+Convert.ToBase64String( (byte[])Eval("EventTypeImage")) %>' Height="100" Width="100" runat="server" />--%>
                        <img src='data:img/jpg;base64,<%# Eval("EventTypeImage") != System.DBNull.Value ? Convert.ToBase64String((byte[])Eval("EventTypeImage")) : string.Empty %>' alt= "no image" height="75px" width="100px"/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False" HeaderText="Action">
                    <EditItemTemplate>
                        <asp:Button ID="Button1" runat="server" CausesValidation="True" CssClass="btn btn-outline-success" CommandName="Update" Text="Update" />
                        &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="Button1" CssClass="btn btn-outline-info" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                        &nbsp;<asp:Button ID="Button2" CssClass="btn btn-danger" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

<RowStyle CssClass="d-table-row"></RowStyle>
        </asp:GridView>
        <asp:SqlDataSource ID="EventManagementDB_SRC" runat="server" ConnectionString="<%$ ConnectionStrings:DB_src_EventManageMent %>" DeleteCommand="DELETE FROM [tbl_Event] WHERE [EventTypeId] = @EventTypeId" InsertCommand="INSERT INTO [tbl_Event] ([EventType], [EventTypeImage]) VALUES (@EventType, @EventTypeImage)" SelectCommand="SELECT * FROM [tbl_Event]" UpdateCommand="UPDATE [tbl_Event] SET [EventType] = @EventType, [EventTypeImage] = @EventTypeImage WHERE [EventTypeId] = @EventTypeId">
            <DeleteParameters>
                <asp:Parameter Name="EventTypeId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="EventType" Type="String" />
                <asp:Parameter Name="EventTypeImage" Type="Object" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="EventType" Type="String" />
                <asp:Parameter Name="EventTypeImage" Type="Object" />
                <asp:Parameter Name="EventTypeId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>
    <br />
    <hr />
    <div>
        <h2 class="display-4">Add New  </h2>
        <div class="table">
            <asp:DetailsView  ID="DetailsView1" CssClass="table table-borderless table-info" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="EventTypeId" DataSourceID="SqlDataSource1" DefaultMode="Insert" OnItemInserting="DetailsView1_ItemInserting">
                <Fields>
                    
                    <asp:BoundField DataField="EventTypeId" HeaderText="EventTypeId" InsertVisible="False" ReadOnly="True" SortExpression="EventTypeId" />
                    <asp:TemplateField HeaderText="EventType" SortExpression="EventType">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventType") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventType") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequirexdfgddFieldValidator1" ControlToValidate="TextBox1" runat="server" BackColor="Red" ErrorMessage="Required"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("EventType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="EventTypeImage" SortExpression="EventTypeImage">
                        <EditItemTemplate>
                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="EventTypeImage" Mode="Edit" />
                        </EditItemTemplate>
                        <InsertItemTemplate>
                            <%--                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="EventTypeImage" Mode="Insert" />--%>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="FileUpload1" runat="server" BackColor="Red" ErrorMessage="Required"></asp:RequiredFieldValidator>

                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:DynamicControl ID="DynamicControl1" runat="server" DataField="EventTypeImage" Mode="ReadOnly" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <InsertItemTemplate>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" CausesValidation="True" CommandName="Insert" Text="Insert" />
                            &nbsp;<asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_src_EventManageMent %>" DeleteCommand="DELETE FROM [tbl_Event] WHERE [EventTypeId] = @EventTypeId" InsertCommand="INSERT INTO [tbl_Event] ([EventType], [EventTypeImage]) VALUES (@EventType, @EventTypeImage)" SelectCommand="SELECT * FROM [tbl_Event]" UpdateCommand="UPDATE [tbl_Event] SET [EventType] = @EventType, [EventTypeImage] = @EventTypeImage WHERE [EventTypeId] = @EventTypeId">
                <DeleteParameters>
                    <asp:Parameter Name="EventTypeId" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="EventType" Type="String" />
                    <asp:Parameter Name="EventTypeImage" DbType="Binary" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="EventType" Type="String" />
                    <asp:Parameter Name="EventTypeImage" DbType="Binary" />
                    <asp:Parameter Name="EventTypeId" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </div>



</asp:Content>
