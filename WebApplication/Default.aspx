<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .button-style {
            font-size: large; 
            color: #FFFFFF; 
            background-color: #17a2b8; /* Bootstrap info color for a modern look */
            border: none;
            padding: 12px 25px;
            border-radius: 8px;
            margin: 15px;
            transition: background-color 0.3s, box-shadow 0.3s;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .button-style:hover {
            background-color: #138496; /* Darker shade for hover effect */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
        }
        .container-center {
            text-align: center;
            padding: 40px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
            margin-top: 30px;
        }
        .summary-link, .summary-link:visited {
            color: #007bff;
            font-size: 1.2em;
            text-decoration: none;
            transition: color 0.3s;
        }
        .summary-link:hover {
            color: #0056b3;
            text-decoration: underline;
        }
        .current-time {
            margin-top: 30px;
            font-size: larger;
            color: #555;
        }
        .info-text {
            margin: 20px 0;
            color: #666;
            font-size: 1.1em;
        }
    </style>

    <div class="container-center">
        <h1>
            <asp:Button ID="Button1" runat="server" CssClass="button-style" OnClick="memberPageButton_Click" Text="Member Page" />
        </h1>
        <h1>
            <asp:Button ID="Button2" runat="server" CssClass="button-style" OnClick="button2_click" Text="Staff Page" />
        </h1>
        <p class="info-text">To access these services, please log in by clicking the "Member" button on the top left of the screen. If you do not have an account, you may click on this button to create an account as well.</p>
        <%--<h1><asp:Label ID="" runat="server"></asp:Label></h1>--%>
    </div>
     <script>
        function onSummaryLinkClick() {
            alert("Link was clicked!");
            // Add more logic here
        }

        document.addEventListener('DOMContentLoaded', (event) => {
            document.getElementById('summaryLink').addEventListener('click', onSummaryLinkClick);
        });
     </script>
    <div class="container-center">
        <h1>
            <a href="http://webstrar4.fulton.asu.edu/index.html" class="summary-link">Application Summary Table</a>
        </h1>
        <asp:Label ID="lbl_currentTime" runat="server" CssClass="current-time"></asp:Label>
    </div>
</asp:Content>
