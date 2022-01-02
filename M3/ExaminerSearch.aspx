<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExaminerSearch.aspx.cs" Inherits="M3.ExaminerSearch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <span dir="ltr" role="presentation" style="left: 242.573px; top: 867.543px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(1.02203);">Edit my personal information, my name and fieldOfWork</span></div>
        <asp:Button ID="Button1" runat="server" Height="42px" Text="Edit My Profile" Width="194px" OnClick="edit" />
        <br />
        <span dir="ltr" role="presentation" style="left: 241.243px; top: 915.365px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(0.992057);">List all thesises titles, supervisors, and students names I attended defenses for</span><br />
        <asp:Button ID="Button2" runat="server" Height="50px" Text="List" Width="194px" OnClick="list" />
        <br />
        <span dir="ltr" role="presentation" style="left: 243.9px; top: 963.185px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(0.986342);">Add comments for a defense.</span><br/>
        <asp:Button ID="Button3" runat="server" Height="40px" Text="Comment" Width="194px" OnClick="comment" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <span dir="ltr" role="presentation" style="left: 241.243px; top: 1011.01px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(0.995083);">Add grade for a defense</span><br />
        <asp:Button ID="Button4" runat="server" Height="62px" Text="Add Grade" Width="194px" OnClick="grade" />
        <br />
        <span dir="ltr" role="presentation" style="left: 243.9px; top: 1058.83px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(0.994213);">Search for thesis where the title contains the entered keyword.<br />
        Keyword<br />
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </span><br />
        <asp:Button ID="Button5" runat="server" Height="47px" Text="Search" Width="194px" OnClick="search" />
        <span dir="ltr" role="presentation" style="font-size: 26.5669px; font-family: sans-serif; transform: scaleX(1.02184);">
            <span dir="ltr" role="presentation" style="font-size: 26.5669px; font-family: sans-serif; transform: scaleX(1.01809);">
            <span dir="ltr" role="presentation" style="font-size: 26.5669px; font-family: sans-serif; transform: scaleX(1.02953);">
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
            Sign out<br />
            <asp:Button ID="Button8" runat="server" Height="44px" OnClick="signout" Text="Sign out" Width="221px" />
            </span>
            </span>
            </span>
    </form>
    
  
</body>
</html>>
