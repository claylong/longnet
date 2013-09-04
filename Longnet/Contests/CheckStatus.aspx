<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckStatus.aspx.cs" Inherits="Longnet.Contests.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Submission Status
    </h1>
    <p>This is where you can check up on the submissions made on your behalf by the contest robot.  You should see successful entry records as frequently as the 
    contest rules allow you to enter.</p>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" 
        AutoGenerateColumns="False">
        <Columns>
            <asp:BoundField DataField="ContestName" HeaderText="Contest Name" 
                SortExpression="ContestName" />
            <asp:BoundField DataField="SubmissionTime" HeaderText="Submission Time" 
                SortExpression="SubmissionTime" DataFormatString="{0:g}" />
            <asp:BoundField DataField="IsSuccess" HeaderText="Success" 
                SortExpression="IsSuccess" />
        </Columns>
        <EmptyDataTemplate>
            You currently have no submissions.&nbsp; Make sure you are participating in at least 
            one contest and check back later.
        </EmptyDataTemplate>
    </asp:GridView>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetResponsesByContestAndUser" 
        TypeName="ContestRobot.DataAccess.ContestsDataHelpers">
        <SelectParameters>
            <asp:QueryStringParameter Name="contestID" QueryStringField="ID" Type="Int32" />
            <asp:ControlParameter ControlID="txtUsername" Name="user" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <asp:TextBox ID="txtUsername" runat="server" Visible="False"></asp:TextBox>
</asp:Content>
