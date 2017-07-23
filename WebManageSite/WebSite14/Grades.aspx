<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Grades.aspx.cs" Inherits="Grades" %>

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
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="st_id,cours_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display." ForeColor="#333333" GridLines="None" Height="238px" Width="830px">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="st_id" HeaderText="ת.ז סטודנט" ReadOnly="True" SortExpression="st_id" />
                <asp:BoundField DataField="cours_id" HeaderText="קוד קורס" ReadOnly="True" SortExpression="cours_id" />
                <asp:BoundField DataField="name" HeaderText="שם קורס" SortExpression="name" ReadOnly="True" />
                <asp:BoundField DataField="lab1" HeaderText="ציון מעבדה 1" SortExpression="lab1" />
                <asp:BoundField DataField="lab2" HeaderText="ציון מעבדה 2" SortExpression="lab2" />
                <asp:BoundField DataField="lab3" HeaderText="ציון מעבדה 3" SortExpression="lab3" />
                <asp:BoundField DataField="test" HeaderText="ציון מבחן" SortExpression="test" />
                <asp:BoundField DataField="Expr1" HeaderText="ציון סופי" SortExpression="Expr1" ReadOnly="True" />
                <asp:CommandField EditText="עדכן ציון" ShowEditButton="True" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString1 %>" DeleteCommand="DELETE FROM [grades] WHERE [st_id] = @st_id AND [cours_id] = @cours_id" InsertCommand="INSERT INTO [grades] ([st_id], [cours_id], [lab1], [lab2], [lab3], [test], [final]) VALUES (@st_id, @cours_id, @lab1, @lab2, @lab3, @test, @final)" ProviderName="<%$ ConnectionStrings:projectConnectionString1.ProviderName %>" SelectCommand="SELECT grades.st_id, grades.cours_id, grades.lab1, grades.lab2, grades.lab3, grades.test, (grades.lab1 + grades.lab2 + grades.lab3) / 3 * 0.3 + grades.test * 0.7 AS Expr1, courses.name FROM grades INNER JOIN courses ON grades.cours_id = courses.cours_id WHERE (grades.cours_id = @cours_id)" UpdateCommand="UPDATE [grades] SET [lab1] = @lab1, [lab2] = @lab2, [lab3] = @lab3, [test] = @test, [final] = @final WHERE [st_id] = @st_id AND [cours_id] = @cours_id">
          <SelectParameters>
          <asp:QueryStringParameter Name="cours_id" QueryStringField="cours_id" Type="Int32" />
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
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:projectConnectionString1 %>" DeleteCommand="DELETE FROM [grades] WHERE [st_id] = @st_id AND [cours_id] = @cours_id" InsertCommand="INSERT INTO [grades] ([st_id], [cours_id], [lab1], [lab2], [lab3], [test], [final]) VALUES (@st_id, @cours_id, @lab1, @lab2, @lab3, @test, @final)" ProviderName="<%$ ConnectionStrings:projectConnectionString1.ProviderName %>" SelectCommand="SELECT grades.st_id, grades.cours_id, (grades.lab1 + grades.lab2 + grades.lab3) / 3 * 0.3 + grades.test * 0.7 AS Expr1, grades.final, courses.name FROM grades INNER JOIN courses ON grades.cours_id = courses.cours_id WHERE (grades.cours_id = @cours_id)" UpdateCommand="UPDATE [grades] SET [lab1] = @lab1, [lab2] = @lab2, [lab3] = @lab3, [test] = @test, [final] = @final WHERE [st_id] = @st_id AND [cours_id] = @cours_id">
          <SelectParameters>
          <asp:QueryStringParameter Name="cours_id" QueryStringField="cours_id" Type="Int32" />
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
    
    </div>
    </form>
</body>
</html>
