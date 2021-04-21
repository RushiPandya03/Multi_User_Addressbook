<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Content_AdminPanel_Login" %>

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
        <div class="container">

            <div class="row">
                <div class="col-md-6">
                    <h2>Login</h2>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-6">
                    <asp:Label ID="lblErrorMessage" runat="server" EnableViewState="false" CssClass="text-danger"></asp:Label>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    UserName<span class="text-danger">*</span>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                        ControlToValidate="txtUserName"
                        ErrorMessage="Enter Username"
                        Display="Dynamic"
                        CssClass="text-danger" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2">
                    Password<span class="text-danger">*</span>
                </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                        ControlToValidate="txtPassword"
                        ErrorMessage="Enter Password"
                        Display="Dynamic"
                        CssClass="text-danger" />
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-6 text-right">
                    <asp:HyperLink ID="hlCreateNewUser" runat="server" NavigateUrl="~/Content/AdminPanel/Registration.aspx">create new User</asp:HyperLink>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-info btn-sm" OnClick="btnLogin_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
