<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="Help.aspx.cs" Inherits="Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<h2>Fanime Volunteer Management System</h2>
    <p>Written By Peter Kurniadi<br />
        Email - <a href="mailto:peter@fanime.com">peter@fanime.com</a></p>
    <h2>Instructions</h2><br />
<table width="800px" cellspacing="4px" cellpadding="4px" border="1">
        <tr>
            <td width="800px">Sign-up New Volunteers <asp:HyperLink ID="addNewVolunteerLink" runat="server" NavigateUrl="~/VolunteerInformation.aspx">here</asp:HyperLink></td>
        </tr>
        <tr>
            <td width="800px">
            Add/Update Tasks for a Volunteer<br />
            1. Search for the volunteer <asp:HyperLink ID="VolunteerSearchLink" runat="server" NavigateUrl="~/VolunteersDefault.aspx">here</asp:HyperLink><br />
            2. Click on the "Details" link.<br />
            3. Click on the "Assign" link to assign a recommended task to that volunteer or click on the "Find More Tasks" button.<br />
            4. If you clicked the "Find More Tasks" button, search for an appropriate tasks then hit the "Assign" link.<br />
            </td>
        </tr>
    </table>

</asp:Content>

