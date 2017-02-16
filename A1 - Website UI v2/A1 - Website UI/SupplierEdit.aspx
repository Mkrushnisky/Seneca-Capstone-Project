<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SupplierEdit.aspx.cs" Inherits="A1___Website_UI.SupplierEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 236px;
        }
        .auto-style7 {
            width: 96px;
        }
        .auto-style8 {
            width: 192px;
        }
        .auto-style9 {
            width: 318px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div>
        <table>
    <tr>
        <th class="auto-style1" colspan="2"><h3>Supplier Add Form</h3></th>
        <th class="auto-style7"></th>
        <th style="width: 635px"></th>
    </tr>
    <tr style="height:35px">
        <td class="auto-style8"><asp:CheckBox ID="DistributorCB" runat="server" Font-Size="Large" Checked="false" AutoPostBack="true"/><label style="font-size: 13px;">Distributor?</label></td>     
        <td style="color:black;" class="auto-style9"><asp:DropDownList ID="SupplierDDL" CssClass="txtbox" runat="server" Enabled="False" EnableTheming="True" Width="176px">
        </asp:DropDownList></td>
        <td class="auto-style7"></td>
        <td style="width: 635px" rowspan="8"">
            <table runat="server" borderwidth="2" bordercolor="White">
                <tr>
                    <th colspan="6">
                        <h3>Add Sub-Categories</h3>
                    </th>
                </tr>
                <tr>
                    <th>
                        <h5>Category:</h5>
                    </th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="color:black">
                        <asp:DropDownList ID="CategoryDropDown" runat="server" CssClass="txtbox" Height="16px" Width="188px" AutoPostBack="true" OnSelectedIndexChanged="CategoryDropDown_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <th>
                        <h5>Sub-Category:</h5>
                    </th>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td style="color:black">
                        <asp:ListBox ID="SubCategoryListBox" runat="server" Width="219px" Height="168px"></asp:ListBox>
                    </td>
                    <td>
                        <asp:ImageButton ID="ImageButton1" runat="server" Height="55px" ImageUrl="~/Image/nexkk371.bmp" Width="55px" OnClick="ImageButton1_Click" />
                    </td>
                    <td style="color:black">
                        <asp:ListBox ID="ToAddListBox" runat="server" Width="219px" Height="168px" SelectionMode="Multiple"></asp:ListBox>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style8"><h5>Supplier/Distributor Name:</h5></td>
        <td class="auto-style9"><asp:TextBox CssClass="txtbox" ID="SupplierNameTB" runat="server" Width="274px"></asp:TextBox></td>
        <td class="auto-style7"></td>
        <td >

        </td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style8"><h5>Address:</h5></td>
        <td class="auto-style9"><asp:TextBox ID="StreetTB" CssClass="txtbox" runat="server" Width="273px" placeholder="Street Address"></asp:TextBox></td>
        <td class="auto-style7"></td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style8">
            <asp:TextBox ID="GetSupNum" runat="server" Visible="false" Width="26px" ></asp:TextBox>
            <asp:TextBox ID="Addressid" runat="server" Width="42px" Visible="false"></asp:TextBox>
            <asp:HiddenField ID="SupIdHF" runat="server" Value="13" />
            <asp:ListBox ID="subcatlistboxcount" runat="server" Visible="true"></asp:ListBox>
        </td>
        <td style="color:black;" class="auto-style9"><asp:TextBox CssClass="txtbox" ID="CityTB" runat="server" placeholder="City" Width="115px"></asp:TextBox>
            <asp:DropDownList ID="CountryDDL" runat="server" CssClass="txtbox" OnSelectedIndexChanged="CountryDDL_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem Value="0" Text="--- Choose Country ---"></asp:ListItem>
                <asp:ListItem Value ="1">Canada</asp:ListItem>
                <asp:ListItem Value="2">United States</asp:ListItem>
                <asp:ListItem>Mexico</asp:ListItem>
                <asp:ListItem>China</asp:ListItem>
                <asp:ListItem>Japan</asp:ListItem>
                <asp:ListItem>Germany</asp:ListItem>
                <asp:ListItem>Russia</asp:ListItem>
                <asp:ListItem>UK</asp:ListItem>
                <asp:ListItem>France</asp:ListItem>
                <asp:ListItem>Italy</asp:ListItem>
                <asp:ListItem>Egypt</asp:ListItem>
                <asp:ListItem>Barzil</asp:ListItem>
                <asp:ListItem>Chile</asp:ListItem>
                <asp:ListItem>Finland</asp:ListItem>
                <asp:ListItem>Greece</asp:ListItem>
                <asp:ListItem>Iceland</asp:ListItem>
                <asp:ListItem>Korea, South</asp:ListItem>
                <asp:ListItem>Netherlands</asp:ListItem>
                <asp:ListItem>Philippines</asp:ListItem>
                <asp:ListItem>Romania</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="auto-style7"></td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style8"></td>
        <td class="auto-style9" style="color:black">
            <asp:DropDownList ID="ProvinceDDL" CssClass="txtbox" runat="server" Enabled="false" Width="115px"></asp:DropDownList>
            <asp:TextBox ID="PostalCodeTB" CssClass="txtbox" runat="server" placeholder="Postal Code" Width="115px"></asp:TextBox>
        </td>
        <td class="auto-style7"></td>
    </tr>
    <tr>
        <td class="auto-style8">&nbsp;</td>
        <td class="auto-style9">&nbsp;</td>
        <td class="auto-style7"></td>
    </tr>
    <tr>
        <td style="color:black; vertical-align:top;" class="auto-style8">
            &nbsp;</td>
        <td style="color:black;" class="auto-style9">
                        &nbsp;</td>
        <td class="auto-style7"></td>
    </tr>
    <tr style="height:35px">
        <td class="auto-style8">&nbsp;</td>
        <td style="text-align: right"" class="auto-style9">
            <asp:Button ID="UpdateButton" runat="server" Text="Save" Width="62px" OnClick="UpdateButton_Click"  />
            </td>
        <td class="auto-style7">
            <asp:Button ID="CancelButton" runat="server" Text="Cancel" Width="73px" OnClick="CancelButton_Click" />
        </td>
    </tr>
    </table>
    </div>
</asp:Content>
