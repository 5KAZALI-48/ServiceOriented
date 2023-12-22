<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Member.aspx.cs" Inherits="WebApplication.Member" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <head>
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
        <div class="container">
            <h1 class="header">
                <asp:Label ID="Label1" runat="server" Text="Faruk`s Page"></asp:Label></h1>
            <div class="form-group">
                <asp:Button ID="homePageButton" runat="server" CssClass="btn" OnClick="homePageButton_Click" Text="Home Page" />

            </div>

            <h3>Find the Nearest Store Service</h3>
            <h4>Returns store address and details using the given ZIP code and store name. Uses existing Google Maps API.</h4>
            <%--<div class="info">
                Method Name: findNearestStore(...)
                <br /> Input parameters: string (zipcode), string (storeName)
                <br /> Return type: string
            </div>--%>
            <div class="form-group">
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
    </body>
</asp:Content>
