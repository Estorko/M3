<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view3.aspx.cs" Inherits="milestone3.view3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" Height="38px" Width="193px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:TextBox ID="TextBox2" runat="server" Height="39px" Width="194px" Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:TextBox ID="TextBox3" runat="server" Height="34px" Width="193px"></asp:TextBox>
            <br />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Height="37px" Text="ADD DEFENSE" Width="151px" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
