<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AdminPanel.master" AutoEventWireup="true" CodeFile="CountryAddEdit.aspx.cs" Inherits="Content_AdminPanel_Country_CountryAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphHeadContent" Runat="Server">
    <asp:Label ID="lblPageHeader" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageContent" runat="Server">
<div class="container">
    <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false" />
    <div class="form-group row">
        <label class="col-md-2 col-form-label">Country Name<span class="text-danger">*</span></label>
        <div class="col-md-4">
            <asp:TextBox ID="txtCountryName" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvCountryName" runat="server"
                ErrorMessage="Enter Country Name"
                CssClass="text-danger"
                ControlToValidate="txtCountryName"
                SetFocusOnError="True"
                Display="Dynamic" ValidationGroup="Save" />
        </div>
    </div>
    <div class="form-group row">
        <label class="col-md-2 col-form-label">Country Code<span class="text-danger">*</span></label>
        <div class="col-md-4">
            <asp:TextBox ID="txtCountryCode" runat="server" CssClass="form-control" />
            <asp:RequiredFieldValidator ID="rfvCountryCode" runat="server"
                ErrorMessage="Enter Country Code"
                CssClass="text-danger"
                ControlToValidate="txtCountryCode"
                SetFocusOnError="True"
                Display="Dynamic" ValidationGroup="Save" />
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
    </div>
</div>
    </asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphScriptBlock" runat="Server">
</asp:Content>


<%--<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AdminPanel.master" AutoEventWireup="true" CodeFile="CountryAddEdit.aspx.cs" Inherits="Content_AdminPanel_Country_Country_Add" %>

<asp:Content ID="Content4" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphHeadContent" Runat="Server">
    Country Add
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="cphPageContent" Runat="Server">

    <div class="container">
        <div class="row">
            <div class="col-md-2">
                Country Name
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row" style="padding-top:30px;">
            <div class="col-md-2">
                Country Code
            </div>
            <div class="col-md-2">
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
            </div>  
        </div>
        <div class="row">
            <div>
                <asp:Label ID="lblError" runat="server" EnableViewState="false" CssClass="text-danger"></asp:Label>
            </div>
        </div>
        <div class="row" style="padding-top:30px;padding-bottom:30px">
            <div class="col-md-2">
                
            </div>
            <div class="col-md-2">
                <asp:Button ID="Button1" runat="server" Text="Save" cssclass="btn btn-primary" OnClick="btnSave_Click"/>
            </div>  
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="cphScriptBlock" Runat="Server">
</asp:Content>--%>