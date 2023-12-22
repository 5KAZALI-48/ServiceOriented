using CryptLibrary;
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
    public partial class MemberLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
            bool auth = false;
            bool remember = false;

            XmlTextReader reader = new XmlTextReader(HttpContext.Current.Server.MapPath("App_Data/Member.xml"));

            if (reader == null)
            {
                auth = false;
            }
            else
            {
                while (reader.Read())
                {
                    if (reader.Name == "Username")
                    {
                        reader.Read();

                        if (reader.Value.ToString() == Login1.UserName)
                        {
                            while (reader.Read())
                            {
                                if (reader.Name == "Password")
                                {
                                    reader.Read();

                                    //encrypt password to check
                                    CryptoLib encrypter = new CryptoLib();
                                    string pass = CryptoLib.encryption(Login1.Password);

                                    if (reader.Value.ToString() == pass)
                                    {
                                        auth = true;
                                        createFormsAuthTicket(Login1.UserName, Login1.RememberMeSet);
                                    }
                                }

                            }
                        }
                        else
                            auth = false;
                    }
                }
            }

            if (auth)
            {
                e.Authenticated = true;
                if (Login1.RememberMeSet == true)
                {
                    remember = true;
                }
                FormsAuthentication.RedirectFromLoginPage(Login1.UserName.ToString(), remember);
                Response.Redirect("Member.aspx");
            }
            else
            {
                e.Authenticated = false;
                Response.Redirect("Default.aspx");
            }
        }

        private void createFormsAuthTicket(string username, bool isPersistent)
        {
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1,
                username,
                DateTime.Now,
                DateTime.Now.AddMinutes(30),
                isPersistent,
                "");
            string encryptedTicket = FormsAuthentication.Encrypt(ticket);
            HttpCookie cookie = new HttpCookie("memberCookie", encryptedTicket);
            Response.Cookies.Add(cookie);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("MemberSignUp.aspx");

        }
    }
}