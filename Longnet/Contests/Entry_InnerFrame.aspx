<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Entry_InnerFrame.aspx.cs" Inherits="Longnet.Contests.WebForm3" %>
<html>
    <head>
        <title>Entry Form</title>
    </head>
    <body>
        <form runat="server">
            <asp:Panel runat="server" ID="pnlConfirm">
                <h2>Confirm Submission</h2>
                <asp:GridView ID="FormPostValues" runat="server"></asp:GridView>
                <asp:TextBox ID="FormData" runat="server" TextMode="MultiLine" Visible="False"></asp:TextBox>
                <br/>
                <asp:Button runat="server" ID="btnConfirm" Text="Confirm" 
                    onclick="btnConfirm_Click"></asp:Button>
            </asp:Panel>
            <asp:Panel runat="server" ID="pnlSubmitted">
                <h2>Submission Saved!</h2>
                <p>You are now setup to automatically participate in the selected contest.  Go back to the Contests page to check on submission status for your contest.  Good luck!</p>
                <%--<p><span style="color: maroon; font-weight: bold">Note: </span> Please do not attempt to participate in the same contest more than once (I can't prevent that yet).</p>--%>
            </asp:Panel>
        </form>
    </body>
</html>