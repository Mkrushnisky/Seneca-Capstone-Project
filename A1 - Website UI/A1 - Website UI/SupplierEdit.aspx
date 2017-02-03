<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SupplierEdit.aspx.cs" Inherits="A1___Website_UI.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 101px;
        }
        .auto-style2 {
            width: 185px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        <table>
    <tr>
        <th class="auto-style2"><h3>Supplier Edit Form</h3></th>
        <th></th>
        <th></th>
        <th style="width: 635px"></th>
    </tr>
    <tr style="height:35px">
        <td class="auto-style2"><asp:CheckBox ID="CheckBox1" runat="server" Enabled="false"  Checked="false" AutoPostBack="true"/><label style="font-size: 13px;">Distributor?</label></td>     
        <td style="color:black;"><asp:DropDownList ID="DropDownList1" CssClass="txtbox" runat="server" Enabled="False" EnableTheming="True" Width="176px">
            <asp:ListItem>Choose Supplier</asp:ListItem>
            <asp:ListItem>YKK AP America Inc.</asp:ListItem>
            <asp:ListItem>Whitehall Industries</asp:ListItem>
            <asp:ListItem>Tri-City Extrusion Inc.</asp:ListItem>
            <asp:ListItem>Taber Extrusions LLC</asp:ListItem>
        </asp:DropDownList></td>
        <td></td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style2"><h5>Supplier/Distributor Name:</h5></td>
        <td><asp:TextBox ID="TextBox1" CssClass="txtbox" runat="server" Width="274px">Whitehall Industries</asp:TextBox></td>
        <td></td>
        <td >

        </td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style2"><h5>Address:</h5></td>
        <td><asp:TextBox ID="TextBox2" CssClass="txtbox" runat="server" Width="273px" placeholder="Street Address">150 gg street</asp:TextBox></td>
        <td></td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style2"></td>
        <td style="color:black;"><asp:TextBox ID="TextBox3" CssClass="txtbox" runat="server" placeholder="City">Toronto</asp:TextBox>
            <asp:DropDownList ID="DropDownList2" CssClass="txtbox" runat="server" placeholder="Province">
            <asp:ListItem>Province</asp:ListItem>
            <asp:ListItem>ALB</asp:ListItem>
            <asp:ListItem>NL</asp:ListItem>
            <asp:ListItem>BC</asp:ListItem>
            <asp:ListItem>NS</asp:ListItem>
            <asp:ListItem>NB</asp:ListItem>
            <asp:ListItem>MA</asp:ListItem>
            <asp:ListItem Selected="True">ON</asp:ListItem>
        </asp:DropDownList>
        </td>
        <td></td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style2"></td>
        <td>
            <asp:TextBox ID="TextBox5" CssClass="txtbox" runat="server" placeholder="Country" Width="116px">Canada</asp:TextBox>
            <asp:TextBox ID="TextBox6" CssClass="txtbox" runat="server" placeholder="Postal Code" Width="114px">F1W 5S2</asp:TextBox>
        </td>
        <td></td>
    </tr>
    <tr>
        <td class="auto-style2"><h5>Category</h5></td>
        <td><h5>Sub-Category</h5></td>
        <td></td>
    </tr>
    <tr>
        <td style="color:black; " class="auto-style2"><asp:ListBox ID="ListBox3" runat="server" Width="150px">
                    <asp:ListItem>Plastics</asp:ListItem>
                    <asp:ListItem Selected="True">Chemicals</asp:ListItem>
                    <asp:ListItem>Steel</asp:ListItem>
                    <asp:ListItem>Electronics</asp:ListItem>
                    </asp:ListBox>
        </td>
        <td style="color:black;">
            <asp:ListBox ID="ListBox4" runat="server" Width="150px" SelectionMode="Multiple">
                        <asp:ListItem>Polyurethanes</asp:ListItem>
                        <asp:ListItem>Acrylic</asp:ListItem>
                        <asp:ListItem>Carbon Black - Fillers</asp:ListItem>
                        <asp:ListItem>FBE - Paints</asp:ListItem>
                        <asp:ListItem>Galvanizing</asp:ListItem>
                        <asp:ListItem>Steel Bars</asp:ListItem>
                        <asp:ListItem>Batteries</asp:ListItem>
                        <asp:ListItem>Sensors</asp:ListItem>
                    </asp:ListBox>
        </td>
        <td></td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style2"></td>
        <td style="text-align: right"">
            <asp:Button ID="Button1" runat="server" Text="Save" Width="62px" OnClick="Button1_Click"  />
            </td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Cancel" Width="73px" OnClick="Button2_Click" />
        </td>
    </tr>
    </table>
        <table>
            <tr>
                <th>
                    <h5>Contacts</h5>
                </th>
            </tr>
            <tr style="border:solid 1px lightgray">
                <th style="border:solid 1px lightgray">
                    First Name:
                </th>
                <th style="border:solid 1px lightgray">
                    Last Name:
                </th>
                <th style="border:solid 1px lightgray">
                    Phone Number:
                </th>
                 <th style="border:solid 1px lightgray">
                     Email:
                </th>
                <th style="border:solid 1px lightgray">
                    Street Address:
                </th>
                <th style="border:solid 1px lightgray">
                    City:
                </th>
                 <th style="border:solid 1px lightgray">
                     Province/State:
                </th>
                <th style="border:solid 1px lightgray">
                    Country:
                </th>
                <th style="border:solid 1px lightgray">
                    Postal/Zip Code:
                </th>
                <th class="auto-style1" style="border:solid 1px lightgray">
                    
                </th>
            </tr>
             <tr style="height:35px; border:solid 1px lightgray">
                <td style="border:solid 1px lightgray">
                    Tennouji
                </td>
                <td style="border:solid 1px lightgray">
                    Kotarou
                </td>
                <td style="border:solid 1px lightgray">
                    123-456-7890
                </td>
                 <td style="border:solid 1px lightgray">
                     TennoujiKotarou@TrollForum.com
                </td>
                <td style="border:solid 1px lightgray">
                    123 Stone Street
                </td>
                <td style="border:solid 1px lightgray">
                    Kazamatsuri
                </td>
                 <td style="border:solid 1px lightgray">
                     Unknown
                </td>
                <td style="border:solid 1px lightgray">
                    Japan
                </td>
                <td style="border:solid 1px lightgray">
                    1C2 4F2
                </td>
                 <td class="auto-style1" style="text-align:center">
                     <asp:Button ID="Button3" runat="server" Text="Edit" />
                     <asp:Button ID="Button4" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr style="height:35px; border:solid 1px lightgray">
                <td style="width:100px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox4" CssClass="txtbox" runat="server" Width="90%"></asp:TextBox>
                </td>
                <td style="width:100px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox7" CssClass="txtbox" runat="server" Width="90%"></asp:TextBox>
                </td>
                <td style="width:100px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox8" CssClass="txtbox" runat="server" Width="90%"></asp:TextBox>
                </td>
                 <td style="width:200px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox9" CssClass="txtbox" runat="server" Width="95%"></asp:TextBox>
                </td>
                <td style="width:100px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox10" CssClass="txtbox" runat="server" Width="90%"></asp:TextBox>
                </td>
                <td style="width:100px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox11" CssClass="txtbox" runat="server" Width="90%"></asp:TextBox>
                </td>
                 <td style="width:100px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox12" CssClass="txtbox" runat="server" Width="90%"></asp:TextBox>
                </td>
                <td style="width:100px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox13" CssClass="txtbox" runat="server" Width="90%"></asp:TextBox>
                </td>
                <td style="width:100px; text-align:center;border:solid 1px lightgray">
                    <asp:TextBox ID="TextBox14" CssClass="txtbox" runat="server" Width="90%"></asp:TextBox>
                </td>
                 <td class="auto-style1" style="text-align:center; border:solid 1px lightgray">
                     <asp:Button ID="Button5" runat="server" Text="Add" />
                    
                </td>
            </tr>
            </table>
    </div>
        

</asp:Content>
