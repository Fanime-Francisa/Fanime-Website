<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="VolDataSource" runat="server" OnInserted="VolDataSource_Inserted"
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>">
        <InsertParameters>
            <asp:Parameter Direction="Output" Name="Identity" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <h2>Confirm Reimbursement</h2><br />
    <table width="800px" cellspacing="4px" cellpadding="4px">
        <tr>
            <td width="100px">First Name</td>
            <td width="150px"><asp:Label ID="FirstNameLabel" runat="server" Width="100%"></asp:Label></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><asp:Label ID="LastNameLabel" runat="server" Width="100%"></asp:Label></td>
        </tr>
        <tr>
            <td>Hours Worked</td>
            <td><asp:TextBox ID="HoursWorkedTxt" runat="server" Width="50px" MaxLength="3">0</asp:TextBox></td>
            <td><asp:RangeValidator ID="HoursWorkedValidator" runat="server" ErrorMessage="Number greater than 0 required" ControlToValidate="HoursWorkedTxt" ForeColor="Red" MinimumValue="1" MaximumValue="99" Type="Integer"></asp:RangeValidator></td>
        </tr>
        <tr>
            <td>Badge Type</td>
            <td><asp:DropDownList ID="BadgeTypeDDL" runat="server">
                <asp:ListItem Value="Full Weekend" Text="Full Weekend"></asp:ListItem>
                <asp:ListItem Value="Single Day" Text="Single Day"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Approved By</td>
            <td><asp:TextBox ID="ApprovedTxt" runat="server" MaxLength="50"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="ApprovedValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="ApprovedTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Staffer</td>
            <td><asp:CheckBox ID="IsStaffCBox" runat="server" /></td>
        </tr>
        <tr>
            <td>Staff ID</td>
            <td><asp:TextBox ID="StaffIDTxt" runat="server" MaxLength="10"></asp:TextBox></td>
        </tr>
    </table>
    <asp:Button ID="ConfirmationBtn" runat="server" 
    Text="Approve Reimbursement" CssClass="buttonStyle" 
    onclick="ConfirmationBtn_Click" /><br /><br />
    <asp:Label ID="ConfirmationLabel" runat="server" ForeColor="Red" />
</asp:Content>

