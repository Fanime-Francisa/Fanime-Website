using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ConfirmationReceipt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["ConfirmationID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                DataView dv;
                WebToolbox wt = new WebToolbox();

                try
                {
                    VolDataSource.SelectCommand = "SELECT FirstName, LastName, HoursWorked, Approver, BadgeType, BadgeID, ConfirmationCode, DateConfirmed, Address, City, State, Zip, Email" +
                                                  " FROM Confirmations, Volunteers" +
                                                  " WHERE Confirmations.VolunteerID = Volunteers.VolunteerID AND ConfirmationID = " + wt.SQLCleanData(Request.QueryString["ConfirmationID"]);

                    dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                    FirstNameLabel.Text = Convert.ToString(dv.Table.Rows[0]["FirstName"]);
                    LastNameLabel.Text = Convert.ToString(dv.Table.Rows[0]["LastName"]);
                    HoursWorkedLabel.Text = Convert.ToString(dv.Table.Rows[0]["HoursWorked"]);
                    ApprovedLabel.Text = Convert.ToString(dv.Table.Rows[0]["Approver"]);
                    BadgeTypeLabel.Text = Convert.ToString(dv.Table.Rows[0]["BadgeType"]);
                    BadgeIDLabel.Text = Convert.ToString(dv.Table.Rows[0]["BadgeID"]);
                    ConfirmationNoLabel.Text = Convert.ToString(dv.Table.Rows[0]["ConfirmationCode"]);
                    ConfirmationDateLabel.Text = Convert.ToString(dv.Table.Rows[0]["DateConfirmed"]);
                    EmailLabel.Text = Convert.ToString(dv.Table.Rows[0]["Email"]);

                    ReimbursementAddressLabel.Text = Convert.ToString(dv.Table.Rows[0]["Address"]);
                    ReimbursementAddress2Label.Text = Convert.ToString(dv.Table.Rows[0]["City"]).Trim() + ", " + Convert.ToString(dv.Table.Rows[0]["State"]) + " " + Convert.ToString(dv.Table.Rows[0]["Zip"]);
                }
                catch (Exception exc)
                {
                    wt.LogError(exc.Message, "Error in Confirmation Receipt Page - Page Load", Page);
                }
            }
        }
    }
}