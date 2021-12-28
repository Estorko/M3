<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Log in<br />
            <br />
            Email<br />
            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            <br />
            Password<br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
        </div>
        <asp:Button ID="sign_in" runat="server" OnClick="login" Text="Log in " />
    </form>
</body>
</html>
