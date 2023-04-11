using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VolunteerDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["VolID"] == null)
            {
                UpdateVolunteerInfoBtn.Text = "Add New Volunteer";
            }
            else
            {
                DataView dv;
                WebToolbox wt = new WebToolbox();

                try
                {
                    VolDataSource.SelectCommand = "SELECT * FROM Volunteers WHERE VolunteerID = " + wt.SQLCleanData(Request.QueryString["VolID"]);

                    dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                    FirstNameTxt.Text = Convert.ToString(dv.Table.Rows[0]["FirstName"]);
                    LastNameTxt.Text = Convert.ToString(dv.Table.Rows[0]["LastName"]);
                    BadgeIDTxt.Text = Convert.ToString(dv.Table.Rows[0]["BadgeID"]);
                    DateTime dt = DateTime.Parse(Convert.ToString(dv.Table.Rows[0]["DateOfBirth"]));
                    DateOfBirthTxt.Text = dt.ToString("M/dd/yyyy");
                    MobileTxt.Text = Convert.ToString(dv.Table.Rows[0]["Mobile"]);
                    CommentsTxt.Text = Convert.ToString(dv.Table.Rows[0]["Comments"]);

                    EmergencyFirstNameTxt.Text = Convert.ToString(dv.Table.Rows[0]["EmergencyFirstName"]);
                    EmergencyLastNameTxt.Text = Convert.ToString(dv.Table.Rows[0]["EmergencyLastName"]);
                    RelationTxt.Text = Convert.ToString(dv.Table.Rows[0]["Relation"]);
                    EmergencyMobileTxt.Text = Convert.ToString(dv.Table.Rows[0]["EmergencyMobile"]);
                    EmergencyAltMobileTxt.Text = Convert.ToString(dv.Table.Rows[0]["EmergencyAltMobile"]);
                    MedicalConditionTxt.Text = Convert.ToString(dv.Table.Rows[0]["MedicalConditions"]);

                    AddressTxt.Text = Convert.ToString(dv.Table.Rows[0]["Address"]);
                    CityTxt.Text = Convert.ToString(dv.Table.Rows[0]["City"]);
                    StateDropDownList.SelectedValue = Convert.ToString(dv.Table.Rows[0]["State"]);
                    ZipTxt.Text = Convert.ToString(dv.Table.Rows[0]["Zip"]);
                    EmailTxt.Text = Convert.ToString(dv.Table.Rows[0]["Email"]);
                    ReimbursementPhoneTxt.Text = Convert.ToString(dv.Table.Rows[0]["ReimbursementPhone"]);

                    UpdateVolunteerInfoBtn.Text = "Update Volunteer";

                    ConfirmationBtn.Visible = true;
                }
                catch (Exception exc)
                {
                    wt.LogError(exc.Message, "Error in Volunteer Information Page - Page Load", Page);
                }
            }
        }
    }

    protected void UpdateVolunteerInfoBtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid) 
        {
            WebToolbox wt = new WebToolbox();

            if (Request.QueryString["VolID"] == null)
            {
                try
                {
                    VolDataSource.InsertCommand = "INSERT INTO VOLUNTEERS (FirstName,LastName,BadgeID,DateOfBirth,Mobile," +
                                                    " EmergencyFirstName,EmergencyLastName,Relation,EmergencyMobile,EmergencyAltMobile,MedicalConditions," +
                                                    " Address,City,State,Zip,Email,ReimbursementPhone,Comments,DateCreated) VALUES ('" +
                                                    wt.SQLCleanData(FirstNameTxt.Text) + "','" +
                                                    wt.SQLCleanData(LastNameTxt.Text) + "','" +
                                                    wt.SQLCleanData(BadgeIDTxt.Text) + "','" +
                                                    wt.SQLCleanData(DateOfBirthTxt.Text) + "','" +
                                                    wt.SQLCleanData(MobileTxt.Text) + "','" +
                                                    wt.SQLCleanData(EmergencyFirstNameTxt.Text) + "','" +
                                                    wt.SQLCleanData(EmergencyLastNameTxt.Text) + "','" +
                                                    wt.SQLCleanData(RelationTxt.Text) + "','" +
                                                    wt.SQLCleanData(EmergencyMobileTxt.Text) + "','" +
                                                    wt.SQLCleanData(EmergencyAltMobileTxt.Text) + "','" +
                                                    wt.SQLCleanData(MedicalConditionTxt.Text) + "','" +
                                                    wt.SQLCleanData(AddressTxt.Text) + "','" +
                                                    wt.SQLCleanData(CityTxt.Text) + "','" +
                                                    wt.SQLCleanData(StateDropDownList.SelectedValue) + "','" +
                                                    wt.SQLCleanData(ZipTxt.Text) + "','" +
                                                    wt.SQLCleanData(EmailTxt.Text) + "','" +
                                                    wt.SQLCleanData(ReimbursementPhoneTxt.Text) + "','" +
                                                    wt.SQLCleanData(CommentsTxt.Text) + "'," +
                                                    "GetDate()); SET @Identity = SCOPE_IDENTITY();";
                    VolDataSource.Insert();
                }
                catch (Exception exc)
                {
                    wt.LogError(exc.Message, "Error in Volunteer Information Page - Insert Volunteer", Page);
                }
                Response.Redirect("VolunteerDetails.aspx?volID=" + volunteerID);
            }
            else
            {
                try {
                    volunteerID = wt.SQLCleanData(Request.QueryString["VolID"]);
                    VolDataSource.UpdateCommand = "UPDATE Volunteers SET " +
                                                    "FirstName = '" + wt.SQLCleanData(FirstNameTxt.Text) + "'," +
                                                    "LastName = '" + wt.SQLCleanData(LastNameTxt.Text) + "'," +
                                                    "BadgeID = '" + wt.SQLCleanData(BadgeIDTxt.Text) + "'," +
                                                    "DateOfBirth = '" + wt.SQLCleanData(DateOfBirthTxt.Text) + "'," +
                                                    "Mobile = '" + wt.SQLCleanData(MobileTxt.Text) + "'," +
                                                    "EmergencyFirstName = '" + wt.SQLCleanData(EmergencyFirstNameTxt.Text) + "'," +
                                                    "EmergencyLastName = '" + wt.SQLCleanData(EmergencyLastNameTxt.Text) + "'," +
                                                    "Relation = '" + wt.SQLCleanData(RelationTxt.Text) + "'," +
                                                    "EmergencyMobile = '" + wt.SQLCleanData(EmergencyMobileTxt.Text) + "'," +
                                                    "EmergencyAltMobile = '" + wt.SQLCleanData(EmergencyAltMobileTxt.Text) + "'," +
                                                    "MedicalConditions = '" + wt.SQLCleanData(MedicalConditionTxt.Text) + "'," +
                                                    "Address = '" + wt.SQLCleanData(AddressTxt.Text) + "'," +
                                                    "City = '" + wt.SQLCleanData(CityTxt.Text) + "'," +
                                                    "State = '" + wt.SQLCleanData(StateDropDownList.SelectedValue) + "'," +
                                                    "Zip = '" + wt.SQLCleanData(ZipTxt.Text) + "'," +
                                                    "Email = '" + wt.SQLCleanData(EmailTxt.Text) + "'," +
                                                    "ReimbursementPhone = '" + wt.SQLCleanData(ReimbursementPhoneTxt.Text) + "'," +
                                                    "Comments = '" + wt.SQLCleanData(CommentsTxt.Text) + "'" +
                                                    " WHERE VolunteerID = " + volunteerID;
                    VolDataSource.Update();
                }
                catch (Exception exc)
                {
                    wt.LogError(exc.Message, "Error in Volunteer Information Page - Update Volunteer", Page);
                }
                Response.Redirect("VolunteerDetails.aspx?volID=" + volunteerID);
            }
        }
    }

    protected void ConfirmationBtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            WebToolbox wt = new WebToolbox();
            Response.Redirect("~/Confirmation.aspx?volID=" + wt.SQLCleanData(Request.QueryString["VolID"]));
        }
    }

    protected void VolDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        volunteerID = e.Command.Parameters["@Identity"].Value.ToString();
    }

    private string volunteerID;

}