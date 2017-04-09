<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SubCategoryAdd.aspx.cs" Inherits="A1___Website_UI.SubCategoryAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">                        
              .cssPager td
            {
                  padding-left: 8px;     
                  padding-right: 8px;
                  font-size:medium; 
                  border:solid 1px #ffffff;
              }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="row">
                <div class="col-md-4">
                    <h3>Add New Sub-Category</h3>
                </div>
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                    <asp:TextBox ID="CatIDTB" runat="server" Visible="false"></asp:TextBox>
                </div>
            </div>
            <div class="row" style="padding-top:20px">
                <div class="col-md-6 col-md-offset-3">
                    <div class="row" style="padding-bottom:20px">
                        <div class="col-md-6">
                            <label for="CategoryDDL" class="col-sm-10 control-label" style="font-size: 17px;">Category</label>
                            <asp:DropDownList ID="CategoryDDL" CssClass="form-control" runat="server" OnSelectedIndexChanged="CategoryDDL_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="jumbotron" style="border:3px solid #ffffff">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                <asp:TextBox ID="SubCategoryTB" CssClass="form-control pull-left" Width="100%" runat="server" placeholder="Sub-Category Name"></asp:TextBox>
                            </div>
                            <div class="col-md-2">
                                <asp:ImageButton ID="ToAddIMG" runat="server"  Height="25px" Width="25px" ImageUrl="~/Image/nexkk371.bmp" OnClick="ToAddIMG_Click" ValidationGroup="Validation"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <asp:GridView 
                        ID="SubCatGV" 
                        DataKeyNames="SubCatId"
                        CssClass="table table-striped table-bordered table-hover" 
                        runat="server"
                        AlternatingRowStyle-BackColor="#556591"
                        AutoGenerateColumns="false" 
                        HeaderStyle-Font-Bold="true" 
                        HeaderStyle-BackColor="#b15315" AllowPaging="true"
                        OnPageIndexChanging="SubCatGV_PageIndexChanging" PageSize="5" PagerStyle-CssClass="cssPager">
                        <PagerStyle HorizontalAlign ="Center"/>
                        <Columns>
                        <%-- Sub-Category Id --%>
                            <asp:TemplateField HeaderText="Id">
                                <ItemTemplate>
                                    <asp:Label ID="CIdLB" runat="server" Text='<%#Eval("SubCatId") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                        <%-- Name --%>
                            <asp:TemplateField HeaderText="Sub-Category">
                                <ItemTemplate>
                                    <asp:Label ID="FNameLB" runat="server" Text='<%#Eval("SCName") %>'/>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete" CssClass="btn btn-sm" Text="Delete" CommandArgument='<%#Eval("SubCatId") %>' OnCommand="ButtonDelete_Command" />
                                </ItemTemplate>
                                </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
                
            </div>
        </div>
    </div>

     <%--validation for Category--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="CategoryDDL" InitialValue="NA"
            Display="None" ErrorMessage="Category is Required" ValidationGroup="Validation"></asp:RequiredFieldValidator>

    <%--validation for subcategory's name--%>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" runat="server" ControlToValidate="SubCategoryTB"
            Display="None" ErrorMessage="Subcategory Name is Required" ValidationGroup="Validation"></asp:RequiredFieldValidator>

    <%--validation group for subcategory add--%>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="Validation" />
</asp:Content>
