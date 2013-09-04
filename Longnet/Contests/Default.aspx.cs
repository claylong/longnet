using System;
using System.Linq;

namespace Longnet.Contests
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected string GetActionLinkText(int id)
        {
            var db = new ContestRobot.DataAccess.contestsEntitiesConnection();

            if (db.SubmissionDatas.Any(s => s.ContestID == id && s.User == Page.User.Identity.Name))
                return "Check Status";

            return "Participate";
        }

        protected string GetActionLinkURL(int id)
        {
            var db = new ContestRobot.DataAccess.contestsEntitiesConnection();

            if (db.SubmissionDatas.Any(s => s.ContestID == id && s.User == Page.User.Identity.Name))
                return string.Format("CheckStatus.aspx?ID={0}", id);

            return string.Format("Participate.aspx?ID={0}", id);
        }
        
    }
}