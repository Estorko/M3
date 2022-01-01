<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FillProgressReport.aspx.cs" Inherits="M3.FillProgressReport" %>

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
            <label>Date </label>
            <asp:TextBox ID="PrDate" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Report Number</label>
            <asp:TextBox ID="Rnumber" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>State</label>
            <asp:TextBox ID="state" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Description</label>
            <asp:TextBox ID="description" runat="server"></asp:TextBox>
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
