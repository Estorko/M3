

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="suprvisor.aspx.cs" Inherits="milestone3.suprvisor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="Button1" runat="server" Height="39px" Text="view1" Width="160px" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Height="37px" Text="view 3 " Width="152px" OnClick="Button2_Click" />
        &nbsp;&nbsp;&nbsp;<asp:Button ID="Button3" runat="server" Text="view2" Height="40px" OnClick="Button3_Click" Width="104px" />
            &nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button4" runat="server" Text="view33" Height="48px" OnClick="Button4_Click" style="margin-top: 4px" Width="109px" />
            <asp:Button ID="Button5" runat="server" Text="view4" Height="52px" OnClick="Button5_Click" Width="142px" style="margin-top: 24px" />
            <asp:Button ID="Button6" runat="server" Text="view5" Height="50px" OnClick="Button6_Click" Width="111px" />
        </div>
    </form>
</body>
</html>
