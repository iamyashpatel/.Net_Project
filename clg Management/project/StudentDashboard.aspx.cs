using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Assuming username is retrieved from session or some other source
                string username = GetUsernameFromSource();

                // Set the retrieved username to the label
                lblUsername.Text = username;
            }
        }

        private string GetUsernameFromSource()
        {
            // Replace this with your logic to retrieve the username
            // For example, if it's stored in a session variable:
            if (Session["Username"] != null)
            {
                return Session["Username"].ToString();
            }
            else
            {
                // If username is not available, you can return a default value or handle it accordingly
                return "Guest";
            }
        }
    }
}