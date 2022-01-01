<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Main.aspx.cs" Inherits="M3.Student_Main" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #Output {
            width: 1367px;
            margin-left: 48px;
            margin-top: 39px;
        }
    </style>
 </head>
<body>
    <form id="Output" runat="server">
        <div style="float:left">
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </div>
        <div style="float:left">
            <asp:GridView ID="GridView2" runat="server" Visible="False" OnRowCommand="GridView2_RowCommand" >
                <Columns runat="server"> 
                    <asp:ButtonField ButtonType="Button" runat="server" CommandName="AddP_R" Text="Add Progress Report"/>
                    <asp:ButtonField ButtonType="Button" runat="server" CommandName="AddPub" Text="Add Publication"/>
                </Columns>
            </asp:GridView>
        </div>
        <div style="float:right">
            <asp:Button ID="Theses" runat="server" Text="List Theses" OnClick="Theses_Click" />
            <br />
            <br />
            <asp:Button ID="View_Profile" runat="server" Text="View Profile" OnClick="Profile_Click" />
            <br />
            <br />
            <asp:Button ID="Grades" runat="server" Text="List Grades" OnClick="Grades_Click" />
            <br />
            <br />
            <asp:Button ID="pReport" runat="server" Text="OnGoing Theses" OnClick="pReport_Click" />
        </div>
    </form>
    </body>
</html>
