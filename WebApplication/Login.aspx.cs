using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace WebApplication
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void bttn_Login_Click(object sender, EventArgs e)
        {
            bool authSuccessful = false;
            bool rememberMe = false;
            if (txt_username.Text == "")
            {
                lbl_errors.Text = "You must enter a username!";
                lbl_errors.ForeColor = System.Drawing.Color.Red;
            }
            else if (txt_password.Text == "")
            {
                lbl_errors.Text = "You must enter a password!";
                lbl_errors.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                authSuccessful = searchStaffXML(txt_username.Text, txt_password.Text);
                if (authSuccessful)
                {
                    lbl_errors.Text = "Successfully Logged In!";
                    lbl_errors.ForeColor = System.Drawing.Color.Green;
                    if (checkBox_remember.Checked == true)
                    {
                        rememberMe = true;
                    }
                    FormsAuthentication.RedirectFromLoginPage(txt_username.Text, rememberMe);
                    Response.Redirect("~/Staff/Staff.aspx");
                }
                else
                {
                    lbl_errors.Text = "Invalid Username and Password Combination!";
                    lbl_errors.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        private bool searchStaffXML(string uname, string pass)
        {
            XmlTextReader reader = new XmlTextReader(HttpContext.Current.Server.MapPath("App_Data/Staff.xml"));
            if (reader == null)
            {
                reader.Close();
                return false;
            }
            while (reader.Read())
            {
                if (reader.Name == "Username")
                {
                    reader.Read();
                    if (reader.Value.ToString() == uname)
                    {
                        while (reader.Read())
                        {
                            if (reader.Name == "Password")
                            {
                                reader.Read();
                                if (reader.Value.ToString() == pass)
                                {
                                    reader.Close();
                                    return true;
                                }
                                else
                                {
                                    reader.Close();
                                    return false;
                                }
                            }
                        }
                    }
                }
            }
            reader.Close();
            return false;
        }
    }
}