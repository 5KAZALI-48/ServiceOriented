<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
       p.staffLogin {
           line-height: 2.0;
       }
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            margin-left: 120px;
        }
        .auto-style4 {
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div text-align: left class="auto-style1">
            <div class="auto-style2">
                <p class="auto-style3">
                    <strong><span class="auto-style4">Staff Login Page
            </span></strong>
            <br />
                </p>
            </div>
            <p class="staffLogin" style="text-align: center">
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp <asp:Label ID="lbl_Login" runat="server" Text="Log In"></asp:Label>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_username" runat="server" Text="Username: "></asp:Label> &nbsp
                <asp:TextBox ID="txt_username" runat="server" Width="240px" BorderColor="Black" BorderWidth="1px" style="margin-left: 6px"></asp:TextBox>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_password" runat="server" Text="Password: "></asp:Label> &nbsp
                <asp:TextBox ID="txt_password" runat="server" Width="241px" BorderColor="Black" BorderWidth="1px" style="margin-left: 8px" TextMode="Password"></asp:TextBox>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbl_remember" runat="server" Text="Remember Me"></asp:Label>
                &nbsp
                <asp:CheckBox ID="checkBox_remember" runat="server" />
                &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp</p>
            <p class="staffLogin" style="text-align: center; margin-left: 40px">
                &nbsp;&nbsp &nbsp
                <asp:Button ID="bttn_Login" runat="server" Text="Log In" OnClick="bttn_Login_Click" />
                <br />
            </p>
        </div>
        <asp:Label ID="lbl_errors" runat="server" BorderColor="White" BorderWidth="4px"></asp:Label>
    </form>
</body>
</html>
