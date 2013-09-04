using System;
using System.Linq;
using System.Net;
using System.IO;
using System.Text.RegularExpressions;
using ContestRobot;
using System.Threading;

namespace Longnet.Contests
{
    public partial class SubmitEntry : System.Web.UI.Page
    {
        private const int SubmissionDelayMaxMins = 5;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                Response.Clear();
                Response.ContentType = "text/plain";

                var db = new ContestRobot.DataAccess.contestsEntitiesConnection();
                var contestID = int.Parse(Request.QueryString["id"]);
                var contest = (from c in db.ContestInfoes
                               where c.ID == contestID
                               select c).First();

                var now = DateTime.Now;
                if (contest.StartDate <= now && contest.EndDate >= now)
                {
                    Random random = new Random();

                    foreach (var sub in contest.SubmissionDatas.OrderBy(s => Guid.NewGuid()))
                    {
                        int randomDelayTime = random.Next(0, SubmissionDelayMaxMins);

                        Thread.Sleep(randomDelayTime * 60 * 1000);

                        var htmlResponse = HTMLHelper.postForm(contest.SubmissionURL, contest.EntryURL, sub.FormData);

                        var success = Regex.Matches(htmlResponse, contest.SuccessPattern).Count > 0;
                        var failure = Regex.Matches(htmlResponse, contest.FailurePattern).Count > 0;

                        var dbResponse = new ContestRobot.DataAccess.Respons
                                             {
                                                 ContestInfo = contest,
                                                 User = sub.User,
                                                 RawResponse = htmlResponse,
                                                 IsSuccess = (success || failure) ? (success && !failure) : (bool?) null,
                                                 Created = DateTime.Now
                                             };

                        db.AddToResponses(dbResponse);
                        db.SaveChanges();

                        Response.Write(string.Format("Contest: {0}, SubmissionID: {1}, User: {2}, ResponseID: {3}, IsSuccess {4} \r\n",
                                                     contest.Name, sub.ID, sub.User, dbResponse.ID, dbResponse.IsSuccess));
                        Response.Flush();
                    }
                }

            }
            else
            {
                // error
                throw new ArgumentNullException();
            }
        }
    }
}