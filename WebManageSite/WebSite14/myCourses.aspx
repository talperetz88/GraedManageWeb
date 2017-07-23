<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myCourses.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html lang="he">
<head runat="server">
    <meta charset="utf-8" /> 
    <title></title>
</head>
<body dir="rtl">
    <form id="form1" runat="server">
        <webBannerControl:header runat="server" ID="header" />
        
    <div>
        
        <br />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" AllowPaging="True" Height="370px" Width="584px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="cours_id" HeaderText="קוד קורס" SortExpression="cours_id" />
                <asp:BoundField DataField="name" HeaderText="שם קורס" SortExpression="name" />
                <asp:BoundField DataField="pr_id" HeaderText="ת.ז מרצה" SortExpression="pr_id" />
                <asp:BoundField DataField="Expr1" HeaderText="שם מרצה" ReadOnly="True" SortExpression="Expr1" />
                <asp:HyperLinkField DataNavigateUrlFields="cours_id" DataNavigateUrlFormatString="~/Grades.aspx?cours_id={0}" Text="עדכן ציון" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString1 %>" DeleteCommand="DELETE FROM [section] WHERE [sec_id] = @sec_id AND [cours_id] = @cours_id" InsertCommand="INSERT INTO [section] ([sec_id], [cours_id], [pr_id]) VALUES (@sec_id, @cours_id, @pr_id)" ProviderName="<%$ ConnectionStrings:projectConnectionString1.ProviderName %>" SelectCommand="SELECT section.cours_id, section.pr_id, courses.name, profesor.pr_fname + ' ' + profesor.pr_lname AS Expr1 FROM section INNER JOIN courses ON section.cours_id = courses.cours_id INNER JOIN profesor ON section.pr_id = profesor.pr_id WHERE (profesor.pr_email = @pr_email)" UpdateCommand="UPDATE [section] SET [pr_id] = @pr_id WHERE [sec_id] = @sec_id AND [cours_id] = @cours_id">
          <SelectParameters>
          <asp:QueryStringParameter Name="pr_email" QueryStringField="pr_email" Type="string" />
          </SelectParameters>
             <UpdateParameters>
                <asp:Parameter Name="pr_id" Type="Int32" />
                <asp:Parameter Name="sec_id" Type="Int32" />
                <asp:Parameter Name="cours_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
