<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="Error.aspx.cs" Inherits="error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Technical Difficulties</h2><br />
    <img src="Images/technical_difficulties.jpg" /><br />
    <asp:Label ID="ErrorLabel" runat="server" ForeColor="Red"></asp:Label>
</asp:Content>

