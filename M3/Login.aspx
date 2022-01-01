<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="M3.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
    body {
max-width: max-content;
margin: auto;}
.content {
  max-width: 500px;
  margin: auto;
}
div {text-align: center;}
    </style>

    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
            <br />
            Registration<br />
            </div>
        <br />
        <asp:Button ID="student" runat="server" OnClick="StudentRegister" Text="Student" />
         &nbsp
        <asp:Button ID="Supervisor" runat="server" OnClick="SupervisorRegister" Text="Supervisor" />
         &nbsp
        <asp:Button ID="Examiner" runat="server" OnClick="ExaminerRegister" Text="Examiner" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            Log in<br />
            <br />
            Email<br />
            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            <br />
            Password<br />
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="sign_in" runat="server" OnClick="login" Text="Log in " />
        </div>
    </form>
</body>
</html>
