<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SearchMenu.aspx.cs" Inherits="A1___Website_UI.SearchMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 415px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">

    <table style="margin:auto">
        <tr>
            <th></th>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <th></th>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <th></th>
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <th colspan="2" style="text-align:center">
                <h3>Supplier Search</h3>    
            </th>
        </tr>
        <tr>
            <td></td>
        </tr>
        <tr style="height:35px">
            <td style="font-weight:700; text-align:right">
                <h5>Category</h5>   
            </td>
            <td  style="text-align:left; padding-left:15px" class="auto-style1">
                <asp:DropDownList ID="DropDownCategory" CssClass="txtbox" runat="server" Width="300px" style="color:black;" AutoPostBack="true" OnSelectedIndexChanged="DropDownCategory_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="height:35px">
            <td style="font-weight:700; text-align:right">
                <h5>Sub-Category</h5>   
            </td>
            <td style="text-align:left; padding-left:15px" class="auto-style1">
                <asp:DropDownList ID="DropDownSubCategory" CssClass="txtbox" runat="server" Width="300px" style="color:black;" AutoPostBack="True" OnSelectedIndexChanged="DropDownSubCategory_SelectedIndexChanged" >
                </asp:DropDownList>
            </td>
        </tr>
        <tr style="height:35px">
            <td style="font-weight:700; text-align:right">
                <h5>Supplier</h5>   
            </td>
            <td style="text-align:left; padding-left:15px" class="auto-style1">
                <asp:DropDownList ID="DropDownSupplier" CssClass="txtbox" runat="server" Width="300px" style="color:black;" OnSelectedIndexChanged="DropDownSupplier_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right">
                <asp:Button ID="Button1" runat="server" Text="Search" Enabled="false" OnClick="Button1_Click" />
            </td>
        </tr>


    </table>

</asp:Content>
