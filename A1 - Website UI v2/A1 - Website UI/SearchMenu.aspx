<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SearchMenu.aspx.cs" Inherits="A1___Website_UI.SearchMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- SearchableDDL --%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="Scripts/SearchableDDL.js" type="text/javascript"></script>
    <script type="text/javascript">
     $(document).ready(function () {
       $("select").searchable({
          maxListSize: 200, // if list size are less than maxListSize, show them all
          maxMultiMatch: 300, // how many matching entries should be displayed
          exactMatch: false, // Exact matching on search
          wildcards: true, // Support for wildcard characters (*, ?)
          ignoreCase: true, // Ignore case sensitivity
          latency: 200, // how many millis to wait until starting search
          warnMultiMatch: 'top {0} matches ...', 
          warnNoMatch: 'no matches ...', 
          zIndex: 'auto'
              });
           });

     </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">    
    <div class="container-fluid">
        <div class="row text-center" style="padding-bottom: 10px;">
            <h3 class="site-title">
                Search Page
                <asp:TextBox ID="supplierTB" runat="server" Visible="false"></asp:TextBox>
                    <asp:ListBox ID="addLB" runat="server" Visible="false"></asp:ListBox>
            </h3>
        </div>
        <div class="col-md-8">
            <div class="row">
                <div class="col-md-6 text-center" style="color: black; padding-bottom: 5px;">
                    <label for="DropDownCategory" class="control-label" style="color: #ebebeb; font-size: 17px; text-align: center;">Category</label>
                    <asp:DropDownList ID="DropDownCategory" CssClass="form-control input-sm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownCategory_SelectedIndexChanged" Width="95%">    
                    </asp:DropDownList>
                </div>
                <div class="col-md-6 text-center" style="color: black; padding-bottom: 5px;">
                    <label for="DropDownSubCategory" class="control-label" style="color: #ebebeb; font-size: 17px; text-align: center;">Sub-Category</label>
                    <asp:DropDownList ID="DropDownSubCategory" CssClass="form-control input-sm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownSubCategory_SelectedIndexChanged" Width="95%" >    
                    </asp:DropDownList>
                </div>
            
            </div>
        
            <div class="row">
                <div class="col-md-6 text-center" style="color: black; padding-bottom: 5px;">
                    <label for="DropDownSupplier" class="control-label" style="color: #ebebeb; font-size: 17px; text-align: center;">Supplier</label>
                    <asp:DropDownList ID="DropDownSupplier" CssClass="form-control input-sm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownSupplier_SelectedIndexChanged" Width="95%">    
                    </asp:DropDownList>
                </div>
                <div class="col-md-6 text-center" style="color: black; padding-bottom: 5px;">
                    <label for="DropDownDistributor" class="control-label" style="color: #ebebeb; font-size: 17px; text-align: center;">Distributor</label>
                    <asp:DropDownList ID="DropDownDistributor" CssClass="form-control input-sm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownDistributor_SelectedIndexChanged" Width="95%">    
                    </asp:DropDownList>
                </div>
            </div>
            <div class="row" style="text-align:center">
                <asp:Button ID="ClearBtn" runat="server" CssClass="btn btn-primary btn-sm" Text="Clear Search" OnClick="ClearBtn_Click" />

            </div>
        </div>
        
        <div class="jumbotron col-md-4" style="border:3px solid #ffffff">
            <div class=" text-center" style="color: black; padding-bottom: 5px;">
                <label for="DropDownContactName" class="control-label" style="color: #ebebeb; font-size: 17px; text-align: center;">Contact - Name</label>
                <asp:DropDownList ID="DropDownContactName" CssClass="form-control input-sm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DropDownContactName_SelectedIndexChanged">    
                </asp:DropDownList>
            </div>
        </div>

        <div id="DivGVSubCategory" class="row" runat="server" visible="false">
            <asp:GridView ID="GridViewSubCategory" runat="server" DataKeyNames="SubCatId"
                CssClass="table table-striped table-bordered table-hover"
                AlternatingRowStyle-BackColor="#556591"
                AutoGenerateColumns="false" 
                HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#b15315" 
                AllowPaging="true" AllowSorting="true">
                <Columns>
                    <%-- ID --%>
                    <asp:TemplateField HeaderText="Id">
                        <ItemTemplate>
                            <asp:Label ID="SubCategoryId" runat="server" Text='<%#Eval("SubCatId") %>'>

                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%-- Sub-Category --%>
                    <asp:TemplateField HeaderText="Sub-Category">
                        <ItemTemplate>
                            <asp:Label ID="SubCategoryName" runat="server" Text='<%#Eval("SCName") %>'>

                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div id="DivGVSupplier" class="row" runat="server" visible="false">
            <asp:GridView ID="GridViewSupplier" runat="server" DataKeyNames="SupId"
                CssClass="table table-striped table-bordered table-hover"
                AlternatingRowStyle-BackColor="#556591"
                AutoGenerateColumns="false" 
                HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#b15315" 
                AllowPaging="true" AllowSorting="true">
                <Columns>
                    <%-- SupplierId --%>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="SIdLB" runat="server" Text='<%#Eval("SupId") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- SupplierName --%>
                        <asp:TemplateField HeaderText="Supplier">
                            <ItemTemplate>
                                <asp:Label ID="SupplierLB" runat="server" Text='<%#Eval("SName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- First Name --%>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="FNameLB" runat="server" Text='<%#Eval("FName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Last Name --%>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="LNameLB" runat="server" Text='<%#Eval("LName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Email --%>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="EmailLB" runat="server" Text='<%#Eval("Email") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Work --%>
                            <asp:TemplateField HeaderText="Work Number">
                            <ItemTemplate>
                                <asp:Label ID="WorkLB" runat="server" Text='<%#Eval("Work") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Cell --%>
                            <asp:TemplateField HeaderText="Cell Number">
                            <ItemTemplate>
                                <asp:Label ID="CellLB" runat="server" Text='<%#Eval("Cell") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Buttons --%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="text-align:center">
                                <asp:Button ID="SupButtonEdit" runat="server" CommandName="Edit" Text="Edit" CommandArgument='<%#Eval("SupId") %>' OnCommand="SupButtonEdit_Command" Visible="false"/>
                                <asp:Button ID="SupButtonDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%#Eval("SupId") %>' OnCommand="SupButtonDelete_Command" Visible="false"/>
                                <asp:Button ID="ContactButtonEdit" runat="server" CommandName="CEdit" Text="Edit" CommandArgument='<%#Eval("ContactId") %>' OnCommand="ContactButtonEdit_Command" Visible="false"/>
                                <asp:Button ID="ContactButtonDelete" runat="server" CommandName="CDelete" Text="Delete" CommandArgument='<%#Eval("ContactId") %>' OnCommand="ContactButtonDelete_Command" Visible="false"/>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div id="DivGVDistributor" class="row" runat="server" visible="false">
            <asp:GridView ID="GridViewDistributor" runat="server" DataKeyNames="DisId"
                CssClass="table table-striped table-bordered table-hover"
                AlternatingRowStyle-BackColor="#556591"
                AutoGenerateColumns="false" OnRowDeleting="GridViewDistributor_RowDeleting"
                HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#b15315" 
                AllowPaging="true" AllowSorting="true">
                <Columns>
                    <%-- DistributorId --%>
                        <asp:TemplateField HeaderText="Id">
                            <ItemTemplate>
                                <asp:Label ID="DIdLB" runat="server" Text='<%#Eval("DisId") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- DistributorName --%>
                        <asp:TemplateField HeaderText="Distributor">
                            <ItemTemplate>
                                <asp:Label ID="DistributorLB" runat="server" Text='<%#Eval("DisName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- First Name --%>
                        <asp:TemplateField HeaderText="First Name">
                            <ItemTemplate>
                                <asp:Label ID="DFNameLB" runat="server" Text='<%#Eval("FName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Last Name --%>
                        <asp:TemplateField HeaderText="Last Name">
                            <ItemTemplate>
                                <asp:Label ID="DLNameLB" runat="server" Text='<%#Eval("LName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Email --%>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="DEmailLB" runat="server" Text='<%#Eval("Email") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Work --%>
                            <asp:TemplateField HeaderText="Work Number">
                            <ItemTemplate>
                                <asp:Label ID="DWorkLB" runat="server" Text='<%#Eval("Work") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Cell --%>
                            <asp:TemplateField HeaderText="Cell Number">
                            <ItemTemplate>
                                <asp:Label ID="DCellLB" runat="server" Text='<%#Eval("Cell") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                    <%-- Buttons --%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="text-align:center">
                                <asp:Button ID="DisButtonEdit" runat="server" CommandName="Edit" Text="Edit" CommandArgument='<%#Eval("DisId") %>' OnCommand="DisButtonEdit_Command" Visible="false"/>
                                <asp:Button ID="DisButtonDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%#Eval("DisId") %>' OnCommand="DisButtonDelete_Command" Visible="false"/>
                                <asp:Button ID="ContactButtonEdit" runat="server" CommandName="CEdit" Text="Edit" CommandArgument='<%#Eval("ContactId") %>' OnCommand="ContactButtonEdit_Command" Visible="false"/>
                                <asp:Button ID="ContactButtonDelete" runat="server" CommandName="CDelete" Text="Delete" CommandArgument='<%#Eval("ContactId") %>' OnCommand="ContactButtonDelete_Command" Visible="false"/>
                            
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

    </div>


</asp:Content>
