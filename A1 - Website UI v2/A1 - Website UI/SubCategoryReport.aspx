<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SubCategoryReport.aspx.cs" Inherits="A1___Website_UI.SubCategoryReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="row">
        <div class="jumbotron">
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" BorderStyle="None" Width="100%" Height="100%" AsyncRendering="False" SizeToReportContent="True" ShowPageNavigationControls="false" ShowRefreshButton="false">

                </rsweb:ReportViewer>
        </div>
    </div>
</asp:Content>
