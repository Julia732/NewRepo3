﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.UI;

namespace WebShop
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            if (HttpContext.Current.User != null)
            {
                if (HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    if (HttpContext.Current.User.Identity is FormsIdentity)
                    {
                        var id = (FormsIdentity)HttpContext.Current.User.Identity;
                        var ticket = id.Ticket;

                        // Get the stored user-data, in this case, our roles
                        string userData = ticket.UserData;
                        string[] roles = userData.Split(',');
                        HttpContext.Current.User = new GenericPrincipal(id, roles);
                    }
                }
            }

        }

        protected void Application_BeginRequest(Object sender, EventArgs e)
        {
            HttpApplication context = (HttpApplication)sender;
            context.Response.SuppressFormsAuthenticationRedirect = true;
        }
        
    }
}