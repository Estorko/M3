<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Main.aspx.cs" Inherits="M3.Student_Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Output {
            width: 1151px;
            margin-left: 48px;
            margin-top: 39px;
        }
    </style>
 </head>
<body>
    <form id="Output" runat="server">
        <div style="float:right">
            <asp:Button ID="Theses" runat="server" Text="List Theses" OnClick="Theses_Click" />
            <br />
            <asp:Button ID="View_Profile" runat="server" Text="View Profile" OnClick="Profile_Click" />
            <br />
            <asp:Button ID="Grades" runat="server" Text="List Grades" OnClick="Grades_Click" />
            <br />
            <asp:Button ID="pReport" runat="server" Text="Add Progress Report" OnClick="pReport_Click" />
            <br />
            <asp:Button ID="Publication" runat="server" Text="Add Publication" OnClick="Publication_Click"/>
        </div>
    </form>
    </body>
</html>
