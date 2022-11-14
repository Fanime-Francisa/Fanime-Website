using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebToolbox wt = new WebToolbox();

        try
        {
            AvailableTasksDataSource.SelectCommand = "SELECT Top(25) TaskID, Description, LocationName, DepartmentName, Day, StartTime, EndTime, Duration, RequiredVolunteers, OptionalVolunteers, PriorityName, AvailableCount, FilledCount, Priority FROM PriorityTasksView WHERE EndTime > dbo.SYSDATE() ORDER BY Priority DESC, StartTime ASC";
            AvailableTasksDataSource.Select(DataSourceSelectArguments.Empty);

            if (!IsPostBack)
            {
                VolDataSource.SelectCommand = "SELECT count(*) as Count FROM Volunteers;";
                DataView dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                VolTotalLabel.Text = dv.Table.Rows[0]["count"].ToString();

                VolDataSource.SelectCommand = "SELECT count(*) as Count FROM TasksView;";
                dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                TotalTasksReqLabel.Text = dv.Table.Rows[0]["count"].ToString();

                VolDataSource.SelectCommand = "SELECT count(*) as Count FROM TasksView WHERE FilledCount >= RequiredVolunteers;";
                dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                TotalTasksFilledLabel.Text = dv.Table.Rows[0]["count"].ToString();

                VolDataSource.SelectCommand = "SELECT count(*) as Count FROM TasksView WHERE cast(StartTime as Date) >= cast(dbo.SYSDATE() as Date) AND cast(StartTime as Date) < cast(DATEADD(day,1,dbo.SYSDATE()) as Date);";
                dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                TodaysTasksReqLabel.Text = dv.Table.Rows[0]["count"].ToString();

                VolDataSource.SelectCommand = "SELECT count(*) as Count FROM TasksView WHERE cast(StartTime as Date) >= cast(dbo.SYSDATE() as Date) AND cast(StartTime as Date) < cast(DATEADD(day,1,dbo.SYSDATE()) as Date) AND FilledCount >= RequiredVolunteers;";
                dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                TodaysTasksFilledLabel.Text = dv.Table.Rows[0]["count"].ToString();

                VolDataSource.SelectCommand = "SELECT count(*) as Count FROM TasksView WHERE cast(StartTime as Date) >= cast(DATEADD(day,1,dbo.SYSDATE()) as Date) AND cast(StartTime as Date) < cast(DATEADD(day,2,dbo.SYSDATE()) as Date);";
                dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                TomorrowsTasksReqLabel.Text = dv.Table.Rows[0]["count"].ToString();

                VolDataSource.SelectCommand = "SELECT count(*) as Count FROM TasksView WHERE cast(StartTime as Date) >= cast(DATEADD(day,1,dbo.SYSDATE()) as Date) AND cast(StartTime as Date) < cast(DATEADD(day,2,dbo.SYSDATE()) as Date) AND FilledCount >= RequiredVolunteers;";
                dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

                TomorrowsTasksFilledLabel.Text = dv.Table.Rows[0]["count"].ToString();
            }
        }
        catch (Exception exc)
        {
            wt.LogError(exc.Message, "Error in Default Home Page - Page Load", Page);
        }
    }
}
