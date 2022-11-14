using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Confirmation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["VolID"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                DataView dv;
                WebToolbox wt = new WebToolbox();

                try
                {
                    VolDataSource.SelectCommand = "SELECT FirstName, LastName, ConfirmationID" +
                                                  " FROM Volunteers LEFT JOIN Confirmations ON Volunteers.VolunteerID = Confirmations.VolunteerID" +
                                                  " WHERE Volunteers.VolunteerID = " + wt.SQLCleanData(Request.QueryString["VolID"]);

                    dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                    FirstNameLabel.Text = Convert.ToString(dv.Table.Rows[0]["FirstName"]);
                    LastNameLabel.Text = Convert.ToString(dv.Table.Rows[0]["LastName"]);

                    if (!DBNull.Value.Equals(dv.Table.Rows[0]["ConfirmationID"])) { ConfirmationLabel.Text = "Warning: Volunteer has already been approved for reimbursement. Only the most recent confirmation number will apply."; }
                }
                catch (Exception exc)
                {
                    wt.LogError(exc.Message, "Error in Confirmation Page", Page);
                }
            }
        }
    }

    protected void ConfirmationBtn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            WebToolbox wt = new WebToolbox();
            string confirmStatus = "Approved";
            int isStaff = 0;

            try
            {
                if (IsStaffCBox.Checked) { isStaff = 1; }
                VolDataSource.UpdateCommand = "UPDATE Confirmations SET Status = 'Old' WHERE VolunteerID = " + wt.SQLCleanData(Request.QueryString["VolID"]);

                if (VolDataSource.Update() > 0) { confirmStatus = "Reprinted"; }
                VolDataSource.InsertCommand = "INSERT INTO Confirmations (VolunteerID,HoursWorked,DateConfirmed,Approver,BadgeType,ConfirmationCode," +
                                              " IsStaff,StaffID, Status) VALUES (" +
                                              wt.SQLCleanData(Request.QueryString["VolID"]) + "," +
                                              wt.SQLCleanData(HoursWorkedTxt.Text) + "," +
                                              "dbo.SYSDATE(),'" +
                                              wt.SQLCleanData(ApprovedTxt.Text) + "','" +
                                              wt.SQLCleanData(BadgeTypeDDL.SelectedValue) + "','" +
                                              GetConfirmationCode(Convert.ToInt32(Request.QueryString["VolID"])) + "'," +
                                              isStaff + ",'" +
                                              wt.SQLCleanData(StaffIDTxt.Text) + "','" +
                                              confirmStatus + "'); SET @Identity = SCOPE_IDENTITY();";
                VolDataSource.Insert();

                Page.ClientScript.RegisterStartupScript(this.GetType(), "popup", "window.open('ConfirmationReceipt.aspx?confirmationID=" + confirmationID + "')", true);
            }
            catch (Exception exc)
            {
                wt.LogError(exc.Message, "Error in Confirmation Page", Page);
            }
        }
    }

    protected void VolDataSource_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        confirmationID = e.Command.Parameters["@Identity"].Value.ToString();
    }

    protected String GetConfirmationCode(int seed)
    {
        Random rand = new Random(seed);
        return rand.Next(99999999).ToString().PadRight(10,'0');
    }

    private string confirmationID;
}