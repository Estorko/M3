<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExaminerEditInfo.aspx.cs" Inherits="M3.ExaminerEditInfo" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <span dir="ltr" role="presentation" style="left: 242.573px; top: 867.543px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(1.02203);">Edit my personal information, my name and fieldOfWork<br />
            name; field of work; password; email; isNational<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<span dir="ltr" role="presentation" style="font-size: 23.9102px; font-family: sans-serif; transform: scaleX(1.02203);"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
&nbsp;
            <asp:TextBox ID="TextBox3" TextMode="Password" runat="server"></asp:TextBox>
&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
&nbsp;<span class="" dir="ltr" role="presentation" style="font-size: 26.5669px; font-family: sans-serif; transform: scaleX(0.985889);"><span id="page45R_mcid2" class="markedContent"><asp:ListBox ID="ListBox1" runat="server"  Height="37px" Width="73px">
        <asp:ListItem>False</asp:ListItem>
        <asp:ListItem>True</asp:ListItem>
    </asp:ListBox>
            </span></span></span></span></div>
        <asp:Button ID="Button1" runat="server" Height="42px" Text="Edit My Profile" Width="194px" OnClick="edit" />
        <br />
        <span dir="ltr" role="presentation" style="left: 241.243px; top: 915.365px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(0.992057);">List all thesises titles, supervisors, and students names I attended defenses for</span><br />
        <asp:Button ID="Button2" runat="server" Height="50px" Text="List" Width="194px" OnClick="list" />
        <br />
        <span dir="ltr" role="presentation" style="left: 243.9px; top: 963.185px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(0.986342);">Add comments for a defense.</span><br />
        <asp:Button ID="Button3" runat="server" Height="40px" Text="Comment" Width="194px" OnClick="comment" />
        <br />
        <span dir="ltr" role="presentation" style="left: 241.243px; top: 1011.01px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(0.995083);">Add grade for a defense</span><br />
        <asp:Button ID="Button4" runat="server" Height="62px" Text="Add Grade" Width="194px" OnClick="grade" />
        <br />
        <span dir="ltr" role="presentation" style="left: 243.9px; top: 1058.83px; font-size: 23.9102px; font-family: sans-serif; transform: scaleX(0.994213);">Search for thesis where the title contains the entered keyword.</span><br />
        <asp:Button ID="Button5" runat="server" Height="47px" Text="Search" Width="194px" OnClick="search" />
        <br />
        <span dir="ltr" role="presentation" style="font-size: 26.5669px; font-family: sans-serif; transform: scaleX(1.02184);">
            <span dir="ltr" role="presentation" style="font-size: 26.5669px; font-family: sans-serif; transform: scaleX(1.01809);">
            <span dir="ltr" role="presentation" style="font-size: 26.5669px; font-family: sans-serif; transform: scaleX(1.02953);">Sign out<br />
            <asp:Button ID="Button8" runat="server" Height="44px" OnClick="signout" Text="Sign out" Width="221px" />
            </span>
            </span>
            </span>
    </form>
    
    
</body>
</html>
