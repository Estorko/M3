<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Examiner_Main.aspx.cs" Inherits="M3.Examiner_Main" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 72px;
            left: 10px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 72px;
            left: 129px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 71px;
            left: 293px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 31px;
            left: 308px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 70px;
            left: 453px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 69px;
            left: 678px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>

        <asp:Button ID="Edit" runat="server" CssClass="auto-style1" Text="EditInfo" OnClick="Edit_Click" />
        <asp:Button ID="List" runat="server" CssClass="auto-style2" Text="ListTheses" OnClick="List_Click" />
        <asp:Button ID="AddG" runat="server" CssClass="auto-style3" Text="AddGrade" OnClick="AddG_Click" />
        <asp:Label ID="E" runat="server" CssClass="auto-style4" Text="Examiner"></asp:Label>
        <asp:Button ID="AddC" runat="server" CssClass="auto-style5" Text="AddComments" OnClick="AddC_Click" />
        <asp:Button ID="s" runat="server" CssClass="auto-style6" Text="Search" OnClick="search" />
    </form>
</body>
</html>

