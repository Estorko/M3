<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddComments.aspx.cs" Inherits="M3.AddComments" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
         Thesis Serial Number<asp:TextBox ID="SerialNo" runat="server" CssClass="auto-style3" OnTextChanged="SerialNo_TextChanged" style="margin-left: 48px">Enter Serial Number</asp:TextBox>
<p>
            Comments<asp:TextBox ID="Comments" runat="server" CssClass="auto-style4" style="margin-left: 41px">Add Comments</asp:TextBox>
        </p>
        <p>
        <asp:Label ID="Label2" runat="server" CssClass="auto-style2" Text="Date"></asp:Label>
        <asp:TextBox ID="Date" runat="server" CssClass="auto-style5" OnTextChanged="Date_TextChanged" style="margin-left: 55px">Enter Date</asp:TextBox>
        </p>
        <p>
        <asp:Button ID="Enter" runat="server" CssClass="auto-style6" Text="Enter" />
        </p>
    </form>
</body>
</html>
