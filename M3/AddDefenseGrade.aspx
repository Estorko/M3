<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDefenseGrade.aspx.cs" Inherits="M3.AddDefenseGrade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            position: absolute;
            top: 97px;
            left: 12px;
            z-index: 1;
        }
        .auto-style2 {
            position: absolute;
            top: 147px;
            left: 15px;
            z-index: 1;
        }
        .auto-style3 {
            position: absolute;
            top: 42px;
            left: 240px;
            z-index: 1;
        }
        .auto-style4 {
            position: absolute;
            top: 94px;
            left: 242px;
            z-index: 1;
        }
        .auto-style5 {
            position: absolute;
            top: 149px;
            left: 239px;
            z-index: 1;
        }
        .auto-style6 {
            position: absolute;
            top: 192px;
            left: 14px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>

        </div>
        Thesis Serial Number<asp:Label ID="Label1" runat="server" CssClass="auto-style1" Text="Grade"></asp:Label>
        <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Text="Date"></asp:Label>
        <asp:TextBox ID="SerialNo" runat="server" CssClass="auto-style3">Enter Serial Number</asp:TextBox>
        <asp:TextBox ID="Grade" runat="server" CssClass="auto-style4">Enter Grade</asp:TextBox>
        <asp:TextBox ID="Date" runat="server" CssClass="auto-style5">Enter Date</asp:TextBox>
        <asp:Button ID="Enter" runat="server" CssClass="auto-style6" Text="Enter" />
    </form>
</body>
</html>
