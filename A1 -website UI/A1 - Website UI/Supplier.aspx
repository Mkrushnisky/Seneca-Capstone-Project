<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="Supplier.aspx.cs" Inherits="A1___Website_UI.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        Add Supplier/Distributor
        <br />
        <asp:RadioButton ID="RadioButton1" runat="server" />
        Distributor?
    <asp:DropDownList ID="DropDownList1" runat="server" disabled="disabled">

        <asp:ListItem Value="0" Selected="True|False">
            Choose Supplier
        </asp:ListItem>
    </asp:DropDownList>
        <br />
        Name 
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        Address
        <asp:TextBox ID="TextBox2" runat="server">Street Address</asp:TextBox>
        <br />
        <asp:TextBox ID="TextBox3" runat="server">City</asp:TextBox>
        <asp:DropDownList ID="DropDownList2" runat="server">

            <asp:ListItem Value="0" Selected="True|False">
            Province
            </asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:TextBox ID="TextBox4" runat="server">Country</asp:TextBox>
        <asp:TextBox ID="TextBox5" runat="server">Postal Code</asp:TextBox>
        <br />
        Category            Sub-Category
        <br />
        <asp:ListBox ID="ListBox1" runat="server" SelectionMode="Multiple">
            <asp:ListItem Value="0">
            Item1
            </asp:ListItem>
            <asp:ListItem Value="1">
            Item2
            </asp:ListItem>

        </asp:ListBox>
         <asp:ListBox ID="ListBox2" runat="server" SelectionMode="Multiple">
            <asp:ListItem Value="0">
            Item1
            </asp:ListItem>
             <asp:ListItem Value="1">
            Item2
            </asp:ListItem>

        </asp:ListBox>



        <asp:Button ID="Button1" runat="server" Text="Save" />
        <asp:Button ID="Button2" runat="server" Text="Cancel" />
    </div>

</asp:Content>
