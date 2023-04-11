<%@ Page Title="Fanime Volunteers" Language="C#" MasterPageFile="~/VolunteersSite.master" AutoEventWireup="true" CodeFile="VolunteerInformation.aspx.cs" Inherits="VolunteerDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:SqlDataSource ID="VolDataSource" runat="server" OnInserted="VolDataSource_Inserted"
     ConnectionString="<%$ ConnectionStrings:VolunteersConnectionString %>">
        <InsertParameters>
            <asp:Parameter Direction="Output" Name="Identity" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
    <h2>General Information</h2><br />
    <table width="800px" cellspacing="4px" cellpadding="4px">
        <tr>
            <td width="100px">First Name</td>
            <td width="300px"><asp:TextBox ID="FirstNameTxt" runat="server" Width="100%" 
                    MaxLength="20"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="FirstNameValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="FirstNameTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><asp:TextBox ID="LastNameTxt" runat="server" Width="100%" MaxLength="20"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="LastNameValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="LastNameTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Badge ID</td>
            <td><asp:TextBox ID="BadgeIDTxt" runat="server" Width="70%" MaxLength="10"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="BadgeIDValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="BadgeIDTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Date of Birth</td>
            <td><asp:TextBox ID="DateOfBirthTxt" runat="server" Width="70%" MaxLength="10"></asp:TextBox></td>
            <td><asp:CompareValidator ID="DateOfBirthValidator" runat="server" ErrorMessage="Date Required" ControlToValidate="DateOfBirthTxt" ForeColor="Red" Type="Date" Operator="DataTypeCheck" ></asp:CompareValidator></td>
        </tr>
        <tr>
            <td>Mobile</td>
            <td><asp:TextBox ID="MobileTxt" runat="server" Width="70%" MaxLength="12"></asp:TextBox> xxx-xxx-xxxx
            </td>
            <td><asp:RegularExpressionValidator
                    ID="MobileTxtValidator" runat="server" ForeColor="Red" 
                    ErrorMessage="Invalid phone number" 
                    ValidationExpression="^\d{3}-\d{3}-\d{4}" ControlToValidate="MobileTxt"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>Comments</td>
            <td><asp:TextBox ID="CommentsTxt" runat="server" Width="100%" MaxLength="256"></asp:TextBox></td>
        </tr>
    </table>
    <h2>Emergency Contact Information</h2><br />
    <table width="800px" cellspacing="4px" cellpadding="4px">
        <tr>
            <td width="100px">First Name</td>
            <td width="300px"><asp:TextBox ID="EmergencyFirstNameTxt" runat="server" Width="100%" 
                    MaxLength="20"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Last Name</td>
            <td><asp:TextBox ID="EmergencyLastNameTxt" runat="server" Width="100%" MaxLength="20"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Relation</td>
            <td><asp:TextBox ID="RelationTxt" runat="server" Width="70%" MaxLength="10"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Phone #</td>
            <td><asp:TextBox ID="EmergencyMobileTxt" runat="server" Width="70%" MaxLength="12"></asp:TextBox> xxx-xxx-xxxx
            </td>
            <td><asp:RegularExpressionValidator
                    ID="EmergencyMobileTxtValidator" runat="server" ForeColor=Red 
                    ErrorMessage="Invalid phone number" 
                    ValidationExpression="^\d{3}-\d{3}-\d{4}" ControlToValidate="EmergencyMobileTxt"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>Alt Phone #</td>
            <td><asp:TextBox ID="EmergencyAltMobileTxt" runat="server" Width="70%" MaxLength="12"></asp:TextBox> xxx-xxx-xxxx
            </td>
            <td><asp:RegularExpressionValidator
                    ID="EmergencyAltMobileTxtValidator" runat="server" ForeColor=Red 
                    ErrorMessage="Invalid phone number" 
                    ValidationExpression="^\d{3}-\d{3}-\d{4}" ControlToValidate="EmergencyAltMobileTxt"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>Medical Conditions</td>
            <td><asp:TextBox ID="MedicalConditionTxt" runat="server" Width="70%" MaxLength="50"></asp:TextBox></td>
        </tr>
    </table>
    <h2>Reimbursement Information</h2><br />
    <table width="800px" cellspacing="4px" cellpadding="4px">
        <tr>
            <td width="100px">Address</td>
            <td width="300px"><asp:TextBox ID="AddressTxt" runat="server" Width="100%" 
                    MaxLength="150"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="AddressValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="AddressTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>City</td>
            <td><asp:TextBox ID="CityTxt" runat="server" Width="100%" MaxLength="25"></asp:TextBox></td>
            <td><asp:RequiredFieldValidator ID="CityValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="CityTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>State</td>
            <td><asp:DropDownList ID="StateDropDownList" runat="server" Width="160px">
                <asp:ListItem Value="AL" Text="Alabama"></asp:ListItem>
                <asp:ListItem Value="AK" Text="Alaska"></asp:ListItem>
                <asp:ListItem Value="AZ" Text="Arizona"></asp:ListItem>
                <asp:ListItem Value="AR" Text="Arkansas"></asp:ListItem>
                <asp:ListItem Value="CA" Text="California" Selected="True"></asp:ListItem>
                <asp:ListItem Value="CO" Text="Colorado"></asp:ListItem>
                <asp:ListItem Value="CT" Text="Connecticut"></asp:ListItem>
                <asp:ListItem Value="DE" Text="Delaware"></asp:ListItem>
                <asp:ListItem Value="DC" Text="District of Columbia"></asp:ListItem>
                <asp:ListItem Value="FL" Text="Florida"></asp:ListItem>
                <asp:ListItem Value="GA" Text="Georgia"></asp:ListItem>
                <asp:ListItem Value="HI" Text="Hawaii"></asp:ListItem>
                <asp:ListItem Value="ID" Text="Idaho"></asp:ListItem>
                <asp:ListItem Value="IL" Text="Illinois"></asp:ListItem>
                <asp:ListItem Value="IN" Text="Indiana"></asp:ListItem>
                <asp:ListItem Value="IA" Text="Iowa"></asp:ListItem>
                <asp:ListItem Value="KS" Text="Kansas"></asp:ListItem>
                <asp:ListItem Value="KY" Text="Kentucky"></asp:ListItem>
                <asp:ListItem Value="LA" Text="Louisiana"></asp:ListItem>
                <asp:ListItem Value="ME" Text="Maine"></asp:ListItem>
                <asp:ListItem Value="MD" Text="Maryland"></asp:ListItem>
                <asp:ListItem Value="MA" Text="Massachusetts"></asp:ListItem>
                <asp:ListItem Value="MI" Text="Michigan"></asp:ListItem>
                <asp:ListItem Value="MN" Text="Minnesota"></asp:ListItem>
                <asp:ListItem Value="MS" Text="Mississippi"></asp:ListItem>
                <asp:ListItem Value="MO" Text="Missouri"></asp:ListItem>
                <asp:ListItem Value="MT" Text="Montana"></asp:ListItem>
                <asp:ListItem Value="NE" Text="Nebraska"></asp:ListItem>
                <asp:ListItem Value="NV" Text="Nevada"></asp:ListItem>
                <asp:ListItem Value="NH" Text="New Hampshire"></asp:ListItem>
                <asp:ListItem Value="NJ" Text="New Jersey"></asp:ListItem>
                <asp:ListItem Value="NM" Text="New Mexico"></asp:ListItem>
                <asp:ListItem Value="NY" Text="New York"></asp:ListItem>
                <asp:ListItem Value="NC" Text="North Carolina"></asp:ListItem>
                <asp:ListItem Value="ND" Text="North Dakota"></asp:ListItem>
                <asp:ListItem Value="OH" Text="Ohio"></asp:ListItem>
                <asp:ListItem Value="OK" Text="Oklahoma"></asp:ListItem>
                <asp:ListItem Value="OR" Text="Oregon"></asp:ListItem>
                <asp:ListItem Value="PA" Text="Pennsylvania"></asp:ListItem>
                <asp:ListItem Value="RI" Text="Rhode Island"></asp:ListItem>
                <asp:ListItem Value="SC" Text="South Carolina"></asp:ListItem>
                <asp:ListItem Value="SD" Text="South Dakota"></asp:ListItem>
                <asp:ListItem Value="TN" Text="Tennessee"></asp:ListItem>
                <asp:ListItem Value="TX" Text="Texas"></asp:ListItem>
                <asp:ListItem Value="UT" Text="Utah"></asp:ListItem>
                <asp:ListItem Value="VT" Text="Vermont"></asp:ListItem>
                <asp:ListItem Value="VA" Text="Virginia"></asp:ListItem>
                <asp:ListItem Value="WA" Text="Washington"></asp:ListItem>
                <asp:ListItem Value="WV" Text="West Virginia"></asp:ListItem>
                <asp:ListItem Value="WI" Text="Wisconsin"></asp:ListItem>
                <asp:ListItem Value="WY" Text="Wyoming"></asp:ListItem>
                </asp:DropDownList> </td>
        </tr>
        <tr>
            <td>Zip</td>
            <td><asp:TextBox ID="ZipTxt" runat="server" Width="70%" MaxLength="5"></asp:TextBox>
            </td>
            <td><asp:RegularExpressionValidator
                    ID="ZipValidator" runat="server" ForeColor=Red 
                    ErrorMessage="Invalid zip code" 
                    ValidationExpression="^\d{5}" ControlToValidate="ZipTxt"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="ZipRequiredValidator" runat="server" ErrorMessage="Required" ForeColor="Red" ControlToValidate="ZipTxt"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><asp:TextBox ID="EmailTxt" runat="server" Width="70%" MaxLength="50"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Phone #</td>
            <td><asp:TextBox ID="ReimbursementPhoneTxt" runat="server" Width="70%" MaxLength="12"></asp:TextBox> xxx-xxx-xxxx
            </td>
            <td><asp:RegularExpressionValidator
                    ID="ReimbursementPhoneTxtValidator" runat="server" ForeColor="Red" 
                    ErrorMessage="Invalid phone number" 
                    ValidationExpression="^\d{3}-\d{3}-\d{4}" ControlToValidate="ReimbursementPhoneTxt"></asp:RegularExpressionValidator></td>
        </tr>
    </table>
    <br />
    <asp:Button ID="UpdateVolunteerInfoBtn" runat="server" 
    Text="Update Information" CssClass="buttonStyle" 
    onclick="UpdateVolunteerInfoBtn_Click" />

    <asp:Button ID="ConfirmationBtn" runat="server" 
    Text="Confirm Reimbursement" CssClass="buttonStyle" 
    onclick="ConfirmationBtn_Click" Visible="False" />
</asp:Content>

