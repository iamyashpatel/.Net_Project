<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowMaterial.aspx.cs" Inherits="project.ShowMaterial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Show Material - My College Management System</title>
    <!-- Include your CSS stylesheets here -->
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Show Material</h1>
    <div class="container">
        <asp:Panel ID="pnlFileLinks" runat="server"></asp:Panel>
    </div>
</asp:Content>

