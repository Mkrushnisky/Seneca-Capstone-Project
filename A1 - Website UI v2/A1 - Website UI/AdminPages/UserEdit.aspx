<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="UserEdit.aspx.cs" Inherits="A1___Website_UI.AdminPages.UserEdit1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
     <div class="container-fluid">
        <div class="row text-center" style="padding-bottom: 10px;">
            <h3 class="site-title">
                Users
            </h3>
            <asp:TextBox ID="UserTB" runat="server" Visible="false"></asp:TextBox>
            <asp:HiddenField ID="UserIdHF" runat="server"  />
        </div>
        <div class="row">
            <asp:GridView ID="UserGridView" DataKeyNames="UserId" runat="server"
                CssClass="table table-striped table-bordered table-hover"
                AlternatingRowStyle-BackColor="#556591"
                AutoGenerateColumns="false" 
                HeaderStyle-Font-Bold="true" HeaderStyle-BackColor="#b15315" 
                AllowPaging="true" AllowSorting="true" ShowFooter="true" Width="70%" HorizontalAlign="Center">
                <Columns>
                    <asp:TemplateField HeaderText="User ID">
                        <ItemTemplate>
                            <asp:Label ID="userId" runat="server" Text='<%#Eval("UserId") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="emailTB" runat="server" Text='<%#Eval("Email") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Active">
                        <ItemTemplate>
                            <asp:Label ID="ActiveTB" runat="server" Text='<%#Eval("Active") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <div style="text-align:center">
                                <asp:Button ID="ButtonActive" CssClass="btn btn-sm" runat="server" CommandName="Active" Text="Toggle activiation" CommandArgument='<%#Eval("Active") %>' OnCommand="ButtonActive_Command"/>
                                    </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </div>
         <div class="row">
             <div class="col-md-10">
                 <asp:Button ID="Done" CssClass="btn btn-primary" runat="server" style="float: right;" Text="Done" OnCommand="Done_Command"/>
             </div>
             
         </div>
    </div>
</asp:Content>
