using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.XPath;

namespace WebApplication
{
    public partial class MemberSignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            errorLabel.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (UserName.Text != null)
            {
                if (Password.Text == ConfirmPassword.Text && Password.Text != null)
                {
                    if (Session["cText"].ToString() == TextBox1.Text)
                    {

                        CryptLibrary.CryptoLib encrypter = new CryptLibrary.CryptoLib();
                        string encrypted_password = CryptLibrary.CryptoLib.encryption(Password.Text);


                        XmlWriterSettings settings = new XmlWriterSettings();
                        settings.Indent = true;
                        settings.NewLineOnAttributes = true;

                        XmlDocument xref = new XmlDocument();
                        xref.Load(HttpContext.Current.Server.MapPath("App_Data/Member.xml"));

                        XPathNavigator nav = xref.CreateNavigator();

                        nav.MoveToChild("Members", "");
                        XmlWriter writer = nav.AppendChild();

                        writer.WriteStartElement("User");
                        writer.WriteElementString("Username", UserName.Text);
                        writer.WriteElementString("Password", encrypted_password);
                        writer.WriteEndElement();


                        writer.Close();

                        xref.Save(HttpContext.Current.Server.MapPath("App_Data/Member.xml"));



                        Response.Redirect("~/Member.aspx");


                    }
                    else
                    {
                        errorLabel.Visible = true;
                        errorLabel.Text = "Validation incorrect.";
                    }
                }
                else
                {
                    //show pw do not match
                    errorLabel.Visible = true;
                    errorLabel.Text = "Passwords Must Match!";
                }
            }
            else
            {
                errorLabel.Visible = true;
                errorLabel.Text = "Username cannot be blank";
            }
        }
    }
}