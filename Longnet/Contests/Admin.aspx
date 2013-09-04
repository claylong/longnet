<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Longnet.Contests.WebForm1" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server"
        DataSourceID="EntityDataSource1" AutoGenerateColumns="False" 
        DataKeyNames="ID" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Desc" HeaderText="Desc" SortExpression="Desc" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                SortExpression="EndDate" />
            <asp:BoundField DataField="EntryURL" HeaderText="EntryURL" 
                SortExpression="EntryURL" />
            <asp:BoundField DataField="SubmissionURL" HeaderText="SubmissionURL" 
                SortExpression="SubmissionURL" />
            <asp:BoundField DataField="SuccessPattern" HeaderText="SuccessPattern" 
                SortExpression="SuccessPattern" />
            <asp:BoundField DataField="FailurePattern" HeaderText="FailurePattern" 
                SortExpression="FailurePattern" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="EntityDataSource1" Height="50px" Width="125px"
        DefaultMode="Insert">
        <Fields>
            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" 
                SortExpression="ID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Desc" HeaderText="Desc" SortExpression="Desc" />
            <asp:BoundField DataField="StartDate" HeaderText="StartDate" 
                SortExpression="StartDate" />
            <asp:BoundField DataField="EndDate" HeaderText="EndDate" 
                SortExpression="EndDate" />
            <asp:BoundField DataField="EntryURL" HeaderText="EntryURL" 
                SortExpression="EntryURL" />
            <asp:BoundField DataField="SubmissionURL" HeaderText="SubmissionURL" 
                SortExpression="SubmissionURL" />
            <asp:BoundField DataField="SuccessPattern" HeaderText="SuccessPattern" 
                SortExpression="SuccessPattern" />
            <asp:BoundField DataField="FailurePattern" HeaderText="FailurePattern" 
                SortExpression="FailurePattern" />
            <asp:CommandField ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=contestsEntitiesConnection" 
        DefaultContainerName="contestsEntitiesConnection" EnableDelete="True" 
        EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
        EntitySetName="ContestInfoes">
    </asp:EntityDataSource>
</asp:Content>
