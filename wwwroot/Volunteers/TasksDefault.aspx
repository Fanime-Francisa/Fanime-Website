<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="TasksDefault.aspx.cs" Inherits="TasksDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:SqlDataSource ID="VolDataSource" runat="server" 
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>" 
     DeleteCommand="DELETE FROM TaskVolunteers WHERE TaskID = @TaskID; DELETE FROM Tasks WHERE TaskID = @TaskID">
</asp:SqlDataSource>
    <p><h2>Search</h2></p>
    <table width="800px" cellspacing="4px" cellpadding="4px">
        <tr>
            <td width="100px">Description</td>
            <td width="300px"><asp:TextBox ID="DescriptionTxt" runat="server" Width="100%" 
                    MaxLength="50"></asp:TextBox></td>
            <td></td>
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
                    SelectCommand="SELECT [LocationID], [Name] FROM [Locations] 
                                   UNION
                                   SELECT -1, 'Any'
                                   ORDER BY [Name]">
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
                    SelectCommand="SELECT [DepartmentID], [Name] FROM [Departments]
                                   UNION
                                   SELECT -1, 'Any'
                                   ORDER BY [Name]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Day</td>
            <td>
                <asp:DropDownList ID="StartDayList" runat="server"
                    DataSourceID="DaysDataSource" DataTextField="Name" 
                    DataValueField="DayID">
                </asp:DropDownList>
                <asp:SqlDataSource ID="DaysDataSource" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>" 
                    SelectCommand="SELECT [DayID], [Name], [Date] FROM [Days] 
                                   UNION
                                   SELECT -1, 'Any', '01-JAN-1900'
                                   ORDER BY [Date]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Time</td>
            <td>
                <asp:DropDownList ID="StartTimeHRList" runat="server">
                    <asp:ListItem Selected="True" Value="-1">Any</asp:ListItem>
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
              
                <asp:DropDownList ID="StartTimeAMPMList" runat="server">
                    <asp:ListItem>AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td></td>
        </tr>
        <tr>
            <td>Duration Hrs</td>
            <td><asp:TextBox ID="DurationTxt" runat="server" MaxLength="2" Width="20px">1</asp:TextBox>
                <asp:DropDownList ID="DurationList" runat="server">
                    <asp:ListItem Selected="True" Value="1">Or More</asp:ListItem>
                    <asp:ListItem Value="0">Exactly</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Volunteers Needed</td>
            <td><asp:TextBox ID="VolsNeededTxt" runat="server" MaxLength="2" Width="20px">1</asp:TextBox>
                <asp:DropDownList ID="VolsNeededList" runat="server">
                    <asp:ListItem Selected="True" Value="1">Or More</asp:ListItem>
                    <asp:ListItem Value="0">Exactly</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Hide Old Tasks</td>
            <td><asp:DropDownList ID="HideOldTasksList" runat="server">
                    <asp:ListItem Selected="True" Value="1">Yes</asp:ListItem>
                    <asp:ListItem Value="0">No</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Priority</td>
            <td>
                <asp:DropDownList ID="PriorityList" runat="server">
                    <asp:ListItem Selected="True" Value="-1">Any</asp:ListItem>
                    <asp:ListItem Value="1">High</asp:ListItem>
                    <asp:ListItem Value="2">Medium</asp:ListItem>
                    <asp:ListItem Value="3">Low</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <td>Status</td>
            <td>
                <asp:DropDownList ID="StatusList" runat="server">
                    <asp:ListItem Selected="True" Value="1">Active</asp:ListItem>
                    <asp:ListItem Value="0">Inactive</asp:ListItem>
                </asp:DropDownList>
            </td>
    </table>
    <br />
    <asp:Button ID="TasksSearchBtn" runat="server" Text="Tasks Search" 
        CssClass="buttonStyle" onclick="TasksSearchBtn_Click" />
    &nbsp;<asp:Button ID="AddNewTaskBtn" runat="server" Text="Add New Task" 
            CssClass="buttonStyle" onclick="AddNewTaskBtn_Click" />
    <p><h2>Tasks</h2></p>
    <asp:GridView ID="TasksGridView" runat="server" DataKeyNames="TaskID"
        AutoGenerateColumns="False" DataSourceID="VolDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None" OnRowCommand="TasksGridView_RowCommand" 
        PageSize="20">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:ButtonField ItemStyle-CssClass="volunteersSelect" CommandName="Assign" ItemStyle-Width="50px" Text="Assign" />
            <asp:ButtonField ItemStyle-CssClass="volunteersSelect" CommandName="Update" ItemStyle-Width="50px" Text="Update" />

            <asp:BoundField DataField="Day" HeaderText="Day"
                SortExpression="Day" ItemStyle-Width="100px" 
                HeaderStyle-HorizontalAlign="Left" >
            </asp:BoundField>

            <asp:BoundField DataField="StartTime" HeaderText="Start Time"
                SortExpression="StartTime" ItemStyle-Width="100px" 
                HeaderStyle-HorizontalAlign="Left" DataFormatString="{0:T}" >
            </asp:BoundField>

            <asp:BoundField DataField="EndTime" HeaderText="End Time"
                SortExpression="EndTime" ItemStyle-Width="100px" 
                HeaderStyle-HorizontalAlign="Left" DataFormatString="{0:T}" >
            </asp:BoundField>
            
            <asp:BoundField DataField="Duration" HeaderText="Duration"
                SortExpression="Duration " ItemStyle-Width="50px" 
                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
            </asp:BoundField>

            <asp:BoundField DataField="DepartmentName" HeaderText="Department"
                SortExpression="DepartmentName" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" />

            <asp:BoundField DataField="LocationName" HeaderText="Location" 
                SortExpression="LocationName" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" />

            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" />

            <asp:BoundField DataField="FilledCount" HeaderText="Filled"
                SortExpression="FilledCount" ItemStyle-Width="50px" 
                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Silver" ItemStyle-CssClass="bold">
            </asp:BoundField>

            <asp:BoundField DataField="RequiredVolunteers" HeaderText="Required"
                SortExpression="RequiredVolunteers" ItemStyle-Width="50px" 
                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-BackColor="Silver" ItemStyle-CssClass="bold">
            </asp:BoundField>

            <asp:BoundField DataField="AvailableCount" HeaderText="Available"
                SortExpression="AvailableCount" ItemStyle-Width="50px" 
                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" >
            </asp:BoundField>

            <asp:TemplateField HeaderText="">
                <ItemTemplate>
                    <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete" Text="Delete"
                        OnClientClick="return confirm('Are you sure you want to delete this task?');" />
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
    <asp:Label ID="TasksLabel" runat="server" Text=""></asp:Label>
</asp:Content>

