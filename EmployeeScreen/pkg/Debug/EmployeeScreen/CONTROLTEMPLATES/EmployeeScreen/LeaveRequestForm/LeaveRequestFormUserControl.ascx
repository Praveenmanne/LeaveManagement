<%@ Assembly Name="EmployeeScreen, Version=1.0.0.0, Culture=neutral, PublicKeyToken=ecb8e61697ee58b5" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeaveRequestFormUserControl.ascx.cs"
    Inherits="EmployeeScreen.LeaveRequestForm.LeaveRequestFormUserControl" %>
<link href="/_layouts/LeaveRequest.css" rel="stylesheet" type="text/css" />
<div class="Container">
    <ul>
        <li>
            <h3>
                Leave Request Form
            </h3>
        </li>
        <table cellpadding="0" cellspacing="0" border="0" align="center" style="width: 100%; height: 160px;">
            <tr>
                <td>
                    Employee ID:
                </td>
                <td>
                    <asp:Label ID="lblEmpID" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    Disgination:
                </td>
                <td>
                    <asp:Label ID="lblDesgination" runat="server" Text=""></asp:Label>
                </td>
                <td>
                    Department:
                </td>
                <td>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    Type of Leave:
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlTypeofLeave" CssClass="listbox" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
                <td>
                    Purpose:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtPurpose" TextMode="MultiLine" CssClass="text"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    From Date:
                </td>
                <td>
                    <SharePoint:DateTimeControl ID="txtFromDate" runat="server" DateOnly="true" />
                </td>
                <td>
                    To Date:
                </td>
                <td>
                    <SharePoint:DateTimeControl ID="txtToDate" runat="server" DateOnly="true" />
                </td>
            </tr>
            <tr>
                <td>
                    Leave Days:
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtLeaveDays" CssClass="text"></asp:TextBox>
                </td>
                <td>
                    Reporting To:
                </td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlReportingto" CssClass="listbox" AutoPostBack="true">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="right" style="height: 30px;">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" />&nbsp;&nbsp;
                </td>
                <td colspan="2">
                    <asp:Button ID="btnReset" runat="server" Text="Reset" />
                </td>
            </tr>
        </table>
    </ul>
</div>
