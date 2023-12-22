<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MemberSignUp.aspx.cs" Inherits="WebApplication.MemberSignUp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .signup-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 550px;
        }

        .signup-header {
            font-size: 24px;
            color: #0056b3;
            text-align: center;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            background-color: #6699FF;
            border-collapse: collapse;
            padding: 15px;
            border-radius: 8px;
        }

        td {
            padding: 10px;
        }
        table {
            width: 100%;
            background-color: #6699FF;
            border-collapse: collapse;
            padding: 15px;
            border-radius: 8px;
        }

        td {
            padding: 10px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin: 6px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .submit-button {
            width: 100%;
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .submit-button:hover {
            background-color: #218838;
        }

        .error-label {
            color: #CC0000;
            text-align: center;
            margin-top: 10px;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="signup-container">
            <h1 class="signup-header">Sign Up for Your New Account</h1>
            <table>
                <tr>
                    <td colspan="2" class="auto-style3"><strong>Sign Up for Your New Account</strong></td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7">
                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="auto-style7">
                        <asp:Image ID="Image1" runat="server" BorderStyle="Double" ImageUrl="~/Captcha.aspx" CssClass="auto-style1" Height="50px" Width="200px" />
                        <asp:TextBox ID="TextBox1" runat="server" Height="22px"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Create Account" CssClass="submit-button" />
                <br />
                <asp:Label ID="errorLabel" runat="server" CssClass="error-label"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

