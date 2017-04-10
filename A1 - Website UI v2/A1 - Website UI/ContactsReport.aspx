<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="ContactsReport.aspx.cs" Inherits="A1___Website_UI.ContactsReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="row">
        <div class="col-md-3 col-md-offset-1">
        <label class="col-sm-10 control-label" style="font-size: 17px;">Category</label>
        <asp:DropDownList ID="CategoryDropDown" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="CategoryDropDown_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-md-3">
            <label class="col-sm-10 control-label" style="font-size: 17px;">SubCategory</label>
        <asp:DropDownList ID="SubCatDropDown" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="SubCatDropDown_SelectedIndexChanged">
            </asp:DropDownList>
        </div>
        <div class="col-md-1" style="padding-top:22px">
            <asp:Button ID="ClearBTN" runat="server" Text="Clear" OnClick="ClearBTN_Click" CssClass="btn-primary btn-sm" />
        </div>
    </div>
    <div class="row">
        <div class="jumbotron" align="center">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="821px" Height="500px" AsyncRendering="false" ShowBackButton="false" ShowFindControls="false" ShowPageNavigationControls="true" ShowRefreshButton="false">

                </rsweb:ReportViewer>
        </div>
    </div>
</asp:Content>
