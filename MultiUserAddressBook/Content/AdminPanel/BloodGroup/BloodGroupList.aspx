<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AdminPanel.master" AutoEventWireup="true" CodeFile="BloodGroupList.aspx.cs" Inherits="Content_AdminPanel_BloodGroup_BloodGroupList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadContent" Runat="Server">
    BloodGroup List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphPageContent" Runat="Server">
<div class="container">
    <div class="row" style="padding-bottom:2em;padding-top:1.5em">
        <div class="col-md-12 text-right">
            <asp:Button ID="Button1" runat="server" Text="Add BloodGroup" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false" />
            <asp:GridView ID="gvBloodGroup" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowCommand="gvBloodGroup_RowCommand">
                <Columns>
                    <asp:BoundField DataField="BloodGroupID" HeaderText="ID" ItemStyle-Width="50px"/>
                    <asp:BoundField DataField="BloodGroupName" HeaderText="BloodGroup Name" ItemStyle-Width="200px"/>
                    <asp:TemplateField HeaderText="Oprations" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-sm btn-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("BloodGroupID") %>'/>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-sm btn-info" CommandName="EditRecord" CommandArgument='<%# "~/Content/AdminPanel/BloodGroup/BloodGroupAddEdit.aspx?BloodGroupID=" + Eval("BloodGroupID").ToString() %>'/>
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

