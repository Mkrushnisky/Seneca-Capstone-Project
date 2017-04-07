<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="A1___Website_UI.WebForm2" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=12.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Show Report" OnClick="Button1_Click" />
    </div>
    <div>
        <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="80%"></rsweb:ReportViewer>
    </div>
</asp:Content>
