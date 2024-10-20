<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="project.StudentDashboard" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <h2>Welcome to Your Student Dashboard</h2>
        <p>Hello, <asp:Label ID="lblUsername" runat="server" Text=""></asp:Label>!</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        
        <!-- Dashboard Options -->
        <div class="dashboard-options">
            <ul>
                <li><a href="ShowMaterial.aspx">Show Materials</a></li>
                <li><a href="StudentShowAattendance.aspx">View Attendance</a></li>
                <li><a href="ShowNotice.aspx">View Notices</a></li>
            </ul>
        </div>
    </div>
    
    <!-- Link to CSS file -->
    <link rel="stylesheet" type="text/css" href="StudentDashboardStyle.css" />
</asp:Content>
