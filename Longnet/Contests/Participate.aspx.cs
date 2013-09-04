using System;
using System.Linq;

namespace Longnet.Contests
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                var id = int.Parse(Request.QueryString["id"]);

                var db = new ContestRobot.DataAccess.contestsEntitiesConnection();
                if (db.SubmissionDatas.Any(s => s.ContestID == id && s.User == Page.User.Identity.Name))
                    Response.Redirect(string.Format("CheckResponses.aspx?ID={0}", id));

                iframe1.Attributes.Add("onload", "setIframeHeight(this.id);");
                iframe1.Attributes["src"] = string.Format("Entry_InnerFrame.aspx?ID={0}", id);
            }
            else
            {
                // error
                throw new ArgumentNullException();
            }
        }
    }
}