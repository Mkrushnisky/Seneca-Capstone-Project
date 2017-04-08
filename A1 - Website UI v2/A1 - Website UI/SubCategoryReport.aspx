<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SubCategoryReport.aspx.cs" Inherits="A1___Website_UI.SubCategoryReport" %>

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
    </div>
    <div class="row" >
        <div class="jumbotron" align="center">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="643px" Height="500px" ShowPageNavigationControls="true" ShowBackButton="false" ShowFindControls="false" ShowRefreshButton="false">

                </rsweb:ReportViewer>
        </div>
    </div>
</asp:Content>
