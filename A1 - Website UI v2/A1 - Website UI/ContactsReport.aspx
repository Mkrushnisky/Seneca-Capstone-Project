<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="ContactsReport.aspx.cs" Inherits="A1___Website_UI.ContactsReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="row">
        <div class="jumbotron">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="500px" AsyncRendering="False" ShowBackButton="false" ShowFindControls="false" SizeToReportContent="True" ShowPageNavigationControls="false" ShowRefreshButton="false">

                </rsweb:ReportViewer>
        </div>
    </div>
</asp:Content>
