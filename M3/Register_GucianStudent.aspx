﻿<%@ Page AutoEventWireup="true" CodeBehind="Register_GucianStudent.aspx.cs" Inherits="M3.Register_GucianStudent" Language="C#"%>

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
        <div>
            Please fill the data:<br />
            <br />
            <label>First Name</label>
            <asp:TextBox ID="FName" runat="server" ></asp:TextBox>
            <br />
            <br />
            <label>Last Name</label>
            <asp:TextBox ID="LName" runat="server" ></asp:TextBox>
            <br />
            <br />
            <label>Password</label>
            <asp:TextBox ID="Password" runat="server" ></asp:TextBox>
            <br />
            <br />
            <label>Faculty</label>
            <asp:TextBox ID="Faculty" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Email</label>
            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Address</label>
            <asp:TextBox ID="Address" runat="server"></asp:TextBox>
            <br />
            <br />
        </div>
        <asp:Button ID="Submit" runat="server" OnClick="Register" Text="Submit" />
        <p>
            <asp:Label ID="Response" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>
