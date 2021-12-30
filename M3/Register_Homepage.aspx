<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_Homepage.aspx.cs" Inherits="M3.Register_Homepage" %>

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
            <br />
            Registration<br />
        </div>
        <br />
        <asp:Button ID="student" runat="server" OnClick="StudentRegister" Text="Student" />
         &nbsp
        <asp:Button ID="Supervisor" runat="server" OnClick="SupervisorRegister" Text="Supervisor" />
         &nbsp
        <asp:Button ID="Examiner" runat="server" OnClick="ExaminerRegister" Text="Examiner" />
    </form>
</body>
</html>
