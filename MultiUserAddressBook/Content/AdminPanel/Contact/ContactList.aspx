<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AdminPanel.master" AutoEventWireup="true" CodeFile="ContactList.aspx.cs" Inherits="Content_AdminPanel_Contact_ContactList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadContent" Runat="Server">
    Contact List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphPageContent" Runat="Server">
    <div class="container">
        <div class="row" style="padding-bottom:2em;padding-top:1.5em">
        <div class="col-md-12 text-right">
            <asp:Button ID="btnAdd" runat="server" Text="Add Contact" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false" />
            <asp:GridView ID="gvContact" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-responsive table-striped" OnRowCommand="gvContact_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ContactID" HeaderText="ID"/>
                    <asp:BoundField DataField="ContactName" HeaderText="Contact Name"/>
                    <asp:BoundField DataField="Address" HeaderText="Address"/>
                    <asp:BoundField DataField="CityName" HeaderText="City Name"/>
                    <asp:BoundField DataField="StateName" HeaderText="State Name"/>
                    <asp:BoundField DataField="CountryName" HeaderText="Country Name"/>
                    <asp:BoundField DataField="PinCode" HeaderText="PinCode"/>
                    <asp:BoundField DataField="MobileNo" HeaderText="MobileNo"/>
                    <asp:BoundField DataField="PhoneNo" HeaderText="PhoneNo"/>
                    <asp:BoundField DataField="Email" HeaderText="Email"/>
                    <asp:BoundField DataField="Gender" HeaderText="Gender"/>
                    <asp:BoundField DataField="BirthDate" HeaderText="BirthDate"/>
                    <asp:BoundField DataField="BloodGroupName" HeaderText="BloodGroup Name"/>
                    <asp:BoundField DataField="Profession" HeaderText="Profession"/>
                    <asp:BoundField DataField="ContactCategoryID" HeaderText="Contact Category Name"/>
                    <asp:TemplateField HeaderText="Oprations">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-sm btn-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("ContactID") %>'/>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-sm btn-info" CommandName="EditRecord" CommandArgument='<%# "~/Content/AdminPanel/Contact/ContactAddEdit.aspx?ContactID=" + Eval("ContactID").ToString() %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="cphScriptBlock" Runat="Server">
</asp:Content>

