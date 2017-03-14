<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SupplierAdd.aspx.cs" Inherits="A1___Website_UI.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%--    <style type="text/css">
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
    </style>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="row">
                <div class="col-md-5">
                <h3>Add New Supplier</h3>
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="GetSupNum" runat="server" Visible="false" Width="26px"></asp:TextBox>
                    <asp:TextBox ID="Addressid" runat="server" Width="42px" Visible="false"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-5">
                <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="Large" OnCheckedChanged="CheckBox1_CheckedChanged" Checked="false" AutoPostBack="true"/>
                <label for="CheckBox1" style="font-size: 17px;">Distributor?</label>

                <asp:DropDownList ID="DropDownList1" cssclass="form-control" runat="server" Visible="False" EnableTheming="True">
                </asp:DropDownList>
                <div class="form-group">
                    <label for="TextBox1" class="col-sm-10 control-label" style="font-size: 17px;">Name</label>
                    <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Supplier/Distributor Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="StreetTB" class="col-sm-10 control-label" style="font-size: 17px;">Supplier Name</label>
                    <asp:TextBox ID="StreetTB" CssClass="form-control" runat="server" placeholder="Street Address"></asp:TextBox>
                    <div class="form-inline" style="padding-top:10px">
                        <asp:TextBox CssClass="form-control" ID="CityTB" runat="server" placeholder="City" Width="49%"></asp:TextBox>

                        <asp:DropDownList ID="CountryDDL" runat="server" CssClass="form-control" OnSelectedIndexChanged="CountryDDL_SelectedIndexChanged" AutoPostBack="True" Width="50%">
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
                    </div>
                    <div class="form-inline" style="padding-top:10px">
                        <asp:DropDownList ID="ProvinceDDL" CssClass="form-control" runat="server" Enabled="false" Width="49%"></asp:DropDownList>
                        <asp:TextBox ID="PostalCodeTB" CssClass="form-control" runat="server" placeholder="Postal Code" Width="50%"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <h3>Add Main Contact</h3>
                </div>
                <div class="form-group">
                    <div class="form-inline">
                        <label for="FNameTB" class="col-sm-10 control-label" style="font-size: 17px;">Name</label>
                        <asp:TextBox ID="FNameTB" CssClass="form-control" runat="server" placeholder="First Name" Width="49%"></asp:TextBox>
                        <asp:TextBox ID="LNameTB" CssClass="form-control" runat="server" placeholder="Last Name" Width="50%"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="CStreetTB" class="col-sm-10 control-label" style="font-size: 17px;">Address</label>
                        <asp:TextBox ID="CStreetTB" CssClass="form-control" runat="server" placeholder="Street Address"></asp:TextBox>
                        <div class="form-inline">

                        </div>
                        <div class="form-inline" style="padding-top:10px">
                            <asp:TextBox CssClass="form-control" ID="CCityTB" runat="server" placeholder="City" Width="49%"></asp:TextBox>
                            <asp:DropDownList ID="CCountryDDL" runat="server" CssClass="form-control" OnSelectedIndexChanged="CCountryDDL_SelectedIndexChanged" AutoPostBack="True" Width="50%">
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
                        </div>
                        <div class="form-inline" style="padding-top:10px">
                            <asp:DropDownList ID="CProvinceDDL" CssClass="form-control" runat="server" Enabled="false" Width="49%"></asp:DropDownList>
                            <asp:TextBox ID="CPostalCodeTB" CssClass="form-control" runat="server" placeholder="Postal Code" Width="50%"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="CEmailTB" class="col-sm-10 control-label" style="font-size: 17px;">Email</label>
                        <asp:TextBox ID="CEmailTB" CssClass="form-control" runat="server" placeholder="example@somewhere.com"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label for="WorkTB" class="col-sm-10 control-label" style="font-size: 17px;">Phone Numbers</label>
                        <asp:TextBox ID="WorkTB" CssClass="form-control" runat="server" placeholder="Work Phone"></asp:TextBox>
                        <div style="padding-top:10px">
                            <asp:TextBox CssClass="form-control" ID="CellTB" runat="server" placeholder="Cell Phone"></asp:TextBox>
                        </div>                    
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="jumbotron" style="border:3px solid #ffffff">
                    <div class="row">
                        <h3>Add Sub-Categories</h3>
                    </div>
                    <div class="form-group">
                        <label for="CategoryDropDown" class="col-sm-10 control-label" style="font-size: 17px;">Category</label>
                        <asp:DropDownList ID="CategoryDropDown" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="CategoryDropDown_SelectedIndexChanged">
                            </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <div class="form-inline">
                            <asp:ListBox ID="SubCategoryListBox" CssClass="form-control" runat="server" Width="45%" Height="168px"></asp:ListBox>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" Width="25px" ImageUrl="~/Image/nexkk371.bmp"  OnClick="ImageButton1_Click"/>
                            <asp:ListBox ID="ToAddListBox" CssClass="form-control" runat="server" Width="45%" Height="168px" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                </div>                          
            </div>   
        </div>
        <div class="row" style="text-align:center">
            <asp:Button ID="Button1" CssClass="btn-primary btn-lg" runat="server" Text="Save" OnClick="Button1_Click"  />
            <asp:Button ID="Button2" CssClass="btn-lg" runat="server" Text="Cancel" OnClick="Button2_Click" />
        </div>
    </div>













    <%--<div>
        <table>
    <tr>
        <th class="auto-style1" colspan="2"><h3>Supplier Add Form</h3></th>
        <th class="auto-style7"></th>
        <th style="width: 635px"></th>
    </tr>
    <tr style="height:35px">
        <td class="auto-style8"><asp:CheckBox ID="CheckBox1" runat="server" Font-Size="Large" OnCheckedChanged="CheckBox1_CheckedChanged" Checked="false" AutoPostBack="true"/><label style="font-size: 13px;">Distributor?</label></td>     
        <td style="color:black;" class="auto-style9"><asp:DropDownList ID="DropDownList1" CssClass="txtbox" runat="server" Enabled="False" EnableTheming="True" Width="176px">
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
        <td class="auto-style9"><asp:TextBox CssClass="txtbox" ID="TextBox1" runat="server" Width="274px"></asp:TextBox></td>
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
            <asp:TextBox ID="GetSupNum" runat="server" Visible="false" Width="26px"></asp:TextBox>
            <asp:TextBox ID="Addressid" runat="server" Width="42px" Visible="false"></asp:TextBox>
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
    <tr>
        <td></td>
    </tr>
    <tr>
        <th colspan="2">
            <h3>Add Main Contact</h3>
        </th>
    </tr>
    <tr>
        <td colspan="2">
            <table>
                <tr>
                    <td></td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <h5>Name: </h5>
                    </td>
                    <td style="color:black">
                        <asp:TextBox ID="FNameTB" runat="server" placeholder="First Name"></asp:TextBox>
                    </td>
                    <td style="color:black">
                        <asp:TextBox ID="LNameTB" runat="server" placeholder="Last Name"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <h5>Address: </h5>
                    </td>
                    <td colspan="2" style="color:black">
                        <asp:TextBox ID="CStreetTB" CssClass="txtbox" runat="server" Width="273px" placeholder="Street Address"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td></td>
                    <td colspan="2" style="color:black">
                        <asp:TextBox CssClass="txtbox" ID="CCityTB" runat="server" placeholder="City" Width="115px"></asp:TextBox>
                        <asp:DropDownList ID="CCountryDDL" runat="server" CssClass="txtbox" OnSelectedIndexChanged="CCountryDDL_SelectedIndexChanged" AutoPostBack="True">
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
                </tr>
                <tr style="height:50px">
                    <td></td>
                    <td colspan="2" style="color:black">
                        <asp:DropDownList ID="CProvinceDDL" CssClass="txtbox" runat="server" Enabled="false" Width="115px"></asp:DropDownList>
                        <asp:TextBox ID="CPostalCodeTB" CssClass="txtbox" runat="server" placeholder="Postal Code" Width="115px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <h5>Email: </h5>
                    </td>
                    <td colspan="2" style="color:black">
                        <asp:TextBox ID="CEmailTB" runat="server" placeholder="example@somewhere.com" Width="273px"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td><h5>Work: </h5></td>
                    <td style="color:black">
                        <asp:TextBox ID="WorkTB" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px" style="color:black">
                    <td><h5>Cell: </h5></td>
                    <td style="color:black">
                        <asp:TextBox ID="CellTB" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr style="height:35px" >
        <td class="auto-style8">&nbsp;</td>
        <td style="text-align: right"" class="auto-style9">
            <asp:Button ID="Button1" runat="server" Text="Save" Width="62px" OnClick="Button1_Click"  />
            </td>
        <td class="auto-style7">
            <asp:Button ID="Button2" runat="server" Text="Cancel" Width="73px" OnClick="Button2_Click" />
        </td>
    </tr>
    </table>
    </div>--%>

</asp:Content>
