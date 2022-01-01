<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="M3.Admin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button1" runat="server" Text="view all sup" OnClick="Button1_Click" />
            <br />
            <br />
        </div>
        <asp:Button ID="Button4" runat="server" Text="View all thesis" OnClick="Button4_Click" />
        <br />
        <br />
        <asp:Button ID="Button3" runat="server" Text="View ongoing thesis" OnClick="Button3_Click" />
        <br />
        <br />
        <asp:Button ID="Button5" runat="server" Text="update thesis extention" OnClick="Button5_Click" />
        <br />
        <br />
        <asp:Button ID="Button6" runat="server" Text="issue install payment" OnClick="Button6_Click" />
        <br />
        <br />
        <asp:Button ID="Button7" runat="server" Text="issue thesis payment" OnClick="Button7_Click" />
        <br />
    </form>
</body>
</html>
