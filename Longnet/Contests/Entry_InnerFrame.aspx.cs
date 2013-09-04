using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;
using HtmlAgilityPack;
using ContestRobot;

namespace Longnet.Contests
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Form.Count == 0 && !Page.IsPostBack
                && !string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                var id = int.Parse(Request.QueryString["id"]);

                // load url from db, display the contest form
                var db = new ContestRobot.DataAccess.contestsEntitiesConnection();

                var contest = from c in db.ContestInfoes
                              where c.ID == id
                              select c;

                CleanAndDisplayForm(contest.FirstOrDefault());
            }
            else if (Request.Form.Count > 0 && !Page.IsPostBack)
            {
                // display/return the posted results
                var values = new Dictionary<string, string>();
                foreach (String s in Request.Form.AllKeys)
                    values.Add(s, Request.Form[s]);

                FormPostValues.DataSource = values;
                FormPostValues.DataBind();

                FormData.Text = Request.Form.ToString();

                pnlConfirm.Visible = true;
                pnlSubmitted.Visible = false;
            }
        }

        private void CleanAndDisplayForm(ContestRobot.DataAccess.ContestInfo contest)
        {
            var html = HTMLHelper.getPage(contest.EntryURL);

            var htmlContest = new HtmlDocument();
            htmlContest.LoadHtml(html);
            var forms = htmlContest.DocumentNode.SelectNodes("//form[@id]");
            foreach (var form in forms)
            {
                form.Attributes["action"].Value = "";
            }

            var stream = new MemoryStream();
            htmlContest.Save(stream);
            stream.Position = 0;
            var sr = new StreamReader(stream);

            Response.Clear();
            Response.Write(sr.ReadToEnd());
            Response.Flush();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            // save
            var db = new ContestRobot.DataAccess.contestsEntitiesConnection();
            var id = int.Parse(Request.QueryString["id"]);
            var contest = (from c in db.ContestInfoes
                           where c.ID == id
                           select c).First();


            var sub = new ContestRobot.DataAccess.SubmissionData
            {
                ContestInfo = contest,
                FormData = FormData.Text,
                User = Page.User.Identity.Name,
                Created = DateTime.Now
            };

            db.AddToSubmissionDatas(sub);
            db.SaveChanges();

            pnlConfirm.Visible = false;
            pnlSubmitted.Visible = true;
        }
    }
}