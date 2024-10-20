using System;
using System.IO;

namespace project
{
    public partial class DownloadFile1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nothing needs to be done on Page_Load for this page
        }

        protected void btnDownload_Click(object sender, EventArgs e)
        {
            // Get the file name from the query string
            string fileName = Request.QueryString["fileName"];

            if (!string.IsNullOrEmpty(fileName))
            {
                // Construct the file path
                string filePath = Server.MapPath("~/Material_UploadedFiles/" + fileName);

                // Check if the file exists
                if (File.Exists(filePath))
                {
                    // Set the appropriate content type for the file
                    Response.ContentType = "application/octet-stream";

                    // Set the file name in the Content-Disposition header
                    Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);

                    // Write the file content to the response stream
                    Response.TransmitFile(filePath);

                    // End the response
                    Response.End();
                }
                else
                {
                    // File not found, handle error (e.g., display a message)
                    Response.Write("File not found.");
                }
            }
            else
            {
                // Invalid request, handle error (e.g., display a message)
                Response.Write("Invalid request.");
            }
        }
    }
}
