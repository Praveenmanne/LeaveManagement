<%@ Assembly Name="EmployeeScreen, Version=1.0.0.0, Culture=neutral, PublicKeyToken=ecb8e61697ee58b5" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages"
    Assembly="Microsoft.SharePoint, Version=14.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmployeeScreenUserControl.ascx.cs"
    Inherits="EmployeeScreen.EmployeeScreen.EmployeeScreenUserControl" %>
<link href="/_layouts/EmployeeScreen.css" rel="stylesheet" type="text/css" />
<div class="Container">
    <ul>
        <li>
            <h3>
                Employee Creation</h3>
        </li>
        <li>
            <div class="left">
                <label>
                    Employee ID:</label>
            </div>
            <div class="right">
                <asp:TextBox runat="server" ID="txtempid" CssClass="text"></asp:TextBox>
            </div>
            <span class="clear"></span></li>
        <li>
            <div class="left">
                <label>
                    Employee name:</label>
            </div>
            <div class="right">
                <SharePoint:PeopleEditor ID="peoplepickeremp" Width="355px" Visible="true" AllowEmpty="false"
                    ValidatorEnabled="true"  SelectionSet="User" MultiSelect="false"
                    runat="server"  ></SharePoint:PeopleEditor>
                <%--<asp:TextBox runat="server" ID="Txtname" CssClass="text readOnly" ReadOnly="True"></asp:TextBox>--%>
            </div>
            <span class="clear"></span></li>
        <li>
            <div class="left">
                <label>
                    First Name:</label>
            </div>
            <div class="right">
                <asp:TextBox runat="server" ID="txtfristname" CssClass="text"></asp:TextBox>
            </div>
            <span class="clear"></span></li>
        <li>
            <div class="left">
                <label>
                    Last Name:</label>
            </div>
            <div class="right">
                <asp:TextBox runat="server" ID="txtlastname" CssClass="text"></asp:TextBox>
            </div>
            <span class="clear"></span></li>
        <li>
            <div class="left">
                <label>
                    Employee Type:</label></div>
            <div class="right">
                <asp:DropDownList runat="server" ID="DdlEmptype" CssClass="listbox" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <span class="clear"></span></li>
        <li>
            <div class="left">
                <label>
                    Department:</label></div>
            <div class="right">
                <asp:DropDownList runat="server" ID="DdlDep" CssClass="listbox" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <span class="clear"></span></li>
        <li>
            <div class="left">
                <label>
                    Designation:</label></div>
            <div class="right">
                <asp:DropDownList runat="server" ID="DdlDesignation" CssClass="listbox" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <span class="clear"></span></li>
        <li>
            <div class="left">
                <label>
                    Email:</label>
            </div>
            <div class="right">
                <asp:TextBox runat="server" ID="Txtmail" CssClass="text"></asp:TextBox>
            </div>
            <span class="clear"></span></li>
        <li>
            <div class="left">
                <label>
                    Phone:
                </label>
            </div>
            <div class="right">
                <asp:TextBox runat="server" ID="TxtContact" CssClass="text"></asp:TextBox>
            </div>
            <span class="clear"></span></li>
             <li>
            <div class="left">
                <label>
                    Date of Join:</label>
            </div>
            <div class="right" style="width:350px;">
                <SharePoint:DateTimeControl ID="DtDoj" runat="server"  DateOnly="true" />
            </div>
            <span class="clear"></span></li>
             <li>
            <div class="left">
                <label>
                    Date of Birth:</label>
            </div>
            <div class="right">
                <SharePoint:DateTimeControl ID="DtDOB" runat="server"  DateOnly="true"/>
            </div>
            <span class="clear"></span></li>
        
        <li>
            <div class="clear">
            </div>
        </li>
       
        <li>
            <div class="left">
            </div>
            <div class="right">
                <asp:Label runat="server" ID="LblError" CssClass="ErrorInfo"></asp:Label>
            </div>
            <div class="clear">
            </div>
        </li>
        <li>
            <div class="controls">
                 <asp:Button runat="server" Text="Submit" ID="BtnRegister" 
                     onclick="BtnRegister_Click"   />
                <asp:Button runat="server" Text="Reset" ID="BtnCancel" 
                     onclick="BtnReset_Click"  />
            </div>
        </li>
    </ul>
</div>
