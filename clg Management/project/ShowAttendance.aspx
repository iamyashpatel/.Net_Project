<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShowAttendance.aspx.cs" Inherits="project.ShowAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="attendance_area">
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Show Attendance</h1>
        <br />
        <table class="auto-style1">
            <tr>
                <td class="auto-style4">
                    <strong>Select Programme:</strong>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="DropDownList1" runat="server" Width="180px">
                        <asp:ListItem Selected="True">Select</asp:ListItem>
                        <asp:ListItem>CSD</asp:ListItem>
                        <asp:ListItem>CP</asp:ListItem>
                        <asp:ListItem>IT</asp:ListItem>
                        <asp:ListItem>IOT</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    <strong>Class:</strong>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownList2" runat="server" Width="180px">
                        <asp:ListItem Selected="True">Select Class</asp:ListItem>
                        <asp:ListItem>.NET</asp:ListItem>
                        <asp:ListItem>UIUX</asp:ListItem>
                        <asp:ListItem>AIML</asp:ListItem>
                        <asp:ListItem>SE</asp:ListItem>
                        <asp:ListItem>MINI PROJECT</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style11">
                    <strong>Semester:</strong>
                </td>
                <td class="auto-style11">
                    <asp:DropDownList ID="DropDownListSemester" runat="server" Width="180px">
                        <asp:ListItem Selected="True">Select Semester</asp:ListItem>
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style11">
                    <strong>Registration No:</strong>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="TxtBoxRegNo" runat="server" Width="180px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style11" colspan="2">
                    &nbsp;
                </td>
            </tr>
        </table>
        &nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" />
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  
        <!-- Add GridView here -->
        &nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Show_WholeClass" />
        <br />
&nbsp;
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="873px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
            <RowStyle BackColor="White" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
         <br />
        <asp:Label ID="LblTotalPresent" runat="server" Text="Total Present:"></asp:Label>
        <br />
      
        <br />
        <asp:Label ID="LblTotalAbsent" runat="server" Text="Total Absent:"></asp:Label>
        <br />
        <br />
        <asp:Label ID="LblPercentage" runat="server" Text="PercentageCount:"></asp:Label>
          <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" Width="874px" GridLines="Horizontal">
      <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
      <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
      <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
      <SortedAscendingCellStyle BackColor="#F7F7F7" />
      <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
      <SortedDescendingCellStyle BackColor="#E5E5E5" />
      <SortedDescendingHeaderStyle BackColor="#242121" />
  </asp:GridView>

    </div>
    </div>
</asp:Content>
