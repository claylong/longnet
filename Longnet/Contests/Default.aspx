<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Longnet.Contests.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
                <h1>
                    Contests
                </h1>

                <p>
                    Below is the current list of contests setup in this system.  You may participate in any or all by click on their Participate link and filling out the contest form.  
                    Once complete, you can check the submission status by clicking the Check Status link for the corresponding contest.
                </p>
                
                <p>
                    Remember, this site simply submits contest entries on your behalf.  It does not attempt an endless number of submissions, unless the target contest rules specifically state otherwise.
                </p>

                <br />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                    AllowSorting="True" AutoGenerateColumns="False" 
                    DataKeyNames="ID" DataSourceID="EntityDataSource1" >
                    <Columns>
                        <asp:TemplateField>
                        <ItemTemplate>
                        <asp:HyperLink runat="server" ID="HyperLink1" NavigateUrl='<%# GetActionLinkURL( (int) Eval("ID") ) %>' Text='<%# GetActionLinkText( (int) Eval("ID") ) %>'></asp:HyperLink>
                        </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Name" HeaderText="Contest Name" 
                            SortExpression="Name" />
                        <asp:BoundField DataField="Desc" HeaderText="Desccription" 
                            SortExpression="Desc" />
                        <asp:BoundField DataField="StartDate" HeaderText="Contest Starts" 
                            SortExpression="StartDate" DataFormatString="{0:g}" />
                        <asp:BoundField DataField="EndDate" HeaderText="Contest Ends" 
                            SortExpression="EndDate" DataFormatString="{0:g}" />
                        <asp:HyperLinkField DataNavigateUrlFields="EntryURL" HeaderText="Contest Page" 
                            Text="Official Entry Page" />
                    </Columns>
                    <EmptyDataTemplate>
                        There are currently no contests in which you can participate.
                    </EmptyDataTemplate>
                </asp:GridView>
   
    <asp:EntityDataSource ID="EntityDataSource1" runat="server" 
        ConnectionString="name=contestsEntitiesConnection" 
        DefaultContainerName="contestsEntitiesConnection" EnableDelete="True" 
        EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
        EntitySetName="ContestInfoes">
    </asp:EntityDataSource>
</asp:Content>
