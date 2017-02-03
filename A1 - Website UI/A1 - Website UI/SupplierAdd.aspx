<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SupplierAdd.aspx.cs" Inherits="A1___Website_UI.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 164px;
        }
        .auto-style2 {
            width: 94px;
        }
        .auto-style3 {
            width: 123px;
            height: 35px;
        }
        .auto-style4 {
            height: 35px;
        }
        .auto-style5 {
            width: 130px;
        }
        .auto-style6 {
            width: 123px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        <table>
    <tr>
        <th class="auto-style1"><h3>Supplier Add Form</h3></th>
        <th></th>
        <th></th>
        <th style="width: 635px"></th>
    </tr>
    <tr style="height:35px">
        <td class="auto-style1"><asp:CheckBox ID="CheckBox1" runat="server" Font-Size="Large" OnCheckedChanged="CheckBox1_CheckedChanged" Checked="false" AutoPostBack="true"/><label style="font-size: 13px;">Distributor?</label></td>     
        <td style="color:black;"><asp:DropDownList ID="DropDownList1" CssClass="txtbox" runat="server" Enabled="False" EnableTheming="True" Width="176px">
            <asp:ListItem>Choose Supplier</asp:ListItem>
            <asp:ListItem>YKK AP America Inc.</asp:ListItem>
            <asp:ListItem>Whitehall Industries</asp:ListItem>
            <asp:ListItem>Tri-City Extrusion Inc.</asp:ListItem>
            <asp:ListItem>Taber Extrusions LLC</asp:ListItem>
        </asp:DropDownList></td>
        <td></td>
        <td style="width: 635px" rowspan="8"">
            <table runat="server" BorderWidth="2" BorderColor="Black">
                <tr>
                    <th class="auto-style2" colspan="2"><h4 class="auto-style5">Add Contact</h4></th>
                    <th></th>
                </tr>
                <tr>
                    <td class="auto-style3" style="padding-left:5px">
                        <h5>First Name:</h5>
                    </td>
                    <td class="auto-style4">
                        <asp:TextBox ID="TextBox4" CssClass="txtbox" runat="server" Width="274px"></asp:TextBox>

                    </td>
                    <td class="auto-style4"></td>
                </tr>
                <tr style="height:35px">
                    <td class="auto-style6" style="padding-left:5px">
                        <h5>Last Name:</h5>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox7" CssClass="txtbox" runat="server" Width="274px"></asp:TextBox>

                    </td>
                    <td></td>
                </tr>
                <tr style="height:35px">
                    <td class="auto-style6" style="padding-left:5px">
                        <h5>Phone Number:</h5>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox9" CssClass="txtbox" runat="server" placeholder="123-456-7890" Width="274px"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr style="height:35px">
                    <td class="auto-style6" style="padding-left:5px">
                        <h5>Email:</h5>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox10" CssClass="txtbox" runat="server" Width="274px" placeholder="example@somplace.com"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr style="height:35px">
                    <td class="auto-style6" style="padding-left:5px">
                        <h5>Address:</h5>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox11" CssClass="txtbox" runat="server" Width="274px" placeholder="Street"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr style="height:35px">
                    <td class="auto-style6"></td>
                    <td style="color:black;">
                        <asp:TextBox ID="TextBox12" CssClass="txtbox" runat="server" placeholder="City"></asp:TextBox>
                        <asp:DropDownList ID="DropDownList3" CssClass="txtbox" runat="server" placeholder="Province">
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
                <tr style="height:35px">
                    <td class="auto-style6"></td>
                    <td>
                        <asp:TextBox ID="TextBox14" CssClass="txtbox" runat="server" placeholder="Country"></asp:TextBox>
                        <asp:TextBox ID="TextBox15" CssClass="txtbox" runat="server" placeholder="Postal Code"></asp:TextBox>
                    </td>
                    <td></td>
                </tr>
                <tr style="height:35px">
                    <td class="auto-style6"></td>
                    <td></td>
                    <td style="width:30px">
                        <asp:ImageButton ID="ImageButton1" CssClass="txtbox" runat="server" ImageUrl="image/add-button-white-md.png" Height="26px" Width="25px" />

                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style1"><h5>Supplier/Distributor Name:</h5></td>
        <td><asp:TextBox CssClass="txtbox" ID="TextBox1" runat="server" Width="274px"></asp:TextBox></td>
        <td></td>
        <td >

        </td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style1"><h5>Address:</h5></td>
        <td><asp:TextBox ID="TextBox2" CssClass="txtbox" runat="server" Width="273px" placeholder="Street Address"></asp:TextBox></td>
        <td></td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style1"></td>
        <td style="color:black;"><asp:TextBox CssClass="txtbox" ID="TextBox3" runat="server" placeholder="City"></asp:TextBox>
            <asp:DropDownList ID="DropDownList2" CssClass="txtbox" runat="server" placeholder="Province">
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
    <tr style="height:35px">
        <td class="auto-style1"></td>
        <td>
            <asp:TextBox ID="TextBox5" CssClass="txtbox" runat="server" placeholder="Country" Width="116px"></asp:TextBox>
            <asp:TextBox ID="TextBox6" CssClass="txtbox" runat="server" placeholder="Postal Code" Width="114px"></asp:TextBox>
        </td>
        <td></td>
    </tr>
    <tr>
        <td class="auto-style1"><h5>Category</h5></td>
        <td><h5>Sub-Category</h5></td>
        <td></td>
    </tr>
    <tr>
        <td style="color:black;" class="auto-style1"><asp:ListBox ID="ListBox3" runat="server" Width="150px" SelectionMode="Multiple">
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
    <tr style="height:35px">
        <td class="auto-style1"></td>
        <td style="text-align: right"">
            <asp:Button ID="Button1" runat="server" Text="Save" Width="62px" OnClick="Button1_Click"  />
            </td>
        <td>
            <asp:Button ID="Button2" runat="server" Text="Cancel" Width="73px" OnClick="Button2_Click" />
        </td>
    </tr>
    </table>
    </div>

</asp:Content>
