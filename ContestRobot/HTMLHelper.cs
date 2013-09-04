using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;
using System.Net;

namespace ContestRobot
{
    public static class HTMLHelper
    {
        public static string getPage(string url)
        {
            String result = "";
            Stream objStream;

            var objRequest = (HttpWebRequest)WebRequest.Create(url);
            objRequest.ContentType = "text/xml";
            objRequest.UserAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.13 (KHTML, like Gecko) Chrome/24.0.1284.0 Safari/537.13";

            try
            {
                objStream = objRequest.GetResponse().GetResponseStream();
            }
            catch (Exception e)
            {
                return e.Message;
            }

            try
            {
                using (StreamReader sr = new StreamReader(objStream))
                {
                    result = sr.ReadToEnd();
                    sr.Close();
                }
            }
            catch (Exception e)
            {
                return e.Message;
            }

            return result;
        }

        public static string postForm(string url, string referer, string formData)
        {
            String result = "";
            StreamWriter myWriter = null;

            HttpWebRequest objRequest = (HttpWebRequest)WebRequest.Create(url);
            objRequest.Method = "POST";
            objRequest.ContentLength = formData.Length;
            objRequest.ContentType = "application/x-www-form-urlencoded";
            objRequest.Referer = referer;
            objRequest.UserAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.13 (KHTML, like Gecko) Chrome/24.0.1284.0 Safari/537.13";

            try
            {
                myWriter = new StreamWriter(objRequest.GetRequestStream());
                myWriter.Write(formData);
            }
            catch (Exception e)
            {
                return e.Message;
            }
            finally
            {
                if (myWriter != null)
                {
                    myWriter.Close();
                }
            }

            try
            {
                HttpWebResponse objResponse = (HttpWebResponse)objRequest.GetResponse();
                using (StreamReader sr = new StreamReader(objResponse.GetResponseStream()))
                {
                    result = sr.ReadToEnd();
                    sr.Close();
                }
            }
            catch (Exception e)
            {
                return e.Message;
            }

            return result;
        }
    }
}
