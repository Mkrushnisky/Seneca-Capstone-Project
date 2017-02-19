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
        .auto-style10 {
            width: 153px;
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
            <asp:HiddenField ID="SupIdHF" runat="server"  />
            <asp:ListBox ID="subcatlistboxcount" runat="server" Visible="false"></asp:ListBox>
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
        <td class="auto-style8">
            <asp:TextBox ID="AddOrEditTB" runat="server" Visible="false"></asp:TextBox>
        </td>
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
    <tr>
        <th colspan="4">
            <h3>
                Contacts
            </h3>
        </th>
    </tr>
    <tr>
        <td colspan="4">
            <asp:GridView ID="ContactGV" DataKeyNames="ContactId" runat="server" AlternatingRowStyle-BackColor="#556591"
                AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true" Width="1056px"
                onrowcancelingedit="ContactGV_RowCancelingEdit"
                onrowdeleting="ContactGV_RowDeleting"
                onrowediting="ContactGV_RowEditing"
                onrowcommand="ContactGV_RowCommand"
                OnRowDataBound="ContactGV_RowDataBound">
                    <Columns>
                    <%-- ContactId --%>
                        <asp:TemplateField HeaderText="Contact Id">
                            <ItemTemplate>
                                <asp:Label ID="CIdLB" runat="server" Text='<%#Eval("ContactId") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                <asp:Label ID="lblCId" runat="server" width="40px" Text='<%#Eval("ContactId") %>'/>
                            </EditItemTemplate>--%>
                        </asp:TemplateField>
                    <%-- First Name --%>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="FNameLB" runat="server" Text='<%#Eval("FName") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                 <asp:TextBox ID="FnameTB" width="70px"  runat="server" Text='<%#Eval("FName") %>'/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="InFName"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%-- Last Name --%>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="LNameLB" runat="server" Text='<%#Eval("LName") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                 <asp:TextBox ID="LnameTB" width="70px"  runat="server" Text='<%#Eval("LName") %>'/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="InLName"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%--<%-- Street --%>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="StreetLB" runat="server" Text='<%#Eval("Street") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                 <asp:TextBox ID="StreetTB" width="70px"  runat="server" Text='<%#Eval("Street") %>'/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="InStreet"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%-- City --%>
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:Label ID="CityLB" runat="server" Text='<%#Eval("City") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                 <asp:TextBox ID="CityTB" width="70px"  runat="server" Text='<%#Eval("City") %>'/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="InCity"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%-- Country --%>
                        <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <asp:Label ID="CountryLB" runat="server" Text='<%#Eval("Country") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                <asp:Label ID="lblCountry" runat="server" Text='<%# Eval("Country")%>' Visible = "false"></asp:Label>
                                 <asp:DropDownList ID="CCountryDDL" runat="server">
                                </asp:DropDownList>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:DropDownList ID="InCountry" runat="server">
                                </asp:DropDownList>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%-- Province --%>
                        <asp:TemplateField HeaderText="Province/State">
                            <ItemTemplate>
                                <asp:Label ID="ProvinceLB" runat="server" Text='<%#Eval("Province") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                <asp:Label ID="lblProvince" runat="server" Text='<%# Eval("Province")%>' Visible = "false"></asp:Label>
                                 <asp:DropDownList ID="CProvinceDDL" width="70px"  runat="server"/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:DropDownList ID="InProvince"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%-- PostalCode --%>
                        <asp:TemplateField HeaderText="Postal Code/Zip">
                            <ItemTemplate>
                                <asp:Label ID="PostalCodeLB" runat="server" Text='<%#Eval("PostalCode") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                 <asp:TextBox ID="PostalCodeTB" width="70px"  runat="server" Text='<%#Eval("PostalCode") %>'/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="InPostalCode"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%-- Email --%>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="EmailLB" runat="server" Text='<%#Eval("Email") %>'/>
                            </ItemTemplate>
                           <%-- <EditItemTemplate>
                                 <asp:TextBox ID="EmailTB" width="70px"  runat="server" Text='<%#Eval("Email") %>'/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="InEmail"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%-- Work --%>
                         <asp:TemplateField HeaderText="Work Number">
                            <ItemTemplate>
                                <asp:Label ID="WorkLB" runat="server" Text='<%#Eval("Work") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                 <asp:TextBox ID="WorkTB" width="70px"  runat="server" Text='<%#Eval("Work") %>'/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="InWork"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                    <%-- Cell --%>
                         <asp:TemplateField HeaderText="Cell Number">
                            <ItemTemplate>
                                <asp:Label ID="CellLB" runat="server" Text='<%#Eval("Cell") %>'/>
                            </ItemTemplate>
                            <%--<EditItemTemplate>
                                 <asp:TextBox ID="CellTB" width="70px"  runat="server" Text='<%#Eval("Cell") %>'/>
                             </EditItemTemplate>
                            <FooterTemplate>
                                 <asp:TextBox ID="InCell"  width="120px" runat="server"/>
                             </FooterTemplate>--%>
                        </asp:TemplateField>
                        <asp:TemplateField>
                           <%-- <EditItemTemplate>
                                <asp:Button ID="ButtonUpdate" runat="server" CommandName="Update"  Text="Update"  />
                                <asp:Button ID="ButtonCancel" runat="server" CommandName="Cancel"  Text="Cancel" />
                            </EditItemTemplate>--%>
                            <ItemTemplate>
                                <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit"  Text="Edit" OnCommand="ButtonEdit_Command" CommandArgument='<%#Eval("ContactId") %>'/>
                                <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete"  Text="Delete"  />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="ButtonAdd" runat="server" CommandName="AddNew"  Text="Add New" OnClick="ButtonAdd_Click" />
                            </FooterTemplate>
                         </asp:TemplateField>
                    </Columns>
                </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <th colspan="3">
                <asp:Label ID="EditLB" runat="server" Text="Edit Contact" Font-Size="Large" Visible="false"></asp:Label>
            <asp:Label ID="AddLB" runat="server" Text="Add New Contact" Font-Size="Large" Visible="false"></asp:Label>
        </th>
    </tr>
    <tr>
        <td colspan="3">
            <table id="ContactTB" runat="server" visible="false">
                <tr>
                    <td></td>
                </tr>
                <tr style="height:50px">
                    <td>
                        <h5>Name: </h5>
                    </td>
                    <td style="color:black">
                        <asp:TextBox ID="FNameTB" runat="server" placeholder="First Name" CssClass="txtbox"></asp:TextBox>
                    </td>
                    <td style="color:black">
                        <asp:TextBox ID="LNameTB" runat="server" placeholder="Last Name" CssClass="txtbox"></asp:TextBox>
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
                    <td>
                        <asp:TextBox ID="CAddressid" runat="server" Visible="false"></asp:TextBox>
                    </td>
                    <td colspan="2" style="color:black">
                        <asp:TextBox CssClass="txtbox" ID="CCityTB" runat="server" placeholder="City" Width="115px"></asp:TextBox>
                        <asp:DropDownList ID="CCountryDDL" runat="server" CssClass="txtbox" OnSelectedIndexChanged="CCountryDDL_SelectedIndexChanged" AutoPostBack="True" >
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
                    <td>
                        <asp:TextBox ID="CtId" runat="server" Visible="false"></asp:TextBox>
                    </td>
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
                        <asp:TextBox ID="CEmailTB" runat="server" placeholder="example@somewhere.com" Width="273px" CssClass="txtbox"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td><h5>Work: </h5></td>
                    <td style="color:black">
                        <asp:TextBox ID="WorkTB" runat="server" CssClass="txtbox"></asp:TextBox>
                    </td>
                </tr>
                <tr style="height:50px">
                    <td><h5>Cell: </h5></td>
                    <td style="color:black">
                        <asp:TextBox ID="CellTB" runat="server" CssClass="txtbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="auto-style10">
                        <asp:Button ID="CAddButton" runat="server" Text="Add" Visible="false" OnClick="CAddButton_Click"/>
                        <asp:Button ID="CUpdateButton" runat="server" Text="Update" Visible="false" OnClick="CUpdateButton_Click" />
                        <asp:Button ID="CCancelButton" runat="server" Text="Cancel" OnClick="CCancelButton_Click" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    </table>
    </div>
</asp:Content>
