<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberLogin.aspx.cs" Inherits="WebApplication.MemberLogin" %>

<%--<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Login</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
        }

        .login-header {
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
        }

        .login {
            padding: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .signup-section {
            margin-top: 20px;
        }

        .signup-section span {
            font-size: 16px;
            color: #666;
        }

        .signup-button {
            background-color: #0056b3;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            display: inline-block;
        }

        .signup-button:hover {
            background-color: #004095;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h1 class="login-header">Member Login</h1>

            <div class="login">
                <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" Font-Names="Verdana" Font-Size="10pt">
                    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                </asp:Login>
            </div>

            <div class="signup-section">
                <span>No Account Yet?</span><br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sign Up" CssClass="signup-button" />
            </div>
        </div>
    </form>
</body>
</html>--%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Member Login</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            width: 400px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
            text-align: center;
        }

        .login-header {
            font-size: 24px;
            color: #333;
            margin-bottom: 30px;
        }

        .login {
            padding: 15px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
        }

        .signup-section {
            margin-top: 20px;
        }

        .signup-section span {
            font-size: 16px;
            color: #666;
        }

        .signup-button {
            background-color: #0056b3;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            display: inline-block;
        }

        .signup-button:hover {
            background-color: #004095;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h1 class="login-header">Member Login</h1>

            <div class="login">
                <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" Font-Names="Verdana" Font-Size="10pt">
                    <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                </asp:Login>
            </div>

            <div class="signup-section">
                <span>No Account Yet?</span><br />
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Sign Up" CssClass="signup-button" />
            </div>
        </div>
    </form>
</body>
</html>