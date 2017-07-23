<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<%@ Register src="controller/header.ascx" tagname="header" tagprefix="uc1" %>

<!DOCTYPE html>

<html lang="he">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 193px;
            height: 25px;
        }
    </style>
</head>
<body dir="rtl">
    <form id="form1" runat="server" >
        
        <div>
          <uc1:header ID="header1" runat="server" />
        </div>
        <p class="auto-style2">
            <asp:Label ID="Label1" runat="server" Text="שלום" Font-Bold="True" Font-Size="Medium" ForeColor="#0066FF"></asp:Label>
&nbsp;
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="#0066FF"></asp:Label>
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="myCourses" runat="server" Height="64px" Text="הקורסים שלי" Width="248px" OnClick="myCourses_Click" BackColor="#0066FF" BorderColor="Black" BorderStyle="Double" BorderWidth="5px" Font-Bold="True" ForeColor="Black"/>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="avGrade" runat="server" Height="64px" Text="ממוצע ציונים בקורסים" Width="248px" OnClick="avGrade_Click" BackColor="#0066FF" BorderColor="Black" BorderStyle="Double" BorderWidth="5px" Font-Bold="True" ForeColor="Black" />
        </p>
    </form>
</body>
</html>
