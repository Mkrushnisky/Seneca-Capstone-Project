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
                <asp:DropDownList ID="CategoryDropDownList" CssClass="txtbox" runat="server" Width="300px" style="color:black;" DataSourceID="CategoryDataSource" DataTextField="CName" DataValueField="CatId" AutoPostBack="True" AppendDataBoundItems="true" OnSelectedIndexChanged="CategoryDropDownList_SelectedIndexChanged" InitialValue="NA" >

                </asp:DropDownList>
                <asp:SqlDataSource ID="CategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BTSDatabase %>" ProviderName="<%$ ConnectionStrings:BTSDatabase.ProviderName %>" SelectCommand="SELECT * FROM Category">

                </asp:SqlDataSource>
            </td>
        </tr>
        <tr style="height:35px">
            <td style="font-weight:700; text-align:right">
                <h5>Sub-Category</h5>   
            </td>
            <td style="text-align:left; padding-left:15px" class="auto-style1">
                <asp:DropDownList ID="SubCategoryDropDownList" CssClass="txtbox" runat="server" Width="300px" style="color:black;" DataSourceID="SubCategoryDataSource" DataTextField="SCName" DataValueField="SubCatId" AutoPostBack="True" AppendDataBoundItems="true">
                      <asp:ListItem Text="" Value="0" />
                </asp:DropDownList>
                <asp:SqlDataSource ID="SubCategoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BTSDatabase %>" ProviderName="<%$ ConnectionStrings:BTSDatabase.ProviderName %>" SelectCommand="SELECT * FROM SubCategory WHERE (CatId = ?)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="CategoryDropDownList" Name="CatId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr style="height:35px">
            <td style="font-weight:700; text-align:right">
                <h5>Supplier</h5>   
            </td>
            <td style="text-align:left; padding-left:15px" class="auto-style1">
                <asp:DropDownList ID="SupplierDropDownList" CssClass="txtbox" runat="server" Width="300px" style="color:black;" DataSourceID="SupplierDataSource" DataTextField="SName" DataValueField="SupId">

                </asp:DropDownList>
                <asp:SqlDataSource ID="SupplierDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:BTSDatabase %>" ProviderName="<%$ ConnectionStrings:BTSDatabase.ProviderName %>" SelectCommand="SELECT Supplier.* FROM SubCatSupplier INNER JOIN SubCategory ON SubCatSupplier.SubCatId = SubCategory.SubCatId INNER JOIN Supplier ON SubCatSupplier.SupId = Supplier.SupId WHERE (SubCatSupplier.SubCatId = ? AND SubCatSupplier.SupId = Supplier.SupId)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="SubCategoryDropDownList" Name="SubCatId" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:right">
                <asp:Button ID="SearchButton" runat="server" Text="Search" OnClick="Button1_Click" />
            </td>
        </tr>


    </table>

</asp:Content>
