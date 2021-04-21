﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AdminPanel.master" AutoEventWireup="true" CodeFile="StateAddEdit.aspx.cs" Inherits="Content_AdminPanel_State_StateAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadContent" Runat="Server">
    <asp:Label ID="lblPageHeader" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphPageContent" Runat="Server">
    <div class="container">
    <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false" />
    <div class="form-group row">
        <label class="col-md-2 col-form-label">State Name<span class="text-danger">*</span></label>
        <div class="col-md-4">
            <asp:TextBox ID="txtStateName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvStateName" runat="server"
                ErrorMessage="Enter State Name"
                CssClass="text-danger"
                ControlToValidate="txtStateName"
                SetFocusOnError="True"
                Display="Dynamic" ValidationGroup="Save" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-2 col-form-label">Country<span class="text-danger">*</span></label>
        <div class="col-md-4">
            <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control"></asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCountry" runat="server"
                ControlToValidate="ddlCountry"
                ErrorMessage="Please Select Country"
                Display="Dynamic"
                CssClass="text-danger"
                SetFocusOnError="True" ValidationGroup="Save" />
        </div>
    </div>
    <div class="form-group row">
        <div class="col-md-2 offset-md-2">
            <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" CssClass="btn btn-primary" OnClick="btnSave_Click"/>
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
        </div>
        <div class="col-md-3">
            <asp:Label ID="lblSuccess" runat="server" CssClass="text-success" EnableViewState="false" />
        </div>
    </div></div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScriptBlock" Runat="Server">
</asp:Content>


<%--<asp:Content ID="Content5" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphContent" runat="Server">
    
    
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphScript" runat="Server">
</asp:Content>--%>

