using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DotNetProject1
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["logInState"] == null)
                Response.Redirect("/Login.aspx");
        }

        protected void Logout(object sender, EventArgs e)
        {
            Session.Remove("logInState");
            Session.Remove("userName");
            Response.Redirect("/Login.aspx");
        }
    }
}