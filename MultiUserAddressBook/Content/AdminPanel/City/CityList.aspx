<%@ Page Title="" Language="C#" MasterPageFile="~/Content/AdminPanel.master" AutoEventWireup="true" CodeFile="CityList.aspx.cs" Inherits="Content_AdminPanel_City_CityList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphHeadContent" Runat="Server">
    City List
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphPageContent" Runat="Server">
<div class="container">
    <div class="row" style="padding-bottom:2em;padding-top:1.5em">
        <div class="col-md-12 text-right">
            <asp:Button ID="btnAdd" runat="server" Text="Add City" CssClass="btn btn-primary" OnClick="btnAdd_Click" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblErrorMessage" runat="server" CssClass="text-danger" EnableViewState="false" />
            <asp:GridView ID="gvCity" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped" OnRowCommand="gvCity_RowCommand">
                <Columns>
                    <asp:BoundField DataField="CityID" HeaderText="ID" ItemStyle-Width="50px"/>
                    <asp:BoundField DataField="CityName" HeaderText="City Name" ItemStyle-Width="150px"/>
                    <asp:BoundField DataField="Pincode" HeaderText="Pincode" ItemStyle-Width="100px"/>
                    <asp:BoundField DataField="StateName" HeaderText="State Name" ItemStyle-Width="100px"/>
                    <asp:BoundField DataField="STDCode" HeaderText="Std Code" ItemStyle-Width="100px"/>
                    <asp:TemplateField HeaderText="Oprations" ItemStyle-Width="50px">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-sm btn-danger" CommandName="DeleteRecord" CommandArgument='<%# Eval("CityID") %>'/>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" CssClass="btn btn-sm btn-info" CommandName="EditRecord" CommandArgument='<%# "~/Content/AdminPanel/City/CityAddEdit.aspx?CityID=" + Eval("CityID").ToString() %>'/>
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