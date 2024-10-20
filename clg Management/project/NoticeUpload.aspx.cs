using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class NoticeUpload : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Clear any previous upload messages
                lblMessage.Text = "";
            }
        }

               protected void btnUpload_Click(object sender, EventArgs e)
        {
            // Check if a file is uploaded
            if (fileUpload.HasFile)
            {
                try
                {
                    // Get the file name and extension
                    string fileName = Path.GetFileName(fileUpload.FileName);

                    // Specify the directory where you want to save the file
                    string uploadDirectory = Server.MapPath("~/Notice_UploadedFiles/");
                    
                    // If the directory doesn't exist, create it
                    if (!Directory.Exists(uploadDirectory))
                    {
                        Directory.CreateDirectory(uploadDirectory);
                    }

                    // Save the file to the specified directory
                    fileUpload.SaveAs(Path.Combine(uploadDirectory, fileName));

                    // Display a success message
                    lblMessage.Text = "File uploaded successfully.";
                }
                catch (Exception ex)
                {
                    // Display an error message if something goes wrong
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
            else
            {
                // Display a message if no file is uploaded
                lblMessage.Text = "Please select a file to upload.";
            }
        }

    }
}