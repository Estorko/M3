<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register_Examiner.aspx.cs" Inherits="M3.Register_Examiner" %>

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
            <asp:TextBox ID="Password" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Field of Work</label>
            <asp:TextBox ID="fieldOfWork" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>Email</label>
            <asp:TextBox ID="Email" runat="server"></asp:TextBox>
            <br />
            <br />
            <label>National ?</label>
            <asp:RadioButton ID="Yes" GroupName="isNational" runat="server" Text="Yes"/>
            <asp:RadioButton ID="No"  GroupName="isNational" runat="server" Text="No"/>
        </div>
         <br />
            <br />
        <asp:Button ID="Submit" runat="server" OnClick="Register" Text="Submit" />
        <p>
            <asp:Label ID="Result" runat="server" Text=""></asp:Label>
        </p>
    </form>
</body>
</html>
