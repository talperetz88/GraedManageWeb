<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AvarageScore.aspx.cs" Inherits="gradeEnterView" %>

<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>

<!DOCTYPE html>

<html lang="he">
<head runat="server">
    <meta charset="utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style2 {
            text-decoration: underline;
        }
    </style>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
        <webBannerControl:header runat="server" ID="header" />
    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString1 %>" DeleteCommand="DELETE FROM [section] WHERE [sec_id] = @sec_id AND [cours_id] = @cours_id" InsertCommand="INSERT INTO [section] ([sec_id], [cours_id], [pr_id]) VALUES (@sec_id, @cours_id, @pr_id)" ProviderName="<%$ ConnectionStrings:projectConnectionString1.ProviderName %>" SelectCommand="SELECT section.cours_id, section.pr_id, courses.name, profesor.pr_fname + ' ' + profesor.pr_lname AS Expr1 FROM section INNER JOIN courses ON section.cours_id = courses.cours_id INNER JOIN profesor ON section.pr_id = profesor.pr_id" UpdateCommand="UPDATE [section] SET [pr_id] = @pr_id WHERE [sec_id] = @sec_id AND [cours_id] = @cours_id">
            <DeleteParameters>
                <asp:Parameter Name="sec_id" Type="Int32" />
                <asp:Parameter Name="cours_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="sec_id" Type="Int32" />
                <asp:Parameter Name="cours_id" Type="Int32" />
                <asp:Parameter Name="pr_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="pr_id" Type="Int32" />
                <asp:Parameter Name="sec_id" Type="Int32" />
                <asp:Parameter Name="cours_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <span class="auto-style2"><strong>
        <h2>בחר קורס להצגה</h2>
        </strong></span>
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="cours_id">
        </asp:DropDownList>
        <br />
        <br />
        <br />
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None" Height="241px" Width="587px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="cours_id" HeaderText="קוד קורס" SortExpression="cours_id" />
                <asp:BoundField DataField="name" HeaderText="שם קורס" SortExpression="name" />
                <asp:BoundField DataField="year" HeaderText="שנה" SortExpression="year" />
                <asp:BoundField DataField="samester" HeaderText="סמסטר" SortExpression="samester" />
                <asp:BoundField DataField="Expr1" HeaderText="ממוצע ציונים" ReadOnly="True" SortExpression="Expr1" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString1 %>" DeleteCommand="DELETE FROM [grades] WHERE [st_id] = @st_id AND [cours_id] = @cours_id" InsertCommand="INSERT INTO [grades] ([st_id], [cours_id], [lab1], [lab2], [lab3], [test], [final]) VALUES (@st_id, @cours_id, @lab1, @lab2, @lab3, @test, @final)" ProviderName="<%$ ConnectionStrings:projectConnectionString1.ProviderName %>" SelectCommand="SELECT AVG((grades.lab1 + grades.lab2 + grades.lab3) * 0.3 / 3 + grades.test * 0.7) AS Expr1, courses.name, courses.year, courses.samester, grades.cours_id FROM grades INNER JOIN courses ON grades.cours_id = courses.cours_id INNER JOIN courseForStudent ON grades.st_id = courseForStudent.st_id AND grades.cours_id = courseForStudent.cours_id AND courses.cours_id = courseForStudent.cours_id INNER JOIN section ON courseForStudent.sec_id = section.sec_id AND courseForStudent.cours_id = section.cours_id INNER JOIN profesor ON section.pr_id = profesor.pr_id GROUP BY grades.cours_id, courses.name, courses.year, courses.samester, profesor.pr_email HAVING (grades.cours_id = @cours_id) AND (profesor.pr_email = @pr_email)" UpdateCommand="UPDATE [grades] SET [lab1] = @lab1, [lab2] = @lab2, [lab3] = @lab3, [test] = @test, [final] = @final WHERE [st_id] = @st_id AND [cours_id] = @cours_id">
            <SelectParameters>
                <asp:QueryStringParameter Name="pr_email" QueryStringField="pr_email" Type="string" />
                <asp:ControlParameter ControlID="DropDownList2" Name="cours_id" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="lab1" Type="Int32" />
                <asp:Parameter Name="lab2" Type="Int32" />
                <asp:Parameter Name="lab3" Type="Int32" />
                <asp:Parameter Name="test" Type="Int32" />
                <asp:Parameter Name="final" Type="Int32" />
                <asp:Parameter Name="st_id" Type="Int32" />
                <asp:Parameter Name="cours_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString1 %>" DeleteCommand="DELETE FROM [section] WHERE [sec_id] = @sec_id AND [cours_id] = @cours_id" InsertCommand="INSERT INTO [section] ([sec_id], [cours_id], [pr_id]) VALUES (@sec_id, @cours_id, @pr_id)" ProviderName="<%$ ConnectionStrings:projectConnectionString1.ProviderName %>" SelectCommand="SELECT section.cours_id, section.pr_id, courses.name, profesor.pr_fname + ' ' + profesor.pr_lname AS Expr1, courses.year, courses.samester FROM section INNER JOIN courses ON section.cours_id = courses.cours_id INNER JOIN profesor ON section.pr_id = profesor.pr_id" UpdateCommand="UPDATE [section] SET [pr_id] = @pr_id WHERE [sec_id] = @sec_id AND [cours_id] = @cours_id">
            <DeleteParameters>
                <asp:Parameter Name="sec_id" Type="Int32" />
                <asp:Parameter Name="cours_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="sec_id" Type="Int32" />
                <asp:Parameter Name="cours_id" Type="Int32" />
                <asp:Parameter Name="pr_id" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="pr_id" Type="Int32" />
                <asp:Parameter Name="sec_id" Type="Int32" />
                <asp:Parameter Name="cours_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
    
    </div>
    </form>
</body>
</html>
