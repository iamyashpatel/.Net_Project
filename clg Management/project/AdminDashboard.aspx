<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="project.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Admin Dashboard - My College Management System</title>
    <link rel="stylesheet" type="text/css" href="AdminDashboardStyle.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Welcome to Admin Dashboard</h1>
    <div class="container">
        <!-- Upload Options -->
        <div class="upload-options">
            <h3>Upload</h3>
            <ul>
                <li><a href="UploadMaterial.aspx">Upload Material</a></li>
                <li><a href="UploadAttendance.aspx">Upload Attendance</a></li>
                <li><a href="NoticeUpload.aspx">Upload Notice</a></li>
            </ul>
        </div>
        
        <!-- Show Options -->
        <div class="show-options">
            <h3>Show</h3>
            <ul>
                <li><a href="ShowMaterial.aspx">Show Materials</a></li>
                <li><a href="ShowAttendance.aspx">Show Attendance</a></li>
                <li><a href="ShowNotice.aspx">Show Notices</a></li>
            </ul>
        </div>
    </div>
</asp:Content>
