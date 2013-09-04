<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SubmissionSummary.aspx.cs" Inherits="Longnet.Contests.SubmissionSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Submission Status
    </h1>
    <p>This is where you can check up on the submissions made on your behalf by the contest robot.  You should see successful entry records as frequently as the 
    contest rules allow you to enter.</p>
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" 
        AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" 
        PageSize="25" >
        <Columns>
            <asp:BoundField DataField="ContestName" HeaderText="Contest" 
                SortExpression="ContestName" />
            <asp:BoundField DataField="UserName" HeaderText="User" 
                SortExpression="UserName" />
            <asp:BoundField DataField="SubmissionTime" HeaderText="Submission Time" 
                SortExpression="SubmissionTime" />
            <asp:CheckBoxField DataField="IsSuccess" HeaderText="Success" 
                SortExpression="IsSuccess" />
        </Columns>
        <EmptyDataTemplate>
            You currently have no submissions.&nbsp; Make sure you are participating in at least 
            one contest and check back later.
        </EmptyDataTemplate>
    </asp:GridView>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
        SelectMethod="GetResponses" 
        TypeName="ContestRobot.DataAccess.ContestsDataHelpers">
    </asp:ObjectDataSource>
    </asp:Content>
