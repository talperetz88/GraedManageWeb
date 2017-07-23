<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html lang ="he">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 52%;
            height: 153px;
        }
        .auto-style3 {
            width: 400px;
            
        }
        .auto-style5 {
            width: 836px;
            
        }
        .auto-style6 {
            width: 1200px;
            height: 160px;
        }
        .auto-style7 {
            width: 453px;
           
        }
        .auto-style8 {
            width: 453px;
            text-decoration: underline;
        }
    </style>
</head>
<script src="script/jquery-1.10.2.min.js"></script>
<body dir="rtl">
    <form id="form1" runat="server">
    <div>
    
        <img alt="" class="auto-style6" src="image/webBanner.png" /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <table class="auto-style2">
            <tr>
                <td class="auto-style8"><strong>שם משתמש</strong></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtusername" runat="server" Width="200px"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtusername" ErrorMessage="הכנס שם משתמש" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8"><strong>סיסמא</strong></td>
                <td class="auto-style3">
                    <asp:TextBox ID="txtpassword" runat="server" Width="200px" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpassword" ErrorMessage="הכנס סיסמא" ForeColor="#CC0000">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style3">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="כניסה" BackColor="#0066FF" BorderColor="Black" BorderStyle="Double" BorderWidth="5px" Font-Bold="True" ForeColor="#000066" />
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
        </table>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:loginConnectionString1 %>" SelectCommand="SELECT * FROM [login]"></asp:SqlDataSource>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      
    </div>
    </form>
</body>
</html>
