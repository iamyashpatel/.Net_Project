<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NoticeUpload.aspx.cs" Inherits="project.NoticeUpload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Upload Notice - My College Management System</title>
    <link rel="stylesheet" type="text/css" href="NoticeUpload.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Upload Notice</h1>
    <div class="container">
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
        <div class="form-group">
            <asp:Label ID="lblTitle" runat="server" Text="Title:"></asp:Label>
            <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Label ID="lblFile" runat="server" Text="Upload File:"></asp:Label>
            <asp:FileUpload ID="fileUpload" runat="server" />
        </div>
        <div class="form-group">
            <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
        </div>
    </div>
</asp:Content>
