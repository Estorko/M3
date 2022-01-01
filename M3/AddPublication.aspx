<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPublication.aspx.cs" Inherits="M3.AddPublication" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
    label {
  display:inline-block;
  text-align:left;
  padding-right:40px;
  min-width:150px
  }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <label>Title</label>
            <asp:TextBox ID="Title" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Date of Publication</label>
            <asp:TextBox ID="PubDate" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Host</label>
            <asp:TextBox ID="host" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Place</label>
            <asp:TextBox ID="place" runat="server"></asp:TextBox>
            <br />
            <br />
        </div>
        <asp:Button ID="Submit" runat="server" OnClick="Add" Text="Submit" Height="25px" />
        <p>
            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>
