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
        if (Request.QueryString["VolID"] == null && Request.QueryString["VolID"] != "")
        {
            Response.Redirect("VolunteersDefault.aspx");
        }

        WebToolbox wt = new WebToolbox();
        DataView dv;

        if (Request.QueryString["TaskID"] != null && Request.QueryString["TaskID"] != "")
        {
            try
            {
                volID = Request.QueryString["VolID"];
                string taskID = Request.QueryString["TaskID"];
                AvailableTasksDataSource.UpdateCommand = "UPDATE TaskVolunteers SET volunteerID = " + volID +
                                                         " WHERE TaskVolunteerID in (SELECT TOP (1) taskVolunteerID FROM TaskVolunteers WHERE taskID = " + taskID + " AND volunteerID is null)" +
                                                         " AND TaskID not in (SELECT distinct taskID FROM TaskVolunteers WHERE volunteerID = " + volID + ")";
            }
            catch (Exception exc)
            {
                wt.LogError(exc.Message, "Error in Volunteer Details Page - Assign Task", Page);
            }

            if (AvailableTasksDataSource.Update() <= 0)
            {
                AvailableTasksLabel.Text = "Unable to assign task. Task may have already been assigned or is completely full.";
            }
        }

        try
        {
            string assignedTaskID = "";
            volID = wt.SQLCleanData(Request.QueryString["VolID"]);

            VolDataSource.SelectCommand = "SELECT * FROM Volunteers WHERE volunteerID = " + volID;
            dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);
            string AgeTR;

            if (dv.Table.Rows.Count > 0)
            {
                FirstNameLabel.Text = (string)dv.Table.Rows[0]["FirstName"];
                LastNameLabel.Text = (string)dv.Table.Rows[0]["LastName"];
                BadgeIDLabel.Text = (string)dv.Table.Rows[0]["BadgeID"];
                AgeLabel.Text = dv.Table.Rows[0]["Age"].ToString();
                MobileLabel.Text = (string)dv.Table.Rows[0]["Mobile"];
                int MinorFlag = (int)dv.Table.Rows[0]["IsMinor"];

                if (MinorFlag == -1) {
                    AgeLabel.BackColor = System.Drawing.Color.Red;
                } else if (MinorFlag == 0) {
                    AgeLabel.BackColor = System.Drawing.Color.Orange;
                }

                UpdateVolunteerLink.NavigateUrl = "~/VolunteerInformation.aspx?volID=" + volID;
            }
            else
            {
                FirstNameLabel.Text = "Volunteer ID does not exist";
            }

            AssignedTasksDataSource.SelectCommand = "SELECT TaskID, Description, LocationName, DepartmentName, Day, StartTime, EndTime, Duration, RequiredVolunteers, OptionalVolunteers, PriorityName, AvailableCount, FilledCount" +
                                                    " FROM AssignedTasksView WHERE volunteerID = " + volID + 
                                                    " ORDER BY StartTime";
            AssignedTasksDataSource.Select(DataSourceSelectArguments.Empty);
            dv = (DataView)AssignedTasksDataSource.Select(DataSourceSelectArguments.Empty);

            if (dv.Table.Rows.Count == 0)
            {
                AssignedTasksLabel.Text = "No tasks assigned";
            }
            else
            {
                assignedTaskID = dv.Table.Rows[0]["TaskID"].ToString();
                for (int ndx = 1; ndx < dv.Table.Rows.Count; ndx++)
                {
                    assignedTaskID = dv.Table.Rows[ndx]["TaskID"].ToString() + "," + assignedTaskID;
                }
                AssignedTasksLabel.Text = "";
            }

            AvailableTasksDataSource.SelectCommand = "SELECT Top(25) TaskID, Description, LocationName, DepartmentName, Day, StartTime, EndTime, Duration, RequiredVolunteers, OptionalVolunteers, PriorityName, AvailableCount, FilledCount, Priority FROM PriorityTasksView";
            if (assignedTaskID != "")
            {
                AvailableTasksDataSource.SelectCommand = AvailableTasksDataSource.SelectCommand + " WHERE taskID not in (" + assignedTaskID + ") AND EndTime > dbo.SYSDATE()";
            }
            AvailableTasksDataSource.SelectCommand = AvailableTasksDataSource.SelectCommand + " ORDER BY StartTime ASC, Priority DESC";
            dv = (DataView)AvailableTasksDataSource.Select(DataSourceSelectArguments.Empty);
        
            if (dv.Table.Rows.Count == 0)
            {
                AvailableTasksLabel.Text = "No recommended tasks";
            }
            else
            {
                AvailableTasksLabel.Text = "";
            }
        }
        catch (Exception exc)
        {
            wt.LogError(exc.Message, "Error in Volunteer Details Page - Page Load", Page);
        }
    }

    protected void AssignedTasksGridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        WebToolbox wt = new WebToolbox();

        if (e.CommandName == "Unassign")
        {
            try
            {
                int index = Convert.ToInt32(e.CommandArgument);
                string taskID = AssignedTasksGridView.DataKeys[index].Value.ToString();
                AssignedTasksDataSource.UpdateCommand = "UPDATE TaskVolunteers SET volunteerID = null" +
                                                        " WHERE taskID = " + taskID +
                                                        " AND volunteerID = " + volID;
            }
            catch (Exception exc)
            {
                wt.LogError(exc.Message, "Error in Volunteer Details Page - Unassign Task", Page);
            }

            if (AssignedTasksDataSource.Update() > 0)
            {
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else
            {
                AssignedTasksLabel.Text = "Unable to unassign task. Task may have already been unassigned.";
            }
        }
    }

    protected void AvailableTasksGridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Assign") {
            int index = Convert.ToInt32(e.CommandArgument);
            WebToolbox wt = new WebToolbox();

            try
            {
                string taskID = AvailableTasksGridView.DataKeys[index].Value.ToString();

                AvailableTasksDataSource.UpdateCommand = "UPDATE TaskVolunteers SET volunteerID = " + volID +
                                                         " WHERE TaskVolunteerID in (SELECT TOP (1) taskVolunteerID FROM TaskVolunteers WHERE taskID = " + taskID + " AND volunteerID is null)" +
                                                         " AND TaskID not in (SELECT distinct taskID FROM TaskVolunteers WHERE volunteerID = " + volID + ")";
            }
            catch (Exception exc)
            {
                wt.LogError(exc.Message, "Error in Volunteer Details Page - Assign Task", Page);
            }
                
            if (AvailableTasksDataSource.Update() > 0)
            {
                Response.Redirect(Request.Url.AbsoluteUri);
            }
            else
            {
                AvailableTasksLabel.Text = "Unable to assign task. Task may have already been assigned.";
            }
        }
    }

    protected void FindMoreTasksBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("TasksDefault.aspx?volID=" + volID);
    }

    string volID;
}