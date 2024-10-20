<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="FacultyDashboard.aspx.cs" Inherits="project.FacultyDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Faculty Dashboard - My College Management System</title>
    
    <link rel="stylesheet" type="text/css" href="FacultyDashboardStyle.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Welcome to Your Faculty Dashboard</h2>
        <div class="dashboard-options">
            <h3>Upload:</h3>
            <ul>
                <li><a href="UploadMaterial.aspx">Upload Material</a></li>
                <li><a href="UploadAttendance.aspx">Upload Attendance</a></li>
            </ul>
        </div>
        <div class="dashboard-options">
            <h3>Show:</h3>
            <ul>
                <li><a href="ShowMaterial.aspx">Show Material</a></li>
                <li><a href="ShowAttendance.aspx">Show Attendance</a></li>
                <li><a href="ShowNotice.aspx">Show Notice</a></li>
            </ul>
        </div>
    </div>
</asp:Content>
