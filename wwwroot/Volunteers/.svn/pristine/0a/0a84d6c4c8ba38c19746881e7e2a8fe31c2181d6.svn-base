<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
<asp:SqlDataSource ID="ActiveTasksDataSource" runat="server" 
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>" 
     SelectCommand="SELECT * FROM ActiveTasksView ORDER BY StartTime;"></asp:SqlDataSource>
<asp:SqlDataSource ID="AvailableTasksDataSource" runat="server" 
    ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"></asp:SqlDataSource>
<asp:SqlDataSource ID="VolDataSource" runat="server" 
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>"></asp:SqlDataSource>

    <h2>Active Volunteers</h2><br />
    <asp:GridView ID="ActiveTasksGridView" runat="server" DataKeyNames="TaskID"
        AutoGenerateColumns="False" DataSourceID="ActiveTasksDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="DayName" HeaderText="Day"
                SortExpression="DayName" ItemStyle-Width="100px" 
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
            
            <asp:BoundField DataField="VolCount" HeaderText="Volunteers"
                SortExpression="VolCount" ItemStyle-Width="50px" 
                HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="bold">
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

    <h2>Top Priority</h2><br />
    <asp:GridView ID="AvailableTasksGridView" runat="server" DataKeyNames="TaskID"
        AutoGenerateColumns="False" DataSourceID="AvailableTasksDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="TasksGV" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
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
    <h2>Overview</h2><br />
    <table width="800px" cellspacing="4px" cellpadding="4px">
        <tr>
            <td width="100px">Volunteers Total:</td>
            <td width="300px"><asp:Label ID="VolTotalLabel" runat="server" Text="0"></asp:Label></td>
        </tr>
        <tr>
            <td width="100px">Total Tasks Requested:</td>
            <td width="300px"><asp:Label ID="TotalTasksReqLabel" runat="server" Text="0"></asp:Label></td>
        </tr>
        <tr>
            <td width="100px">Total Tasks Fulfilled:</td>
            <td width="300px"><asp:Label ID="TotalTasksFilledLabel" runat="server" Text="0"></asp:Label></td>
        </tr>
        <tr>
            <td width="100px">Today's Tasks Requested:</td>
            <td width="300px"><asp:Label ID="TodaysTasksReqLabel" runat="server" Text="0"></asp:Label></td>
        </tr>
        <tr>
            <td width="100px">Today's Tasks Fulfilled:</td>
            <td width="300px"><asp:Label ID="TodaysTasksFilledLabel" runat="server" Text="0"></asp:Label></td>
        </tr>
        <tr>
            <td width="100px">Tomorrow's Tasks Requested:</td>
            <td width="300px"><asp:Label ID="TomorrowsTasksReqLabel" runat="server" Text="0"></asp:Label></td>
        </tr>
        <tr>
            <td width="100px">Tomorrow's Tasks Fulfilled:</td>
            <td width="300px"><asp:Label ID="TomorrowsTasksFilledLabel" runat="server" Text="0"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
