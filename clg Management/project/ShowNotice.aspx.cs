using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project
{
    public partial class ShowNotice : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowUploadedFiles();
            }
        }

        private void ShowUploadedFiles()
        {
            string uploadDirectory = Server.MapPath("~/Notice_UploadedFiles/");
            string[] files = Directory.GetFiles(uploadDirectory);

            if (files.Length > 0)
            {
                foreach (string file in files)
                {
                    string fileName = Path.GetFileName(file);
                    string downloadUrl = $"DownloadFile.aspx?fileName={fileName}";

                    // Create a hyperlink to download the file
                    HyperLink downloadLink = new HyperLink();
                    downloadLink.Text = fileName;
                    downloadLink.NavigateUrl = downloadUrl;
                    downloadLink.Target = "_blank"; // Open download link in a new tab/window

                    // Add the download link to a panel or any container control
                    pnlFileLinks.Controls.Add(downloadLink);

                    // Add a line break between file links
                    pnlFileLinks.Controls.Add(new LiteralControl("<br />"));
                }
            }
            else
            {
                // Display a message if no files are found
                Label noFilesLabel = new Label();
                noFilesLabel.Text = "No files found.";
                pnlFileLinks.Controls.Add(noFilesLabel);
            }
        }
    }
}