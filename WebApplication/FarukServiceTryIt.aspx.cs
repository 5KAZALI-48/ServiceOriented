using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication
{
    public partial class FarukServiceTryIt : System.Web.UI.Page
    {
        private FormsAuthenticationTicket userTicket;

        private readonly string NewLine = Environment.NewLine;

        protected void Page_Load(object sender, EventArgs e)
        {
            //lbl_currentTime.Text = Global.currentTime;
            // Implement our own cookies to auto authenticate members



            if (!this.isMemberLoggedIn())
            {

                Response.Redirect("~/MemberLogin.aspx");
            }
        }

        private void DataGridView1_CellFormatting(object sender, DataGridViewCellFormattingEventArgs e)
        {
            if (e.Value != DBNull.Value)
            {
                //+ or - sign
                if (((string)e.Value).StartsWith("+"))
                {
                    e.CellStyle.ForeColor = Color.Green;
                }
                else if (((string)e.Value).StartsWith("-"))
                {
                    e.CellStyle.ForeColor = Color.Red;
                }

                if (((string)e.Value).EndsWith("%") == true && ((string)e.Value).StartsWith("-") == false)
                {
                    e.CellStyle.ForeColor = Color.Green;
                }

            }
        }
        protected void homePageButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Default.aspx");
        }

        private bool isMemberLoggedIn()
        {
            try
            {
                HttpCookie authCookie = Request.Cookies.Get("memberCookie");
                if (authCookie == null)
                {
                    return false;
                }
                userTicket = FormsAuthentication.Decrypt(authCookie.Value);
            }
            catch (ArgumentException)
            {
                return false;
            }

            if (userTicket == null)
            {
                return false;
            }
            return true;
        }


        protected void btn_submit2_Click(object sender, EventArgs e)
        {
            NearestStoreWebstrarServiceReference.Service1Client client = new NearestStoreWebstrarServiceReference.Service1Client(); // Makes sure both text boxes are full
            Util util = new Util();
            util.clearLabel(lbl_info2);  // clears label
            IMG2.ImageUrl = ""; // clears image URL

            string zipcode = txtBox_ZIP2.Text; // obtains ZIP code from the text box
            string data = ""; // to store data

            if (!String.IsNullOrWhiteSpace(txtBox_ZIP2.Text) && !String.IsNullOrWhiteSpace(txtBox_storeName.Text)) // checks if both text boxes have data
            {
                if (util.checkZIP(zipcode)) // checks ZIP code validity 
                {
                    data = client.FindNearestStore(zipcode, txtBox_storeName.Text); // finds the nearest store 
                    var output = data.Split(new[] { '|' }); // splits the data using '|'

                    if (output.Length > 1) // If there is only one element, it is an error message
                    {
                        // updates data on the TryIt page
                        IMG2.ImageUrl = output[0];
                        lbl_info2.Text += "Store Name: " + output[1] + "<br />";
                        lbl_info2.Text += "Store Rating: " + output[2] + "<br />";
                        lbl_info2.Text += "Store Address: " + output[3];
                    }
                    else
                        lbl_info2.Text = output[0]; // updates label with an error message

                }
                else
                {
                    lbl_info2.Text = "Enter a valid ZIP code."; // prompts user to enter a valid zip code
                }
            }
            else
            {
                lbl_info2.Text = "Please enter data in both boxes."; // prompts user to enter data in both boxes
            }

        }

        protected void Button_GetPrice_Click(object sender, EventArgs e)
        {
            StockWebstrarServiceReference.Service1Client service1Client = new StockWebstrarServiceReference.Service1Client();

            try
            {
                string stockSymbol = TxtBox_Ticker.Text;
                float price = service1Client.StockQuote(stockSymbol);
                lbl_StockPrice.Text = price.ToString("C2");
            }
            catch (Exception)
            {
                // Handle any exceptions that occur during the web service call
                lbl_StockPrice.Text = "Error fetching stock price. Please try again.";
                // Optionally log the exception details for debugging
            }
        }
    }
}