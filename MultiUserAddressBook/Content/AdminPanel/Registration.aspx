<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Content_AdminPanel_Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        rel="stylesheet" />
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container log-form">
            <div class="row mb-4">
                <div class="col-md-12">
                    <h3>New User Registration</h3>
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2">Username<span class="text-danger">*</span></label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                        ControlToValidate="txtUsername"
                        ErrorMessage="Enter Username"
                        Display="Dynamic"
                        CssClass="text-danger"
                        ValidationGroup="Register" />
                </div>
                <label class="col-md-2">Password<span class="text-danger">*</span></label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Enter Password"
                        Display="Dynamic"
                        CssClass="text-danger"
                        ValidationGroup="Register" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2">Display Name<span class="text-danger">*</span></label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtDisplayName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvDisplayName" runat="server"
                        ControlToValidate="txtDisplayName"
                        ErrorMessage="Enter Display Name"
                        Display="Dynamic"
                        CssClass="text-danger"
                        ValidationGroup="Register" />
                </div>
                <label class="col-md-2">MobileNo</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtMobileNo" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="revMobileNo" runat="server"
                        ControlToValidate="txtMobileNo"
                        ErrorMessage="Enter Proper Mobile No"
                        Display="Dynamic"
                        CssClass="text-danger"
                        ValidationExpression="[0-9]{10}"
                        ValidationGroup="Register" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-md-2">Address</label>
                <div class="col-md-4">
                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8 offset-2">
                    <asp:Button runat="server" ID="btnRegister" ValidationGroup="Register" CssClass="btn btn-primary" Text="Register" OnClick="btnRegister_Click" />
                    <asp:Button runat="server" ID="btnCancel" CssClass="btn btn-danger ml-2" Text="Cancel" OnClick="btnCancel_Click" />
                    <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
