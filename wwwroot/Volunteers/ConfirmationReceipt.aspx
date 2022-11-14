﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ConfirmationReceipt.aspx.cs" Inherits="ConfirmationReceipt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirmation Receipt</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:SqlDataSource ID="VolDataSource" runat="server"
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>">
    </asp:SqlDataSource>
    <h2 style="font-size: x-large; font-weight: bold">FanimeCon Volunteer Reimbursement Receipt</h2>
    <table width="500px" cellspacing="4px" cellpadding="4px" style="font-size: medium">
        <tr>
            <td width="100px">First Name:</td>
            <td width="300px"><asp:Label ID="FirstNameLabel" runat="server" Width="100%"></asp:Label></td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td><asp:Label ID="LastNameLabel" runat="server" Width="100%"></asp:Label></td>
        </tr>
        <tr>
            <td>Hours Worked:</td>
            <td><asp:Label ID="HoursWorkedLabel" runat="server" Width="100%" /></td>
        </tr>
        <tr>
            <td>Approved By:</td>
            <td><asp:Label ID="ApprovedLabel" runat="server" Width="100%" /></td>
        </tr>
        <tr>
            <td>Badge Type:</td>
            <td><asp:Label ID="BadgeTypeLabel" runat="server" Width="100%" /></td>
        </tr>
        <tr>
            <td>Badge ID:</td>
            <td><asp:Label ID="BadgeIDLabel" runat="server" Width="100%" /></td>
        </tr>
        <tr>
            <td>Confirmation #:</td>
            <td><asp:Label ID="ConfirmationNoLabel" runat="server" Width="100%" /></td>
        </tr>
        <tr>
            <td>Date Confirmed:</td>
            <td><asp:Label ID="ConfirmationDateLabel" runat="server" Width="100%" /></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><asp:Label ID="EmailLabel" runat="server" Width="100%" /></td>
        </tr>
    </table>
    <h2 style="font-size: large">Reimbursement Address</h2><br />
    <asp:Label ID="ReimbursementAddressLabel" runat="server" Width="100%" Font-Size="Larger" /><br />
    <asp:Label ID="ReimbursementAddress2Label" runat="server" Width="100%" Font-Size="Larger" /><br />
    <br />
    <br />
    <asp:Label ID="VolSignatureLabel" runat="server" Width="100%" Text="Volunteer Signature: ________________________________________  Date _______________" /><br />
    <br />
    <br />
    <asp:Label ID="AuthorizedSignatureLabel" runat="server" Width="100%" Text="Volunteer Head Signature: ________________________________________  Date _______________" /><br />
    <br />
    Your reimbursement will be mailed out to you at the above address within 4-6 weeks. If you do not receive your reimbursement or have any questions please email volunteers@fanime.com and be prepared to provide the information from this receipt. Thank you so much for volunteering and I hope you had a great experience!
    </div>
    </form>
</body>
</html>
