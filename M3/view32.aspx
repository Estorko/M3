<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view32.aspx.cs" Inherits="milestone3.view32" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server" >
     <style>
         Table1 {
            width: 700px;
            border-collapse : collapse; 
            position:center;
            margin:auto;
            border-block-color : gray ;
            border-block-width : initial ;
           
        }
        #Table1, .td {
            border: 2px solid black;
           
        }
        .td {
            padding: 15px; 
            text-align: left;
            background-color: aqua;
            color: white;
            font-size: 200%;
            position:center;
            margin:auto;
            border-spacing : initial ;
            height :max-content;
           
           
        }
     </style>
   
    <title></title>
</head > 
<body>
    <form id="form1" runat="server">
    <asp:Table ID="Table1" runat="server"  CellPadding="2"
            CellSpacing="25" Height="15px" BorderWidth="5" BackColor =" Gray"
              
                >
                <asp:TableHeaderRow
                    runat="server" 
                ForeColor="Snow"
                BackColor="YellowGreen"
                Font-Bold="true">
                    <asp:TableHeaderCell CssClass="sn" Text=" ID">

                    </asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="f" Text="Title">

                    </asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="f" Text="Date Of Publication">

                    </asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="f" Text="Place">

                    </asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="f" Text="Accepted">

                    </asp:TableHeaderCell>
                    <asp:TableHeaderCell CssClass="f" Text="Host">

                    </asp:TableHeaderCell>
                 
                    
                  
                      
                 
                </asp:TableHeaderRow>
                    
            </asp:Table>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="Button2" runat="server" Text="Back to Home " Width="224px" OnClick="Button2_Click" Font-Bold="true"
            ForeColor="#003399"
            Font-Names="Monaco" font-size="Large" Height="68px" />
        </p>
    </form>
    </body>
</html>