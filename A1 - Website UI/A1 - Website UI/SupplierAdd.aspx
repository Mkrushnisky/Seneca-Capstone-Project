<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SupplierAdd.aspx.cs" Inherits="A1___Website_UI.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        <table>
    <tr>
        <th style="width: 181px">Supplier Add Form</th>
        <th></th>
        <th></th>
        <th style="width: 635px"></th>
    </tr>
    <tr>
        <td style="width: 181px"><asp:CheckBox ID="CheckBox1" runat="server" OnCheckedChanged="CheckBox1_CheckedChanged" Checked="false" AutoPostBack="true" Text="Distributor?" /></td>     
        <td style="color:black;"><asp:DropDownList ID="DropDownList1" runat="server" Enabled="False" EnableTheming="True" Width="176px">
            <asp:ListItem>Choose Supplier</asp:ListItem>
            <asp:ListItem>YKK AP America Inc.</asp:ListItem>
            <asp:ListItem>Whitehall Industries</asp:ListItem>
            <asp:ListItem>Tri-City Extrusion Inc.</asp:ListItem>
            <asp:ListItem>Taber Extrusions LLC</asp:ListItem>
        </asp:DropDownList></td>
        <td></td>
        <td style="width: 635px" rowspan="8">
            <table runat="server" BorderWidth="2" BorderColor="Black">
                <tr>
                    <th>Add Contact</th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <td>
                        First Name:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="274px"></asp:TextBox>

                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        Last Name:
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" Width="274px"></asp:TextBox>

                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td>
                        <asp:TextBox ID="TextBox8" runat="server" Width="31px"></asp:TextBox>
                        - 
                        <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="TextBox10" runat="server" Width="274px" placeholder="example@somplace.com"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td>
                        <asp:TextBox ID="TextBox11" runat="server" Width="274px" placeholder="Street"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="color:black;">
                        <asp:TextBox ID="TextBox12" runat="server" placeholder="City"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList3" runat="server" placeholder="Province">
                            <asp:ListItem>Province</asp:ListItem>
                            <asp:ListItem>AL</asp:ListItem>
                            <asp:ListItem>NL</asp:ListItem>
                            <asp:ListItem>BC</asp:ListItem>
                            <asp:ListItem>NS</asp:ListItem>
                            <asp:ListItem>NB</asp:ListItem>
                            <asp:ListItem>MA</asp:ListItem>
                            <asp:ListItem>ON</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:TextBox ID="TextBox14" runat="server" placeholder="Country"></asp:TextBox>
                        <asp:TextBox ID="TextBox15" runat="server" placeholder="Postal Code"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="image/add-button-md.png" Height="26px" Width="25px" />

                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td>&nbsp;</td>
                    <td></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td style="width: 181px">Supplier/Distributor Name:</td>
        <td><asp:TextBox ID="TextBox1" runat="server" Width="274px"></asp:TextBox></td>
        <td></td>
        <td >

        </td>
    </tr>
    <tr>
        <td style="width: 181px">Address:</td>
        <td><asp:TextBox ID="TextBox2" runat="server" Width="273px" placeholder="Street Address"></asp:TextBox></td>
        <td></td>
    </tr>
    <tr>
        <td style="width: 181px"></td>
        <td style="color:black;"><asp:TextBox ID="TextBox3" runat="server" placeholder="City"></asp:TextBox>
            <asp:DropDownList ID="DropDownList2" runat="server" placeholder="Province">
            <asp:ListItem>Province</asp:ListItem>
            <asp:ListItem>ALB</asp:ListItem>
            <asp:ListItem>NL</asp:ListItem>
            <asp:ListItem>BC</asp:ListItem>
            <asp:ListItem>NS</asp:ListItem>
            <asp:ListItem>NB</asp:ListItem>
            <asp:ListItem>MA</asp:ListItem>
            <asp:ListItem>ON</asp:ListItem>
        </asp:DropDownList>
        </td>
        <td></td>
    </tr>
    <tr>
        <td style="width: 181px"></td>
        <td>
            <asp:TextBox ID="TextBox5" runat="server" placeholder="Country" Width="116px"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server" placeholder="Postal Code" Width="114px"></asp:TextBox>
        </td>
        <td></td>
    </tr>
    <tr>
        <td style="width: 181px">Category</td>
        <td>Sub-Category</td>
        <td></td>
    </tr>
    <tr>
        <td style="color:black; width: 181px"><asp:ListBox ID="ListBox3" runat="server" Width="150px" SelectionMode="Multiple">
                        <asp:ListItem>Plastics</asp:ListItem>
                        <asp:ListItem>Chemicals</asp:ListItem>
                        <asp:ListItem>Steel</asp:ListItem>
                        <asp:ListItem>Electronics</asp:ListItem>
                    </asp:ListBox>
        </td>
        <td style="color:black;">
            <asp:ListBox ID="ListBox4" runat="server" Width="150px" SelectionMode="Multiple">
                        <asp:ListItem>Pipes</asp:ListItem>
                        <asp:ListItem>Sheet</asp:ListItem>
                        <asp:ListItem>Ingot</asp:ListItem>
                        <asp:ListItem>Wire</asp:ListItem>
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
    </div>

</asp:Content>
