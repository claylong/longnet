<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Participate.aspx.cs" Inherits="Longnet.Contests.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        html, body { height: 100% }
        iframe {
            border: 2px dashed red; width: 115%;
            -moz-transform: scale(0.85, 0.85); 
            -webkit-transform: scale(0.85, 0.85); 
            -o-transform: scale(0.85, 0.85);
            -ms-transform: scale(0.85, 0.85);
            transform: scale(0.85, 0.85); 
            -moz-transform-origin: top left;
            -webkit-transform-origin: top left;
            -o-transform-origin: top left;
            -ms-transform-origin: top left;
            transform-origin: top left;
            border: solid #ccc 10px;
        }
    </style>
    <script language="javascript">
        function getDocHeight(doc) {
            doc = doc || document;
            // stackoverflow.com/questions/...
            var body = doc.body, html = doc.documentElement;
            var height = Math.max(body.scrollHeight, body.offsetHeight,
                html.clientHeight, html.scrollHeight, html.offsetHeight);
            return height;
        }

        function setIframeHeight(id) {
            var ifrm = document.getElementById(id);
            var doc = ifrm.contentDocument ? ifrm.contentDocument :
                ifrm.contentWindow.document;
            ifrm.style.visibility = 'hidden';
            ifrm.style.height = "10px"; // reset to minimal height ...
            // IE opt. for bing/msn needs a bit added or scrollbar appears
            ifrm.style.height = getDocHeight(doc) + 20 + "px";
            ifrm.style.visibility = 'visible';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Enter Information</h1>
    <p>Use the form below to enter your information for the contest.  The information you provide will be stored locally on the
    Longnet server, and submitted to the contest host at periodic intervals.</p>
    <p>Use the contest's normal submit button to trigger the capture of your entry data.</p>
    <iframe id="iframe1" height="600" runat="server" />
</asp:Content>
