<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Main.aspx.cs" Inherits="M3.Student_Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <div style='float:left'>
    <form id="buttons" runat="server">
        <div>
            <asp:Button ID="Profile" runat="server" Text="View Profile" OnClick="Profile_Click" />
            <asp:Button ID="Theses" runat="server" Text="List Theses" OnClick="Theses_Click" />
            <asp:Button ID="Grades" runat="server" Text="List Grades" OnClick="Grades_Click" />
            <asp:Button ID="pReport" runat="server" Text="Add Progress Report" OnClick="pReport_Click" />
            <asp:Button ID="Publication" runat="server" Text="Add Publication" OnClick="Publication_Click" />
        </div>
    </form>
    </div>
    <div style='float:right'>
        <form>
        </form>
    </div>
</body>
</html>
