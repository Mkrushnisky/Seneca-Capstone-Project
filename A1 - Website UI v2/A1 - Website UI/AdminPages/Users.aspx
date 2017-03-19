<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="A1___Website_UI.AdminPages.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <div class="container-fluid">
        <div class="row text-center" style="padding-bottom: 10px;">
            <h3 class="site-title">
                Users
            </h3>
            <asp:TextBox ID="UserTB" runat="server" Visible="false"></asp:TextBox>
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
                                <asp:Button ID="ButtonEdit" runat="server" CssClass="btn btn-sm" CommandName="Edit" Text="Edit" CommandArgument='<%#Eval("UserId") %>' OnCommand="ButtonEdit_Command"/>
                                <asp:Button ID="ButtonDelete" runat="server" CssClass="btn btn-sm" CommandName="DeleteUser"  Text="Delete" CommandArgument='<%#Eval("UserId") %>' OnCommand="ButtonDelete_Command" />
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
