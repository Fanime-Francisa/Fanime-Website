using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class TasksDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["TaskID"] != null && Request.QueryString["TaskID"] != "")
            {
                WebToolbox wt = new WebToolbox();
                DataView dv;

                try
                {
                    VolDataSource.SelectCommand = "SELECT TaskID, Description, LocationName, DepartmentName, Day, StartTime, EndTime, Duration, RequiredVolunteers, OptionalVolunteers, PriorityName, AvailableCount, FilledCount" +
                                                  " FROM TasksView WHERE taskID = " + wt.SQLCleanData(Request.QueryString["TaskID"]) + " AND statusID > 0 ORDER BY StartTime, DepartmentName";
                    VolDataSource.Select(DataSourceSelectArguments.Empty);
                    dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                    if (dv.Table.Rows.Count == 0)
                    {
                        TasksLabel.Text = "Search had no results";
                    }
                    else
                    {
                        TasksLabel.Text = "";
                    }
                }
                catch (Exception exc)
                {
                    wt.LogError(exc.Message, "Error in Task Default Page - Page Load", Page);
                }
            }
            else
            {
                VolDataSource.SelectCommand = "SELECT TaskID, Description, LocationName, DepartmentName, Day, StartTime, EndTime, Duration, RequiredVolunteers, OptionalVolunteers, PriorityName, AvailableCount, FilledCount FROM TasksView WHERE StartTime >= dbo.SYSDATE() AND StatusID > 0 ORDER BY StartTime, DepartmentName";
                VolDataSource.Select(DataSourceSelectArguments.Empty);
            }
            Session["SearchSQL"] = VolDataSource.SelectCommand;
        }
        else
        {
            VolDataSource.SelectCommand = (string)Session["SearchSQL"];
            VolDataSource.Select(DataSourceSelectArguments.Empty);
        }

        if (Request.QueryString["VolID"] != null && Request.QueryString["VolID"] != "")
        {
            WebToolbox wt = new WebToolbox();

            TasksGridView.Columns[0].Visible = true;
            volID = Convert.ToInt32(wt.SQLCleanData(Request.QueryString["VolID"]));
        }
    }

    protected void TasksGridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        int index;
        string taskID;
        WebToolbox wt = new WebToolbox();

        if (e.CommandName == "Update")
        {
            index = Convert.ToInt32(e.CommandArgument);
            taskID = TasksGridView.DataKeys[index].Value.ToString();
            Response.Redirect("TaskInformation.aspx?taskID=" + taskID);
        }
        else if (e.CommandName == "Assign" && volID > 0)
        {
            try
            {
                index = Convert.ToInt32(e.CommandArgument);
                taskID = TasksGridView.DataKeys[index].Value.ToString();

                VolDataSource.UpdateCommand = "UPDATE TaskVolunteers SET volunteerID = " + volID +
                                              " WHERE TaskVolunteerID in (SELECT TOP (1) taskVolunteerID FROM TaskVolunteers WHERE taskID = " + taskID + " AND volunteerID is null)" +
                                              " AND TaskID not in (SELECT distinct taskID FROM TaskVolunteers WHERE volunteerID = " + volID + ")";
                VolDataSource.Update();
            }
            catch (Exception exc)
            {
                wt.LogError(exc.Message, "Error in Task Default Page - Task Assignment", Page);
            }

            Response.Redirect("VolunteerDetails.aspx?volID=" + volID);
            
        }
        else if (e.CommandName == "Assign" && volID == 0)
        {
            index = Convert.ToInt32(e.CommandArgument);
            taskID = TasksGridView.DataKeys[index].Value.ToString();
            Response.Redirect("VolunteersDefault.aspx?taskID=" + taskID);
        }
    }

    protected void AddNewTaskBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("TaskInformation.aspx");
    }

    protected void TasksSearchBtn_Click(object sender, EventArgs e)
    {
        WebToolbox wt = new WebToolbox();
        DataView dv;

        try
        {
            VolDataSource.SelectCommand = "SELECT TaskID, Description, LocationName, DepartmentName, Day, StartTime, EndTime, Duration, RequiredVolunteers, OptionalVolunteers, PriorityName, AvailableCount, FilledCount" +
                                          " FROM TasksView" +
                                          " WHERE Description like '%" + wt.SQLCleanData(DescriptionTxt.Text) + "%'";

            if (Convert.ToInt32(LocationList.SelectedValue) > 0)
            {
                VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND LocationID = " + wt.SQLCleanData(LocationList.SelectedValue);
            }

            if (Convert.ToInt32(DepartmentList.SelectedValue) > 0)
            {
                VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND DepartmentID = " + wt.SQLCleanData(DepartmentList.SelectedValue);
            }

            if (Convert.ToInt32(StartDayList.SelectedValue) > 0)
            {
                VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND DayID = " + wt.SQLCleanData(StartDayList.SelectedValue);
            }

            if (Convert.ToInt32(StartTimeHRList.SelectedValue) > 0)
            {
                if (StartTimeAMPMList.SelectedValue == "PM")
                {
                    VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND DATEPART(hour, StartTime) = " + wt.SQLCleanData(Convert.ToString(Convert.ToInt32(StartTimeHRList.SelectedValue) + 12));
                }
                else
                {
                    VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND DATEPART(hour, StartTime) = " + wt.SQLCleanData(StartTimeHRList.SelectedValue);
                }
            }

            if (DurationTxt.Text != "")
            {
                if (DurationList.SelectedValue == "1")
                {
                    VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND Duration >= " + wt.SQLCleanData(Convert.ToInt32(DurationTxt.Text).ToString());
                }
                else
                {
                    VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND Duration = " + wt.SQLCleanData(Convert.ToInt32(DurationTxt.Text).ToString());
                }
            }

            if (VolsNeededTxt.Text != "")
            {
                if (VolsNeededList.SelectedValue == "1")
                {
                    VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND RequiredVolunteers >= " + wt.SQLCleanData(Convert.ToInt32(VolsNeededTxt.Text).ToString());
                }
                else
                {
                    VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND RequiredVolunteers = " + wt.SQLCleanData(Convert.ToInt32(VolsNeededTxt.Text).ToString());
                }
            }

            if (Convert.ToInt32(HideOldTasksList.SelectedValue) > 0)
            {
                VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND StartTime >= dbo.SYSDATE()";
            }

            if (Convert.ToInt32(PriorityList.SelectedValue) > 0)
            {
                VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND PriorityID = " + wt.SQLCleanData(PriorityList.SelectedValue);
            }

            VolDataSource.SelectCommand = VolDataSource.SelectCommand + " AND StatusID = " + wt.SQLCleanData(StatusList.SelectedValue);

            VolDataSource.SelectCommand = VolDataSource.SelectCommand + " ORDER BY [StartTime], [DepartmentName]";
            Session["SearchSQL"] = VolDataSource.SelectCommand;

            VolDataSource.Select(DataSourceSelectArguments.Empty);
            dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

            if (dv.Table.Rows.Count == 0)
            {
                TasksLabel.Text = "Search had no results";
            }
            else
            {
                TasksLabel.Text = "";
            }
        }
        catch (Exception exc)
        {
            wt.LogError(exc.Message, "Error in Task Default Page - Search Button Click", Page);
        }
    }

    int volID = 0;
}