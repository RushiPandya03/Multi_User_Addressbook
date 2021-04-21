using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Content_AdminPanel : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            if (Session["DisplayName"] != null)
                lblUserName.Text = "Hii..." + Session["DisplayName"].ToString().Trim();
        }
    }

    protected void hlbtnLogout_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Content/AdminPanel/Login.aspx");
    }
}
