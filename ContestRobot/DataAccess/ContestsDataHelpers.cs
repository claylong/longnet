using System.Collections.Generic;
using System.Linq;
using System;

namespace ContestRobot.DataAccess
{
    public static class ContestsDataHelpers
    {
        private static contestsEntitiesConnection getConnection()
        {
            return new contestsEntitiesConnection();
        }

        public class ResponsesGridResults
        {
            public int ID { get; set; }
            public string ContestName { get; set; }
            public DateTime SubmissionTime { get; set; }
            public bool? IsSuccess { get; set; }
            public string UserName { get; set; }
        }

        public static IEnumerable<ResponsesGridResults> GetResponsesByContestAndUser(int contestID, string user)
        {
            var db = getConnection();

            var results = from r in db.Responses
                          where r.ContestID == contestID
                            && r.User == user
                          select new ResponsesGridResults()
                            {
                                ID = r.ID,
                                ContestName = r.ContestInfo.Name,
                                SubmissionTime = r.Created,
                                IsSuccess = r.IsSuccess
                            };
            // db.ContestInfoes.First(c => c.ID == contestID).Responses.Where(r => r.User == user).Select(r => r);

            return results;
        }

        public static IEnumerable<ResponsesGridResults> GetResponses()
        {
            var db = getConnection();

            var results = from r in db.Responses
                          orderby r.Created descending
                          select new ResponsesGridResults()
                          {
                              ID = r.ID,
                              ContestName = r.ContestInfo.Name,
                              SubmissionTime = r.Created,
                              IsSuccess = r.IsSuccess,
                              UserName = r.User
                          };

            return results.ToList();
        }
    }
}