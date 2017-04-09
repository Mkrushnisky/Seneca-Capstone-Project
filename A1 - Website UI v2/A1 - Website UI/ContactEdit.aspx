<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="ContactEdit.aspx.cs" Inherits="A1___Website_UI.ContactEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="row">
                <div class="col-md-5">
                <h3>Edit Contact</h3>
                </div>
                
            </div>
            <div class="col-md-5">
                
                 <div class="col-md-3">
                    <asp:TextBox ID="GetSupNum" runat="server" Visible="false" Width="26px"></asp:TextBox>
                    <asp:TextBox ID="CAddressid" runat="server" Width="42px" Visible="false"></asp:TextBox>
                      <asp:HiddenField ID="SupIdHF" runat="server"  />
                     <asp:HiddenField ID="ContactIdHF" runat="server"  />
                     <asp:HiddenField ID="CtId" runat="server" />
                </div>
               
                <div class="row">
                    <h3>Contact Information</h3>
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
                <asp:Button ID="Button1" CssClass="btn-primary btn-lg" runat="server" Text="Save" OnClick="Button1_Click" ValidationGroup="ContactValidation" />
            <asp:Button ID="Button2" CssClass="btn-lg" runat="server" Text="Cancel" OnClick="Button2_Click" />
            </div>
        
    </div>

        <%--validation for contact first name--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="FNameTB"
            Display="None" ErrorMessage="Contact's First Name is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

        <%--validation for contact Last name--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="LNameTB"
            Display="None" ErrorMessage="Contact's Last Name is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

        <%--validation for contact's Street name--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CStreetTB"
            Display="None" ErrorMessage="Contact's Street name is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

        <%--validation for contact's city name--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="CCityTB"
            Display="None" ErrorMessage="Contact's City name is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

        <%--validation for contact's country--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="CCountryDDL" InitialValue="0"
            Display="None" ErrorMessage="Contact's Country is Required" ValidationGroup="ContactValidation"></asp:RequiredFieldValidator>

        <%--validation for contact's Province--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="CProvinceDDL" InitialValue="NA"
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
