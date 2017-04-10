<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="DistributorEdit.aspx.cs" Inherits="A1___Website_UI.DistributorEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="container-fluid">
        <div class="row">

            <%-- Page Title --%>
            <div class="row">
                <div class="col-md-5">
                    <h3>Edit Distributor</h3>

                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="GetDisNum" runat="server" Visible="false" Width="26px"></asp:TextBox>
                    <asp:TextBox ID="Addressid" runat="server" Width="42px" Visible="false"></asp:TextBox>
                    <asp:HiddenField ID="DisIdHF" runat="server" />
                    <asp:ListBox ID="subcatlistboxcount" runat="server" Visible="false"></asp:ListBox>
                </div>
            </div>
            <%-- End of Page Title --%>


            <%-- Distributor Basic Information --%>
            <div class="col-md-5">

                <asp:DropDownList ID="DistributorDDL" CssClass="txtbox" runat="server" Visible="False" EnableTheming="True" Width="176px">
                </asp:DropDownList>
                <%-- Distributor Name --%>
                <div class="form-group">
                    <label for="DistributorNameTB" style="font-size: 17px;">Distributor Name</label>
                    <asp:TextBox CssClass="form-control" ID="DistributorNameTB" runat="server"></asp:TextBox>
                </div>
                <%-- Address --%>
                <div class="form-group">
                    <label for="StreetTB" style="font-size: 17px;">Address</label>
                    <asp:TextBox ID="StreetTB" CssClass="form-control" runat="server" placeholder="Street Address"></asp:TextBox>

                    <div class="form-inline" style="padding-top: 10px">
                        <asp:TextBox CssClass="form-control" ID="CityTB" runat="server" placeholder="City" Width="49%"></asp:TextBox>
                        <asp:DropDownList ID="CountryDDL" runat="server" CssClass="form-control" OnSelectedIndexChanged="CountryDDL_SelectedIndexChanged" AutoPostBack="True" Width="50%">
                            <asp:ListItem Value="0" Text="--- Choose Country ---"></asp:ListItem>
                            <asp:ListItem Value="1">Canada</asp:ListItem>
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

                    <div class="form-inline" style="padding-top: 10px">
                        <asp:DropDownList ID="ProvinceDDL" CssClass="form-control" runat="server" Enabled="false" Width="49%"></asp:DropDownList>
                        <asp:TextBox ID="PostalCodeTB" CssClass="form-control" runat="server" placeholder="Postal Code" Width="50%"></asp:TextBox>
                    </div>
                </div>
            </div>
            <%-- End of Distributor Basic Information --%>


            <%-- Sub-Category Add Section --%>
            <div class="col-md-6">
                <div class="jumbotron" style="border: 3px solid #ffffff">
                    <div class="row">
                        <h3>Add Sub-Categories</h3>
                    </div>
                    <div class="form-group">
                        <label for="CategoryDropDown" style="font-size: 17px;">Category</label>
                        <asp:DropDownList ID="CategoryDropDown" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="CategoryDropDown_SelectedIndexChanged">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <label for="SubCategoryListBox" style="font-size: 17px;">Sub-Category</label>
                        <div class="form-inline">
                            <asp:ListBox ID="SubCategoryListBox" CssClass="form-control" runat="server" Height="168px" Width="45%"></asp:ListBox>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/Image/nexkk371.bmp" Width="25px" OnClick="ImageButton1_Click" />
                            <asp:ListBox ID="ToAddListBox" CssClass="form-control" runat="server" Width="45%" Height="168px" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                        <div class="row" align="right" style="padding-right:1%">
                            <asp:Button ID="removeBTN" CssClass="btn-primary btn-sm" runat="server" Text="Remove" OnClick="removeBTN_Click" />
                        </div>

                    </div>
                </div>
            </div>
            <%-- End of Sub-Category Add Section --%>
        </div>
        <div class="row">
            <div class="row">
                <h3>Contacts</h3>
            </div>
            <div class="row">
                <asp:GridView ID="ContactGV" DataKeyNames="ContactId" CssClass="table table-striped table-bordered table-hover" runat="server" AlternatingRowStyle-BackColor="#556591"
                    AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#b15315"
                    OnRowCancelingEdit="ContactGV_RowCancelingEdit"
                    OnRowDeleting="ContactGV_RowDeleting"
                    OnRowEditing="ContactGV_RowEditing"
                    OnRowCommand="ContactGV_RowCommand"
                    OnRowDataBound="ContactGV_RowDataBound">
                    <Columns>
                        <%-- ContactId --%>
                        <asp:TemplateField HeaderText="Contact Id">
                            <ItemTemplate>
                                <asp:Label ID="CIdLB" runat="server" Text='<%#Eval("ContactId") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- First Name --%>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="FNameLB" runat="server" Text='<%#Eval("FName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Last Name --%>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="LNameLB" runat="server" Text='<%#Eval("LName") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<%-- Street --%>
                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <asp:Label ID="StreetLB" runat="server" Text='<%#Eval("Street") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- City --%>
                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <asp:Label ID="CityLB" runat="server" Text='<%#Eval("City") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Country --%>
                        <asp:TemplateField HeaderText="Country">
                            <ItemTemplate>
                                <asp:Label ID="CountryLB" runat="server" Text='<%#Eval("Country") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Province --%>
                        <asp:TemplateField HeaderText="Province/State">
                            <ItemTemplate>
                                <asp:Label ID="ProvinceLB" runat="server" Text='<%#Eval("Province") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- PostalCode --%>
                        <asp:TemplateField HeaderText="Postal Code/Zip">
                            <ItemTemplate>
                                <asp:Label ID="PostalCodeLB" runat="server" Text='<%#Eval("PostalCode") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Email --%>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="EmailLB" runat="server" Text='<%#Eval("Email") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Work --%>
                        <asp:TemplateField HeaderText="Work Number">
                            <ItemTemplate>
                                <asp:Label ID="WorkLB" runat="server" Text='<%#Eval("Work") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Cell --%>
                        <asp:TemplateField HeaderText="Cell Number">
                            <ItemTemplate>
                                <asp:Label ID="CellLB" runat="server" Text='<%#Eval("Cell") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit" CssClass="btn" Text="Edit" OnCommand="ButtonEdit_Command" CommandArgument='<%#Eval("ContactId") %>' />
                                <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete" CssClass="btn" Text="Delete" />
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Button ID="ButtonAdd" CssClass="btn-primary btn-sm" runat="server" CommandName="AddNew" Text="Add New" OnClick="ButtonAdd_Click" />
                            </FooterTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </div>
        <div class="row" style="text-align: center">
            <asp:Button ID="UpdateButton" runat="server" CssClass="btn-primary btn-lg" Text="Save" OnClick="UpdateButton_Click" ValidationGroup="Validation" />
            <asp:Button ID="CancelButton" runat="server" CssClass="btn-lg" Text="Cancel" OnClick="CancelButton_Click" />
        </div>
        <div class="row col-md-5">
            <div class="row">
                <asp:Label ID="EditLB" runat="server" Text="Edit Contact" Font-Size="X-Large" Visible="false"></asp:Label>
                <asp:Label ID="AddLB" runat="server" Text="Add New Contact" Font-Size="X-Large" Visible="false"></asp:Label>
            </div>
            <div id="ContactTB" class="row" visible="false" runat="server">
                <div class="form-group">
                    <label for="FNameTB" style="font-size: 17px;">Name</label>
                    <div class="form-inline">
                        <asp:TextBox ID="FNameTB" runat="server" placeholder="First Name" CssClass="form-control" Width="49%"></asp:TextBox>
                        <asp:TextBox ID="LNameTB" runat="server" placeholder="Last Name" CssClass="form-control" Width="50%"></asp:TextBox>
                    </div>
                    <asp:TextBox ID="CAddressid" runat="server" Visible="false"></asp:TextBox>
                    <asp:TextBox ID="CtId" runat="server" Visible="false"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="CStreetTB" style="font-size: 17px;">Address</label>
                    <asp:TextBox ID="CStreetTB" CssClass="form-control" runat="server" placeholder="Street Address"></asp:TextBox>
                    <div class="form-inline" style="padding-top: 10px">
                        <asp:TextBox CssClass="form-control" ID="CCityTB" runat="server" placeholder="City" Width="49%"></asp:TextBox>
                        <asp:DropDownList ID="CCountryDDL" runat="server" CssClass="form-control" OnSelectedIndexChanged="CCountryDDL_SelectedIndexChanged" AutoPostBack="True" Width="50%">
                            <asp:ListItem Value="0" Text="--- Choose Country ---"></asp:ListItem>
                            <asp:ListItem Value="1">Canada</asp:ListItem>
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
                    <div class="form-inline" style="padding-top: 10px">
                        <asp:DropDownList ID="CProvinceDDL" CssClass="form-control" runat="server" Enabled="false" Width="49%"></asp:DropDownList>
                        <asp:TextBox ID="CPostalCodeTB" CssClass="form-control" runat="server" placeholder="Postal Code" Width="50%"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="CEmailTB" style="font-size: 17px;">Email</label>
                    <asp:TextBox ID="CEmailTB" runat="server" placeholder="example@somewhere.com" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="WorkTB" style="font-size: 17px;">Phone Numbers</label>
                    <div class="form-inline">
                        <asp:TextBox ID="WorkTB" runat="server" CssClass="form-control" Width="49%"></asp:TextBox>
                        <asp:TextBox ID="CellTB" runat="server" CssClass="form-control" Width="50%"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <asp:Button ID="CAddButton" runat="server" CssClass="btn-primary btn-sm" Text="Add" Visible="false" OnClick="CAddButton_Click" ValidationGroup="ContactValidation" />
                    <asp:Button ID="CUpdateButton" runat="server" CssClass="btn-primary btn-sm" Text="Update" Visible="false" OnClick="CUpdateButton_Click" ValidationGroup="ContactValidation" />
                    <asp:Button ID="CCancelButton" runat="server" CssClass=" btn btn-sm" Text="Cancel" OnClick="CCancelButton_Click" />
                </div>
            </div>
        </div>
    </div>

    <%--validation for Supplier/Distributor's name--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="DistributorNameTB"
        Display="None" ErrorMessage="Supplier/Distributor Name is Required" ValidationGroup="Validation"></asp:RequiredFieldValidator>

    <%--validation for Supplier/Distributor's Street name--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="StreetTB"
        Display="None" ErrorMessage="Supplier/Distributor's Street name is Required" ValidationGroup="Validation"></asp:RequiredFieldValidator>

    <%--validation for Supplier/Distributor's city name--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CityTB"
        Display="None" ErrorMessage="Supplier/Distributor's City name is Required" ValidationGroup="Validation"></asp:RequiredFieldValidator>

    <%--validation for Supplier/Distributor's country--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CountryDDL" InitialValue="0"
        Display="None" ErrorMessage="Supplier/Distributor's Country is Required" ValidationGroup="Validation"></asp:RequiredFieldValidator>

    <%--validation for Supplier/Distributor's Province--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ProvinceDDL" InitialValue="NA"
        Display="None" ErrorMessage="Supplier/Distributor's Province is Required for within Canada/US" ValidationGroup="Validation"></asp:RequiredFieldValidator>

    <%--validation group for Supplier/Distributor edit--%>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="Validation" />

    <%--validation for contact first name--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FNameTB"
        Display="None" ErrorMessage="Contact's First Name is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

    <%--validation for contact Last name--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="LNameTB"
        Display="None" ErrorMessage="Contact's Last Name is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

    <%--validation for contact's Street name--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="CStreetTB"
        Display="None" ErrorMessage="Contact's Street name is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

    <%--validation for contact's city name--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="CCityTB"
        Display="None" ErrorMessage="Contact's City name is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

    <%--validation for contact's country--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="CCountryDDL" InitialValue="0"
        Display="None" ErrorMessage="Contact's Country is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

    <%--validation for contact's Province--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="CProvinceDDL" InitialValue="NA"
        Display="None" ErrorMessage="Contact's Province is Required for within Canada/US" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

    <%--validation for contact email--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="CEmailTB"
        Display="None" ErrorMessage="Contact's email is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

    <%--validation for contact work number--%>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="WorkTB"
        Display="None" ErrorMessage="Contact's work number is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

    <%--validation group for contact edit--%>
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="ContactValidation" />
</asp:Content>
