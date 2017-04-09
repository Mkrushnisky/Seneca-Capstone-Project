<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="CategoryAdd.aspx.cs" Inherits="A1___Website_UI.CategoryAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
     <div class="container-fluid">
        <div class="row">
            <div class="row">
                <div class="col-md-4">
                    <h3>Add New Category</h3>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
                </div>
                <div class="col-md-3">
                </div>
            </div>
            <div class="row" style="padding-top:50px">
                <div class="col-md-4">
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="CategoryTB" CssClass="form-control" runat="server" placeholder="Category Name"></asp:TextBox>
                </div>
                <div class="col-md-3">
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-3" style="text-align:right; padding-top:7px">
                    <asp:Button ID="SaveBT" CssClass="btn-primary " runat="server" Text="Save" OnClick="SaveBT_Click"  ValidationGroup="Validation"/>
                    <asp:Button ID="CancelBT" CssClass="" runat="server" Text="Cancel" OnClick="CancelBT_Click" />
                </div>
                <div class="col-md-3">
                </div>
            </div>
            <div class="row" style="padding-top:50px">
                <label for="TextBox1" class="control-label" style="">*Make sure that the Category you are adding does not already exist with a different spelling.</label>
            </div>
        </div>
    </div>

    <%--validation for Category's name--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="CategoryTB"
            Display="None" ErrorMessage="Category Name is Required" ValidationGroup="Validation"></asp:RequiredFieldValidator>

    <%--validation group for Category add--%>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="Validation" />
   
</asp:Content>
