<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="Longnet._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome to Longnet!
    </h2>
    <p>
        This is an ASP.Net template site I build just so I could get some features online in a 
        <em>hurry</em>.  Someday I might clean it up, skin it, and make it a proper site.
        In the meantime, please ignore the styling and all the awful Micorsoft touches.
    </p>
    <p>
        In the meantime, check out the new <a runat="server" href="~/Contests/">Contests</a> page!</p>
    <p>
        Some areas of the site will require membership.  Very little information is needed to 
        setup an account, so please don't hesitate.  Information is secured and use only to
        grant access.
    </p>
    <p>
        Enjoy, and please be sure to report problems or bugs.
    </p>
</asp:Content>
