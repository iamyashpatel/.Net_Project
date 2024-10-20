<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadAttendance.aspx.cs" Inherits="project.UploadAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <script src="Javascript.js" type="text/javascript"></script>

    <div id="attendance_area">
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
                    <!-- Add more semesters as needed -->
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
                        <strong>Day_work:</strong>
                    </td>
                    <td class="auto-style11">
                        <asp:TextBox ID="TxtBoxWork" runat="server" Width="180px"></asp:TextBox>
                    </td>
                <div>
            <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
            <asp:TextBox ID="TxtBoxDate" runat="server" ReadOnly="true"></asp:TextBox>
        </div>
                </tr>
                <tr>
                    <td class="auto-style11" colspan="2">
                        &nbsp;
                    </td>
                </tr>
            </tr>
            <!-- Other table rows for selecting year, semester, etc. -->
        </table>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#DEBA84"
    BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2">
    <AlternatingRowStyle BackColor="Aqua"></AlternatingRowStyle>
    <Columns>
        <asp:BoundField DataField="REGNO" HeaderText="REGNO" />
        <asp:BoundField DataField="FIRSTNAME" HeaderText="FIRST NAME" />
        <asp:BoundField DataField="LASTNAME" HeaderText="LAST NAME" />
        <asp:TemplateField HeaderText="PRESENT">
            <ItemTemplate>
                <asp:CheckBox ID="ChckBoxStatus" runat="server" onclick="handleCheckboxClick(this)" />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        
    </Columns>
</asp:GridView>
      
        <br />
        <asp:Button ID="BtnSubmit" runat="server" BorderColor="Red" Height="30px" Style="font-weight: 700;"
            Text="SUBMIT" Width="90px" OnClick="Button2_Click" />
        
<asp:CheckBox ID="CheckAll" runat="server" Text="Select All" onclick="selectAllCheckbox(this);" />
    </div>
</asp:Content>
