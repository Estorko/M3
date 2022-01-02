
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view1.aspx.cs" Inherits="milestone3.view1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            enter your id :</div>
        <p>
            <asp:TextBox ID="id" runat="server" Height="53px" Width="200px"></asp:TextBox>

        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button1" runat="server" Height="42px" Text="submit" Width="142px" OnClick="Button1_Click" />
        </p>
    </form>
</body>
</html>
