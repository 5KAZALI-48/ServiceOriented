<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FarukServiceTryIt.aspx.cs" Inherits="WebApplication.FarukServiceTryIt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Faruk's Service Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }

        .header {
            color: #007bff;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .btn {
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

            .btn:hover {
                background-color: #218838;
            }

        .info {
            margin-top: 20px;
            padding: 10px;
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .auto-style1 {
            margin-top: 20px;
            padding: 10px;
            background-color: #f2f2f2;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div class="container">
            <h1 class="header">
                <asp:Label ID="Label2" runat="server" Text="Faruk`s Page"></asp:Label>
            </h1>

            <h3>Find the Nearest Store Service</h3>
            <h4>Returns store address and details using the given ZIP code and store name. Uses existing Google Maps API.</h4>
            <div class="form-group">
                <label>Enter a valid ZIP code:</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Enter a store name:</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="Button1" runat="server" CssClass="btn" OnClick="btn_submit2_Click" Text="Submit" />
            </div>
            <div>
                <asp:Image ID="Image1" runat="server" />
            </div>
            <div class="info">
                <asp:Label ID="Label3" runat="server"></asp:Label>
            </div>

            <asp:Label ID="Label4" runat="server" ForeColor="Red" Height="18px"></asp:Label>
            <br />
            <br />
            <div class="stock-price">
                <h1>STOCK PRICE</h1>
                <div class="form-group">
                    <label>Enter Your Ticker Here:</label>
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" CssClass="btn" OnClick="Button_GetPrice_Click" Text="Get Price" />
                </div>
                <div class="info">
                    <asp:Label ID="Label5" runat="server" Text="Price"></asp:Label>
                </div>
                <div class="auto-style1">
                    <asp:Label ID="Label6" runat="server" CssClass="info"></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>


<%--<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<form id="form1" head runat="server">
    <title></title>
    <style>
            body {
                font-family: Arial, sans-serif;
            }

            .container {
                width: 80%;
                margin: auto;
                padding: 20px;
            }

            .header {
                color: #007bff;
                text-align: center;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-control {
                width: 100%;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ccc;
            }

            .btn {
                padding: 10px 15px;
                background-color: #28a745;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }

                .btn:hover {
                    background-color: #218838;
                }

            .info {
                margin-top: 20px;
                padding: 10px;
                background-color: #f2f2f2;
                border: 1px solid #ccc;
                border-radius: 5px;
            }

            .auto-style1 {
                margin-top: 20px;
                padding: 10px;
                background-color: #f2f2f2;
                border: 1px solid #ccc;
                border-radius: 5px;
                text-align: center;
            }
        </style>
</form>
<body>
        <div class="container">
            <h1 class="header">
                <asp:Label ID="Label1" runat="server" Text="Faruk`s Page"></asp:Label></h1>

            <h3>Find the Nearest Store Service</h3>
            <h4>Returns store address and details using the given ZIP code and store name. Uses existing Google Maps API.</h4>
            <%--<div class="info">
                Method Name: findNearestStore(...)
                <br /> Input parameters: string (zipcode), string (storeName)
                <br /> Return type: string
            </div>--%>
            <%--<div class="form-group">
                <label>Enter a valid ZIP code:</label>
                <asp:TextBox ID="txtBox_ZIP2" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Enter a store name:</label>
                <asp:TextBox ID="txtBox_storeName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="btn_submit2" runat="server" CssClass="btn" OnClick="btn_submit2_Click" Text="Submit" />
            </div>
            <div>
                <asp:Image ID="IMG2" runat="server" />
            </div>
            <div class="info">
                <asp:Label ID="lbl_info2" runat="server"></asp:Label>
            </div>

            <asp:Label ID="Advice" runat="server" ForeColor="Red" Height="18px"></asp:Label>
            <br />
            <br />
            <div class="stock-price">
                <h1>STOCK PRICE</h1>
                <div class="form-group">
                    <label>Enter Your Ticker Here:</label>
                    <asp:TextBox ID="TxtBox_Ticker" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:Button ID="Button_GetPrice" runat="server" CssClass="btn" OnClick="Button_GetPrice_Click" Text="Get Price" />
                </div>
                <div class="info">
                    <asp:Label ID="lbl_StockPrice" runat="server" Text="Price"></asp:Label>
                </div>
                <div class="auto-style1">
                    <asp:Label ID="lbl_currentTime" runat="server" CssClass="info"></asp:Label>
                </div>
            </div>
        </div>
    </body>--%>
<%--</html>--%>--%>
