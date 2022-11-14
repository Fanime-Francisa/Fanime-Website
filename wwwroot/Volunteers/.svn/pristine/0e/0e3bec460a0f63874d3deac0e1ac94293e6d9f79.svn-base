using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class VolunteersDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebToolbox wt = new WebToolbox();

        if (Request.QueryString["TaskID"] != null && Request.QueryString["TaskID"] != "")
        {
            taskID = wt.SQLCleanData(Request.QueryString["TaskID"]);
        }
    }

    protected void AddNewVolunteerBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("VolunteerInformation.aspx");
    }

    protected void VolunteersGridView_RowCommand(Object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Select")
        {
            int index = Convert.ToInt32(e.CommandArgument);
            string volunteerID = VolunteersGridView.DataKeys[index].Value.ToString();
            Response.Redirect("VolunteerDetails.aspx?volID=" + volunteerID + "&taskID=" + taskID);
        }
    }

    protected void VolunteersSearchBtn_Click(object sender, EventArgs e)
    {
        WebToolbox wt = new WebToolbox();
        DataView dv;

        try
        {
            VolDataSource.SelectCommand = "SELECT [VolunteerID], [FirstName], [LastName], [BadgeID]" +
                                          " FROM [Volunteers]" +
                                          " WHERE FirstName like '%" + wt.SQLCleanData(FirstNameTxt.Text) + "%'" +
                                          " AND LastName like '%" + wt.SQLCleanData(LastNameTxt.Text) + "%'" +
                                          " AND BadgeID like '%" + wt.SQLCleanData(BadgeIDTxt.Text) + "%'" +
                                          " ORDER BY [LastName], [FirstName]";
            VolDataSource.Select(DataSourceSelectArguments.Empty);
        }
        catch (Exception exc)
        {
            wt.LogError(exc.Message, "Error in Volunteer Default Page - Volunteer Search", Page);
        }
        dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

        if (dv.Table.Rows.Count == 0)
        {
            VolunteersLabel.Text = "Search had no results";
        }
        else if (dv.Table.Rows.Count == 1)
        {
            string volunteerID = dv.Table.Rows[0]["VolunteerID"].ToString();
            if (taskID.Length > 0)
            {
                Response.Redirect("VolunteerDetails.aspx?volID=" + volunteerID + "&taskID=" + taskID);
            }
            else
            {
                Response.Redirect("VolunteerDetails.aspx?volID=" + volunteerID);
            }
        }
        else
        {
            VolunteersLabel.Text = "";
        }
    }

    private string taskID = "";
}