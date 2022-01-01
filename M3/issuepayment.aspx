<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issuepayment.aspx.cs" Inherits="M3.issuepayment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="payment id"></asp:Label>
        </div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="Label2" runat="server" Text="date"></asp:Label>
        <br />
          

        <asp:TextBox ID="TextBox2" runat="server"
            Text='<%# Bind("DateofBirth", "{0:yyyy-MM-dd}") %>' TextMode="Date"></asp:TextBox>
          

        <br />
        <asp:Button ID="Button1" runat="server" Text="Issue" OnClick="Button1_Click" />

    </form>
</body>
</html>
