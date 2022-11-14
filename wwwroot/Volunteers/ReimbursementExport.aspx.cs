using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ReimbursementExport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv;
        WebToolbox wt = new WebToolbox();

        try
        {
            VolDataSource.SelectCommand = "SELECT FirstName, LastName, BadgeID, Address, City, State, Zip, Email, Phone, Mobile, StaffID, BadgeType, Comments" +
                                          " FROM ReimbursementView;";

            dv = (DataView)VolDataSource.Select(DataSourceSelectArguments.Empty);

            ExportLabel.Text = "First Name, Last Name, Badge ID, Address, City, State, Zip, Email, Phone, Mobile, Staff ID, Badge Type, Comments<br>";

            for (int ndx = 0; ndx < dv.Count; ndx++)
            {
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["FirstName"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["LastName"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["BadgeID"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["Address"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["City"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["State"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["Zip"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["Email"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["Phone"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["Mobile"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["StaffID"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["BadgeType"]) + "\",";
                ExportLabel.Text = ExportLabel.Text + "\"" + Convert.ToString(dv.Table.Rows[ndx]["Comments"]) + "\"";
                ExportLabel.Text = ExportLabel.Text + "<br>";
            }
        }
        catch (Exception exc)
        {
            wt.LogError(exc.Message, "Error in Reimbursement Export Page - Page Load", Page);
        }
    }
}