using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class StudentLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear any previous login messages
                lblMessage.Text = "";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Assuming your database connection string is stored in web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["CollegeDBConnectionString"].ConnectionString;

            // SQL query to check if the provided credentials are valid
            string query = "SELECT COUNT(*) FROM Students WHERE Username = @Username AND Password = @Password";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        command.Parameters.AddWithValue("@Username", username);
                        command.Parameters.AddWithValue("@Password", password);

                        connection.Open();
                        int count = (int)command.ExecuteScalar();

                        if (count > 0)
                        {
                            // Set session variable upon successful login
                            Session["Username"] = username;

                            // Redirect to student dashboard upon successful login
                            Response.Redirect("StudentDashboard.aspx");
                            HttpCookie cookie = new HttpCookie("Username");
                            cookie.Value = username;
                            cookie.Expires = DateTime.Now.AddMonths(1); // Cookie expires in 1 month
                            Response.Cookies.Add(cookie);
                        }
                        else
                        {
                            lblMessage.Text = "Invalid username or password";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle database connection errors or query execution errors
                lblMessage.Text = "An error occurred: " + ex.Message;
            }
        }
    }
}