using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["useremail"] == null)
        {

        }
        else
        {
            Label2.Text = Session["useremail"].ToString();
        }
    }

    protected void myCourses_Click(object sender, EventArgs e)
    {
        string username = (String)Session["useremail"];
        string url = "myCourses.aspx?pr_email=" +username;
        Response.Redirect(url);
    }

    protected void avGrade_Click(object sender, EventArgs e)
    {
        string username = (String)Session["useremail"];
        string url = "avarageScore.aspx?pr_email=" + username;
        Response.Redirect(url);
    }

}