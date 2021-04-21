<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AdminPanel.master" AutoEventWireup="true" CodeFile="ContactAddEdit.aspx.cs" Inherits="Content_AdminPanel_Contact_ContactAddEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadContent" runat="Server">
    <asp:Label ID="lblPageHeader" runat="server"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphPageContent" runat="Server">
    <div class="container">
        <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false" />
        <div class="form-group row">
            <div class="col-md-6">
                <div class="row">
                    <div class="col-md-4">Contact Name<span class="text-danger">*</span></div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtContactName" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvContactName" runat="server"
                            ErrorMessage="Enter Contact Name"
                            CssClass="text-danger"
                            ControlToValidate="txtContactName"
                            SetFocusOnError="True"
                            Display="Dynamic" ValidationGroup="Save" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <div class="offset-md-1 col-md-3 col-form-label">Address<span class="text-danger">*</span></div>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvAddress" runat="server"
                            ErrorMessage="Enter Address Name"
                            CssClass="text-danger"
                            ControlToValidate="txtAddress"
                            SetFocusOnError="True"
                            Display="Dynamic" ValidationGroup="Save" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <div class="row">
                    <label class="col-md-4 col-form-label">Country Name</label>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlCountry" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlCountry_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <label class="offset-md-1 col-md-3 col-form-label">State Name</label>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlState_SelectedIndexChanged"></asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <div class="row">
                    <label class="col-md-4 col-form-label">City Name</label>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <label class="offset-md-1 col-md-3 col-form-label">Email</label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                            ErrorMessage="Enter Proper Email"
                            CssClass="text-danger"
                            Display="Dynamic"
                            ControlToValidate="txtEmail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            SetFocusOnError="True" ValidationGroup="Save" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <div class="row">
                    <label class="col-md-4 col-form-label">Moible No<span class="text-danger">*</span></label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtMobileNo" TextMode="Number" runat="server" CssClass="form-control" />
                        <asp:RequiredFieldValidator ID="rfvMobileNo" runat="server"
                            ErrorMessage="Enter Mobile No"
                            CssClass="text-danger"
                            ControlToValidate="txtMobileNo"
                            SetFocusOnError="True"
                            Display="Dynamic" ValidationGroup="Save" />
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <label class="offset-md-1 col-md-3 col-form-label">Phone No</label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtPhoneNo" TextMode="Number" runat="server" CssClass="form-control" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <div class="row">
                    <label class="col-md-4 col-form-label">Gender<span class="text-danger">*</span></label>
                    <div class="col-md-8">
                        <asp:RadioButton ID="btnMale" runat="server" Text="Male" GroupName="Gender" Checked="True" />
                        <asp:RadioButton ID="btnFemale" runat="server" Text="Female" GroupName="Gender"/>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <label class="offset-md-1 col-md-3 col-form-label">BirthDate</label>
                    <div class="col-md-8">
                        <asp:TextBox ID="txtBirthDate" runat="server" CssClass="form-control" TextMode="Date" />
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-6">
                <div class="row">
                    <label class="col-md-4 col-form-label">ContactCategory Name</label>
                    <div class="col-md-8">
                        <asp:CheckBoxList ID="cblContactCategory" runat="server"></asp:CheckBoxList>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="row">
                    <label class="offset-md-1 col-md-3 col-form-label">BloodGroup Name</label>
                    <div class="col-md-8">
                        <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-md-2 col-form-label">Profession<span class="text-danger">*</span></label>
            <div class="col-md-4">
                <asp:TextBox ID="txtProfession" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvProfession" runat="server"
                    ErrorMessage="Enter Profession Name"
                    CssClass="text-danger"
                    ControlToValidate="txtProfession"
                    SetFocusOnError="True"
                    Display="Dynamic" ValidationGroup="Save" />
            </div>
        </div>
        <div class="form-group row">
            <div class="col-md-2 offset-md-2">
                <asp:Button ID="btnSave" runat="server" Text="Save" ValidationGroup="Save" CssClass="btn btn-primary" OnClick="btnSave_Click" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnCancel_Click" />
            </div>
            <div class="col-md-3">
                <asp:Label ID="lblSuccess" runat="server" CssClass="text-success" EnableViewState="false" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScriptBlock" runat="Server">
</asp:Content>

