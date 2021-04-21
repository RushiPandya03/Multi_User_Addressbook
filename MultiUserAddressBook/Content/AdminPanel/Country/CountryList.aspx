<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AdminPanel.master" AutoEventWireup="true" CodeFile="CountryList.aspx.cs" Inherits="Content_AdminPanel_Country_CountryList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="cphHeadContent" runat="Server">
    Country List
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphPageContent" runat="Server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row" style="padding-bottom: 2em; padding-top: 1.5em">
                    <div class="col-md-12 text-right">
                        <asp:Button ID="Button1" runat="server" Text="Add Country" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
                    </div>
                </div>
                <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false" />
                <asp:GridView ID="gvCountry" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowCommand="gvCountry_RowCommand">
                    <Columns>
                        <asp:BoundField DataField="CountryID" HeaderText="ID" ItemStyle-Width="50px" />
                        <asp:BoundField DataField="CountryName" HeaderText="Country Name" ItemStyle-Width="150px" />
                        <asp:BoundField DataField="CountryCode" HeaderText="Country Code" ItemStyle-Width="100px" />
                        <asp:TemplateField HeaderText="Oprations" ItemStyle-Width="50px">
                            <ItemTemplate>
                                <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-sm btn-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("CountryID") %>' />
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-sm btn-info" CommandName="EditRecord" CommandArgument='<%# "~/Content/AdminPanel/Country/CountryAddEdit.aspx?CountryID=" + Eval("CountryID").ToString() %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>



</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphScriptBlock" runat="Server">
</asp:Content>


