using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace WebApplication
{
    public class Global : HttpApplication
    {
     
        public static string currentTime = "";

        protected void Application_Start(object sender, EventArgs e)
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Application["SessionCounter"] = 0; //initialize the session counter for the application
            currentTime = DateTime.Now.ToString(); //update the time 
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Int32 counter = ((Int32)Application["SessionCounter"]); //get the previous number of sessions
            counter = counter + 1; //increment the session count by 1
            currentTime = DateTime.Now.ToString(); //update the time
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            Int32 counter = ((Int32)Application["SessionCounter"]); //get the previous number of sessions
            counter = counter - 1; //decrement the session count by 1
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}