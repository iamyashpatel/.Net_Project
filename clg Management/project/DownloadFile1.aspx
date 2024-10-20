<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownloadFile1.aspx.cs" Inherits="project.DownloadFile1" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Download File</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnDownload" runat="server" Text="Download File" OnClick="btnDownload_Click" />
        </div>
    </form>
</body>
</html>