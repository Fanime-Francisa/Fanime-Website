<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="VolunteersDefault.aspx.cs" Inherits="VolunteersDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="VolDataSource" runat="server" 
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>" 
        SelectCommand="SELECT [VolunteerID], [FirstName], [LastName], [BadgeID], [Age] FROM [Volunteers] ORDER BY [LastName], [FirstName]"></asp:SqlDataSource>
    <p><h2>Search</h2></p>
     <table width="800px" cellspacing="4px" cellpadding="4px">
        <tr>
            <td width="100px">First Name</td>
            <td width="300px"><asp:TextBox ID="FirstNameTxt" runat="server" Width="100%" 
                    MaxLength="20"></asp:TextBox></td>
            <td></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><asp:TextBox ID="LastNameTxt" runat="server" Width="100%" MaxLength="20"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Badge ID</td>
            <td><asp:TextBox ID="BadgeIDTxt" runat="server" Width="70%" MaxLength="10"></asp:TextBox></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="VolunteersSearchBtn" runat="server" Text="Volunteer Search" 
        CssClass="buttonStyle" onclick="VolunteersSearchBtn_Click" />
    &nbsp;<asp:Button ID="AddNewVolunteerBtn" runat="server" Text="Add New Volunteer" 
            CssClass="buttonStyle" onclick="AddNewVolunteerBtn_Click" />
    <p><asp:Label Text="O" runat="server" BackColor="Orange" ForeColor="Orange"></asp:Label>: This individual is under the age of 16 and has some restrictions on the tasks that they can sign up for.</p>
    <p><asp:Label Text="O" runat="server" BackColor="Red" ForeColor="Red"></asp:Label>: This individual is under the age of 13 and CANNOT volunteer for anything.</p>
    <p><h2>Volunteers</h2></p>
    <asp:GridView ID="VolunteersGridView" runat="server" DataKeyNames="VolunteerID"
        AutoGenerateColumns="False" DataSourceID="VolDataSource" 
        AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="volunteersGV" 
        ForeColor="#333333" GridLines="None" OnRowCommand="VolunteersGridView_RowCommand"
        PageSize="20" OnRowDataBound= "GridviewRowDataBound">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:ButtonField ItemStyle-CssClass="volunteersSelect" CommandName="Select" ItemStyle-Width="50px" Text="Details" />
            <asp:BoundField DataField="FirstName" HeaderText="First Name" 
                SortExpression="FirstName" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="LastName" HeaderText="Last Name" 
                SortExpression="LastName" ItemStyle-Width="150px" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="BadgeID" HeaderText="Badge ID"
                SortExpression="BadgeID" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" />
            <asp:BoundField DataField="Age" HeaderText="Age"
                SortExpression="Age" ItemStyle-Width="100px" HeaderStyle-HorizontalAlign="Left" />
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
    <asp:Label ID="VolunteersLabel" runat="server" Text=""></asp:Label>
</asp:Content>

