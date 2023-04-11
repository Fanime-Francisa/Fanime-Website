<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="VolunteerDetails.aspx.cs" Inherits="VolunteerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:SqlDataSource ID="VolDataSource" runat="server" 
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"></asp:SqlDataSource>
<asp:SqlDataSource ID="AssignedTasksDataSource" runat="server" 
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"></asp:SqlDataSource>
<asp:SqlDataSource ID="AvailableTasksDataSource" runat="server" 
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"></asp:SqlDataSource>

    <p><h2>General Information</h2></p>
    <table width="800px" cellspacing="1px" cellpadding="1px">
        <tr>
            <td width="100px">First Name:</td>
            <td width="700px">
                <asp:Label ID="FirstNameLabel" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><asp:Label ID="LastNameLabel" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Badge ID:</td>
            <td><asp:Label ID="BadgeIDLabel" runat="server"></asp:Label></td>
        </tr>
        <tr class="AgeTR" runat="server">
            <td>Age:</td>
                <td><asp:Label ID="AgeLabel" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>Mobile:</td>
            <td><asp:Label ID="MobileLabel" runat="server"></asp:Label></td>
        </tr>
    </table>
    <br />
    <asp:HyperLink ID="UpdateVolunteerLink" runat="server">Update Volunteer Information</asp:HyperLink>
    <br />
    <p><h2>Assigned Tasks</h2></p>
    <asp:GridView ID="AssignedTasksGridView" runat="server" DataKeyNames="TaskID"
        AutoGenerateColumns="False" DataSourceID="AssignedTasksDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None" OnRowCommand="AssignedTasksGridView_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:ButtonField ItemStyle-CssClass="volunteersSelect" CommandName="Unassign" ItemStyle-Width="50px" Text="Unassign" />

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
                SortExpression="Duration" ItemStyle-Width="50px" 
                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
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
    <asp:Label ID="AssignedTasksLabel" runat="server" Text=""></asp:Label>
    <br />
    <p><h2>Recommended Tasks</h2></p>
    <asp:GridView ID="AvailableTasksGridView" runat="server" DataKeyNames="TaskID"
        AutoGenerateColumns="False" DataSourceID="AvailableTasksDataSource" 
        AllowPaging="True" AllowSorting="True" OnRowCommand="AvailableTasksGridView_RowCommand" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None" PageSize="15">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:ButtonField ItemStyle-CssClass="volunteersSelect" CommandName="Assign" 
                ItemStyle-Width="50px" Text="Assign" >
            </asp:ButtonField>

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
                SortExpression="DepartmentName" ItemStyle-Width="100px" 
                HeaderStyle-HorizontalAlign="Left" >
            </asp:BoundField>

            <asp:BoundField DataField="LocationName" HeaderText="Location" 
                SortExpression="LocationName" ItemStyle-Width="150px" 
                HeaderStyle-HorizontalAlign="Left" >
            </asp:BoundField>

            <asp:BoundField DataField="Description" HeaderText="Description" 
                SortExpression="Description" ItemStyle-Width="150px" 
                HeaderStyle-HorizontalAlign="Left" >
            </asp:BoundField>

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

            <asp:BoundField DataField="Priority" HeaderText="Priority"
                SortExpression="Priority" ItemStyle-Width="50px" 
                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:0}" >
            </asp:BoundField>
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
    <asp:Label ID="AvailableTasksLabel" runat="server" Text=""></asp:Label>
    <br />
    <br />
    <asp:Button ID="FindMoreTasksBtn" runat="server" Text="Find More Tasks" 
        CssClass="buttonStyle" onclick="FindMoreTasksBtn_Click" />
</asp:Content>

