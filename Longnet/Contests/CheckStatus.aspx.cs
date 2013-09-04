using System;

namespace Longnet.Contests
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtUsername.Text = Page.User.Identity.Name;
        }
    }
}