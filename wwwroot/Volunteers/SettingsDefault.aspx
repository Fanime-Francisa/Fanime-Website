﻿<%@ Page Title="" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="SettingsDefault.aspx.cs" Inherits="SettingsDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<p><h2>Days</h2></p>
<asp:SqlDataSource ID="DaysDataSource" runat="server"    
    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"
    UpdateCommand="UPDATE Days SET Name = @Name, Date = @Date WHERE DayID = @DayID"
    DeleteCommand="DELETE FROM Days WHERE DayID = @DayID">
</asp:SqlDataSource>
<asp:SqlDataSource ID="DepartmentsDataSource" runat="server"    
    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"
    UpdateCommand="UPDATE Departments SET Name = @Name, Head = @Head WHERE DepartmentID = @DepartmentID"
    DeleteCommand="DELETE FROM Departments WHERE DepartmentID = @DepartmentID">
</asp:SqlDataSource>
<asp:SqlDataSource ID="LocationsDataSource" runat="server"    
    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"
    UpdateCommand="UPDATE Locations SET Name = @Name, Description = @Description WHERE LocationID = @LocationID"
    DeleteCommand="DELETE FROM Locations WHERE LocationID = @LocationID">
</asp:SqlDataSource>
<asp:SqlDataSource ID="SettingsDataSource" runat="server"    
    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"
    UpdateCommand="UPDATE Settings SET Name = @Name, Value = @Value WHERE SettingID = @SettingID"
    DeleteCommand="DELETE FROM Settings WHERE SettingID = @SettingID">
</asp:SqlDataSource>
<asp:SqlDataSource ID="ClearDatabaseDataSource" runat="server"    
    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>">
</asp:SqlDataSource>
    
    <asp:GridView ID="DaysGridView" runat="server" DataKeyNames="DayID"
        AutoGenerateColumns="False" AutoGenerateEditButton="true" DataSourceID="DaysDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None" 
        PageSize="20">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name"
                SortExpression="Name" ItemStyle-Width="100px" 
                HeaderStyle-HorizontalAlign="Left" >
            </asp:BoundField>

            <asp:BoundField DataField="Date" HeaderText="Date"
                SortExpression="Date" ItemStyle-Width="100px"
                HeaderStyle-HorizontalAlign="Left" DataFormatString="{0:d}" >
            </asp:BoundField>

            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate> 
                    <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
                        OnClientClick="return confirm('Are you sure you want to delete this day?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <asp:Label ID="NameLabel" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="NameTxt" runat="server" Text=""></asp:TextBox>
    <asp:Label ID="DateLabel" runat="server" Text="Date"></asp:Label>
    <asp:TextBox ID="DateTxt" runat="server" Text=""></asp:TextBox>
    <asp:Button ID="AddNewDayBtn" runat="server" Text="Add New Day" 
            CssClass="buttonStyle" onclick="AddNewDaysBtn_Click" />

    <asp:RegularExpressionValidator
                    ID="DateTxtValidator" runat="server" ForeColor="Red" 
                    ErrorMessage="Invalid Date mm/dd/yyyy" 
                    ValidationExpression="^\d{2}/\d{2}/\d{4}" ControlToValidate="DateTxt"></asp:RegularExpressionValidator>

    <asp:Label ID="DaysLabel" runat="server" Text=""></asp:Label>
    <br />
    <p><h2>Departments</h2></p>
    <asp:GridView ID="DepartmentsGridView" runat="server" DataKeyNames="DepartmentID"
        AutoGenerateColumns="False" AutoGenerateEditButton="true" DataSourceID="DepartmentsDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None" 
        PageSize="20">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name"
                SortExpression="Name" ItemStyle-Width="100px" 
                HeaderStyle-HorizontalAlign="Left" >
            </asp:BoundField>

            <asp:BoundField DataField="Head" HeaderText="Head"
                SortExpression="Head" ItemStyle-Width="200px"
                HeaderStyle-HorizontalAlign="Left" DataFormatString="{0:d}" >
            </asp:BoundField>

            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
                        OnClientClick="return confirm('Are you sure you want to delete this department?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <asp:Label ID="DeptNameLabel" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="DeptNameTxt" runat="server" Text=""></asp:TextBox>
    <asp:Label ID="DeptHeadLabel" runat="server" Text="Head"></asp:Label>
    <asp:TextBox ID="DeptHeadTxt" runat="server" Text=""></asp:TextBox>
    <asp:Button ID="NewDeptButton" runat="server" Text="Add New Department" 
            CssClass="buttonStyle" onclick="AddNewDeptBtn_Click" />

    <asp:Label ID="DepartmentsLabel" runat="server" Text=""></asp:Label>
    <br />
    <p><h2>Locations</h2></p>
    <asp:GridView ID="LocationsGridView" runat="server" DataKeyNames="LocationID"
        AutoGenerateColumns="False" AutoGenerateEditButton="true" DataSourceID="LocationsDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None" 
        PageSize="20">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name"
                SortExpression="Name" ItemStyle-Width="100px" 
                HeaderStyle-HorizontalAlign="Left" >
            </asp:BoundField>

            <asp:BoundField DataField="Description" HeaderText="Description"
                SortExpression="Description" ItemStyle-Width="300px"
                HeaderStyle-HorizontalAlign="Left" DataFormatString="{0:d}" >
            </asp:BoundField>

            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
                        OnClientClick="return confirm('Are you sure you want to delete this location?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <asp:Label ID="LocationNameLabel" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="LocationNameTxt" runat="server" Text=""></asp:TextBox>
    <asp:Label ID="LocationDescriptionLabel" runat="server" Text="Description"></asp:Label>
    <asp:TextBox ID="LocationDescriptionTxt" runat="server" Text=""></asp:TextBox>
    <asp:Button ID="NewLocationButton" runat="server" Text="Add New Location" 
            CssClass="buttonStyle" onclick="AddNewLocationBtn_Click" />

    <asp:Label ID="LocationsLabel" runat="server" Text=""></asp:Label>
    <br />
    <p><h2>Settings</h2></p>
    <asp:GridView ID="SettingsGridView" runat="server" DataKeyNames="SettingID"
        AutoGenerateColumns="False" AutoGenerateEditButton="true" DataSourceID="SettingsDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None" 
        PageSize="20">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Name"
                SortExpression="Name" ItemStyle-Width="100px" 
                HeaderStyle-HorizontalAlign="Left" >
            </asp:BoundField>

            <asp:BoundField DataField="Value" HeaderText="Value"
                SortExpression="Value" ItemStyle-Width="300px"
                HeaderStyle-HorizontalAlign="Left" DataFormatString="{0:d}" >
            </asp:BoundField>

            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
                        OnClientClick="return confirm('Are you sure you want to delete this setting?');" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>

    <asp:Label ID="SettingsNameLabel" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="SettingsNameTxt" runat="server" Text=""></asp:TextBox>
    <asp:Label ID="SettingsValueLabel" runat="server" Text="Value"></asp:Label>
    <asp:TextBox ID="SettingsValueTxt" runat="server" Text=""></asp:TextBox>
    <asp:Button ID="SettingsBtn" runat="server" Text="Add New Setting" 
            CssClass="buttonStyle" onclick="AddNewSettingBtn_Click" />

    <asp:Label ID="SettingsLabel" runat="server" Text=""></asp:Label>
    
    <br />
    <p><h2>Export Reimbursements</h2></p>
    <br />
    <asp:Button ID="ExportDatabaseBtn" runat="server" Text="Export Reimbursements" 
            CssClass="buttonStyle" onclick="ExportDatabaseBtn_Click" />

    <br />
    <p><h2>Database Purge</h2></p>
    All volunteers, tasks and related information will be purged from the database.
    <br />This can be used to remove the prior year(s) data from the system in preparation for a new year.
    <br />This action is permanent so make a backup before starting the process.
    <br />
    <asp:Button ID="ClearDatabaseBtn" runat="server" Text="Clear Database" 
            CssClass="buttonStyle" onclick="ClearDatabaseBtn_Click" OnClientClick="return confirm('Are you sure you want to clear the database? This cannot be undone!');" />

</asp:Content>

