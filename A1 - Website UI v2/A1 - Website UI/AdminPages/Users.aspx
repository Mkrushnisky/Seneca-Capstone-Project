<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="A1___Website_UI.AdminPages.UserEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
    <table>
        <tr>
            <td colspan="3">
                <h4>Users</h4>
            </td>
            <td class="auto-style4"></td>
            <td class="auto-style4"></td>
            <td class="auto-style5"></td>
            <td></td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td>

            </td>
        </tr>
        <tr>
            <td>

                <asp:GridView ID="UserGridView" DataKeyNames="UserId" runat="server" AlternatingRowStyle-BackColor="#556591"
                    AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true" Width="799px">
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
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="ActiveTB" runat="server" Text='<%#Eval("Active") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                       <asp:TemplateField>
                           <ItemTemplate>
                                <div style="text-align:center">
                                    <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit" Text="Edit" CommandArgument='<%#Eval("UserId") %>' OnCommand="ButtonEdit_Command"/>
                                    <asp:Button ID="ButtonDelete" runat="server" CommandName="DeleteUser"  Text="Delete" CommandArgument='<%#Eval("UserId") %>' OnCommand="ButtonDelete_Command" />
                                </div>
                            </ItemTemplate>
                       </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td>
                <div >
                <br />&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lblmsg" runat="server"></asp:Label>
                    <asp:TextBox ID="UserTB" runat="server" Visible="false"></asp:TextBox>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
