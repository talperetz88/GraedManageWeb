<%@ Control Language="C#" AutoEventWireup="true" CodeFile="header.ascx.cs" Inherits="controller_header" %>
<style type="text/css">
    .auto-style1 {
        width: 1200px;
        height: 160px;
    }
</style>

<p>
    <img alt="baner" class="auto-style1" src="../image/webBanner.png" /></p>

<asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Home.aspx" Font-Bold="True" Font-Size="Medium" ForeColor="Black">דף הבית</asp:HyperLink>
&nbsp;|&nbsp;
<asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/logout.aspx" Font-Bold="True" Font-Size="Medium" ForeColor="Black">יציאה</asp:HyperLink>


