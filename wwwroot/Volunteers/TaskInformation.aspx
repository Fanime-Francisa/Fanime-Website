<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="TaskInformation.aspx.cs" Inherits="TaskInformation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="VolDataSource" runat="server" OnInserted="VolDataSource_Inserted"
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>">
        <InsertParameters>
            <asp:Parameter Direction="Output" Name="Identity" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="TasksDataSource" runat="server"
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"></asp:SqlDataSource>
    <h2>Task Information</h2><br />
    <table width="800px" cellspacing="4px" cellpadding="4px">
        <tr>
            <td width="100px">Description</td>
            <td width="300px"><asp:TextBox ID="DescriptionTxt" runat="server" Width="100%" 
                    MaxLength="50"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="DescriptionValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="DescriptionTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Location</td>
            <td>
                <asp:DropDownList ID="LocationList" runat="server" 
                    DataSourceID="LocationDataSource" DataTextField="Name" 
                    DataValueField="LocationID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="LocationDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>" 
                    SelectCommand="SELECT [LocationID], [Name] FROM [Locations] ORDER BY [Name]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Department</td>
            <td>
                <asp:DropDownList ID="DepartmentList" runat="server" 
                    DataSourceID="DepartmentDataSource" DataTextField="Name" 
                    DataValueField="DepartmentID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DepartmentDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>" 
                    SelectCommand="SELECT [DepartmentID], [Name] FROM [Departments] ORDER BY [Name]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Start Day</td>
            <td>
                <asp:DropDownList ID="StartDayList" runat="server"
                    DataSourceID="DaysDataSource" DataTextField="Name" 
                    DataValueField="DayID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DaysDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>" 
                    SelectCommand="SELECT [DayID], [Name] FROM [Days] ORDER BY [Date]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Start Time</td>
            <td>
                <asp:DropDownList ID="StartTimeHRList" runat="server">
                    <asp:ListItem>1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                    <asp:ListItem>3</asp:ListItem>
                    <asp:ListItem>4</asp:ListItem>
                    <asp:ListItem>5</asp:ListItem>
                    <asp:ListItem>6</asp:ListItem>
                    <asp:ListItem>7</asp:ListItem>
                    <asp:ListItem>8</asp:ListItem>
                    <asp:ListItem>9</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
                :
                <asp:DropDownList ID="StartTimeMinList" runat="server">
                    <asp:ListItem>00</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>20</asp:ListItem>
                    <asp:ListItem>25</asp:ListItem>
                    <asp:ListItem>30</asp:ListItem>
                    <asp:ListItem>35</asp:ListItem>
                    <asp:ListItem>40</asp:ListItem>
                    <asp:ListItem>45</asp:ListItem>
                    <asp:ListItem>50</asp:ListItem>
                    <asp:ListItem>55</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="StartTimeAMPMList" runat="server">
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>Duration (hr)</td>
            <td><asp:TextBox ID="DurationTxt" runat="server" Text="2"></asp:TextBox></td>
            <td><asp:RangeValidator ID="DurationValidator" runat="server" ErrorMessage="Number greater than 0 required" ControlToValidate="DurationTxt" ForeColor="Red" MinimumValue="1" MaximumValue="99" Type="Integer"></asp:RangeValidator></td>
        </tr>
        <tr>
            <td>Required # Volunteers</td>
            <td><asp:TextBox ID="RequiredVolsTxt" runat="server" Text="2"></asp:TextBox></td>
            <td><asp:RangeValidator ID="RequiredVolsValidator" runat="server" ErrorMessage="Number greater than 0 required" ControlToValidate="RequiredVolsTxt" ForeColor="Red" MinimumValue="1" MaximumValue="99" Type="Integer"></asp:RangeValidator></td>
        </tr>
        <tr>
            <td>Optional # Volunteers</td>
            <td><asp:TextBox ID="OptionalVolsTxt" runat="server" Text="0"></asp:TextBox></td>
            <td><asp:RangeValidator ID="OptionalVolsValidator" runat="server" ErrorMessage="Number Required" ControlToValidate="OptionalVolsTxt" ForeColor="Red" MinimumValue="0" MaximumValue="99" Type="Integer"></asp:RangeValidator></td>
        </tr>
        <tr>
            <td>Priority</td>
            <td>
                <asp:DropDownList ID="PriorityList" runat="server">
                    <asp:ListItem Value="1">High</asp:ListItem>
                    <asp:ListItem Selected="True" Value="2">Medium</asp:ListItem>
                    <asp:ListItem Value="3">Low</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Status</td>
            <td>
                <asp:DropDownList ID="StatusList" runat="server">
                    <asp:ListItem Selected="True" Value="1">Active</asp:ListItem>
                    <asp:ListItem Value="0">Inactive</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
    </table>
    <br />
    <asp:Button ID="UpdateTaskInfoBtn" runat="server" 
    Text="Update Task" CssClass="buttonStyle" 
    onclick="UpdateTaskInfoBtn_Click" />
    &nbsp;
    <asp:Button ID="AddNewBtn" runat="server" 
    Text="Add New Task+" CssClass="buttonStyle" 
    onclick="UpdateTaskInfoBtn_Click" />
    <br /><br />
    <asp:Label ID="TaskInformationLabel" runat="server" Text="" ForeColor="Red"></asp:Label>

    <p><h2><asp:Label ID="AssignedVolunteersLabel" runat="server" Text=""></asp:Label></h2></p>
    <asp:GridView ID="TasksGridView" runat="server" DataKeyNames="VolunteerID"
        AutoGenerateColumns="False" DataSourceID="TasksDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None" OnRowCommand="TasksGridView_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:ButtonField ItemStyle-CssClass="volunteersSelect" CommandName="Details" ItemStyle-Width="50px" Text="Details" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                SortExpression="FirstName" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                SortExpression="LocationName" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" />
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
</asp:Content>

