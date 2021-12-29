<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPhoneNumber.aspx.cs" Inherits="M3.AddPhoneNumber" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        label {
  display:inline-block;
  text-align:left;
  padding-right:40px;
  min-width:100px
  }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
            <label> ID </label>
            <asp:TextBox ID="ID" runat="server"></asp:TextBox>
            <br />
            <br />
            <label> Phone Number</label> <asp:TextBox ID="phoneNumber" runat="server"></asp:TextBox>
         <br />
            <br />
        <asp:Button ID="Submit" runat="server" OnClick="Add" Text="Submit" />
        <p>
            <asp:Label ID="Response" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>
