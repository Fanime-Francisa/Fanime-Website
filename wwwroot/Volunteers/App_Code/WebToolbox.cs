using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

/// <summary>
/// Helper class for commonly needed tasks
/// </summary>
public class WebToolbox
{
    public WebToolbox() { }

    public string SQLCleanData(string inputSQL)
    {
        if (inputSQL == null)
        {
            return "";
        }
        return inputSQL.Replace("'", "''").Trim();
    }

    public void LogError(string errorMsg, Page pageObj)
    {
        pageObj.Response.Redirect("~/Error.aspx?errormsg=" + pageObj.Server.UrlEncode(errorMsg));
    }

    public void LogError(string errorMsg, string location, Page pageObj)
    {
        pageObj.Response.Redirect("~/Error.aspx?errormsg=" + pageObj.Server.UrlEncode(location + " : " + errorMsg));
    }
}