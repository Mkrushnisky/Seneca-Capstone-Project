<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SupplierEdit.aspx.cs" Inherits="A1___Website_UI.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        <table>
    <tr>
        <th style="width: 181px">Supplier Edit Form</th>
        <th></th>
        <th></th>
        <th style="width: 635px"></th>
    </tr>
    <tr>
        <td style="width: 181px"><asp:CheckBox ID="CheckBox1" runat="server" Enabled="false"  Checked="false" AutoPostBack="true" Text="Distributor?" /></td>     
        <td style="color:black;"><asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" EnableTheming="True" Width="176px">
            <asp:ListItem>Choose Supplier</asp:ListItem>
            <asp:ListItem>YKK AP America Inc.</asp:ListItem>
            <asp:ListItem>Whitehall Industries</asp:ListItem>
            <asp:ListItem>Tri-City Extrusion Inc.</asp:ListItem>
            <asp:ListItem>Taber Extrusions LLC</asp:ListItem>
        </asp:DropDownList></td>
        <td></td>
    </tr>
    <tr>
        <td style="width: 181px">Supplier/Distributor Name:</td>
        <td><asp:TextBox ID="TextBox1" runat="server" Width="274px">Whitehall Industries</asp:TextBox></td>
        <td></td>
        <td >

        </td>
    </tr>
    <tr>
        <td style="width: 181px">Address:</td>
        <td><asp:TextBox ID="TextBox2" runat="server" Width="273px" placeholder="Street Address">150 gg street</asp:TextBox></td>
        <td></td>
    </tr>
    <tr>
        <td style="width: 181px"></td>
        <td style="color:black;"><asp:TextBox ID="TextBox3" runat="server" placeholder="City">Toronto</asp:TextBox>
            <asp:DropDownList ID="DropDownList2" runat="server" placeholder="Province">
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
    <tr>
        <td style="width: 181px"></td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" placeholder="Country" Width="116px">Canada</asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server" placeholder="Postal Code" Width="114px">F1W 5S2</asp:TextBox>
        </td>
        <td></td>
    </tr>
    <tr>
        <td style="width: 181px">Category</td>
        <td>Sub-Category</td>
        <td></td>
    </tr>
    <tr>
        <td style="color:black; width: 181px"><asp:ListBox ID="ListBox3" runat="server" Width="150px">
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
    <tr>
        <td style="width: 181px"></td>
        <td style="text-align: right"">
            <asp:Button ID="Button1" runat="server" Text="Save" Width="62px"  />
            </td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Cancel" Width="73px" />
        </td>
    </tr>
    </table>
        <table>
            <tr>
                <th>
                    Contacts
                </th>
            </tr>
            <tr>
                <th>
                    First Name:
                </th>
                <th>
                    Last Name:
                </th>
                <th>
                    Phone Number:
                </th>
                 <th>
                     Email:
                </th>
                <th>
                    Street Address:
                </th>
                <th>
                    City:
                </th>
                 <th>
                     Province/State:
                </th>
                <th>
                    Country:
                </th>
                <th>
                    Postal/Zip Code:
                </th>
                <th>
                    
                </th>
            </tr>
             <tr>
                <td>
                    Tennouji
                </td>
                <td>
                    Kotarou
                </td>
                <td>
                    123-456-7890
                </td>
                 <td>
                     TennoujiKotarou@TrollForum.com
                </td>
                <td>
                    123 Stone Street
                </td>
                <td>
                    Kazamatsuri
                </td>
                 <td>
                     Unknown
                </td>
                <td>
                    Japan
                </td>
                <td>
                    1C2 4F2
                </td>
                 <td>
                     <asp:Button ID="Button3" runat="server" Text="Edit" />
                     <asp:Button ID="Button4" runat="server" Text="Delete" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </td>
                 <td>
                    <asp:TextBox ID="TextBox9" runat="server" Width="100%"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                </td>
                 <td>
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                </td>
                 <td>
                     <asp:Button ID="Button5" runat="server" Text="Add" />
                    
                </td>
            </tr>
            </table>
    </div>
        

</asp:Content>
