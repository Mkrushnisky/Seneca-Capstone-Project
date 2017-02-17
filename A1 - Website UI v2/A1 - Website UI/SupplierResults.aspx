<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" enableEventValidation="false" CodeBehind="SupplierResults.aspx.cs" Inherits="A1___Website_UI.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
 
    <table>
        <tr>
            <td colspan="3">
                <h4>Supplier Search Results</h4>
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

                <asp:GridView ID="SupplierGridView" DataKeyNames="SupId" runat="server" AlternatingRowStyle-BackColor="#556591"
                    AutoGenerateColumns="false" ShowFooter="true" HeaderStyle-Font-Bold="true" 
                    OnRowEditing="SupplierGridView_RowEditing"
                    OnRowDeleting="SupplierGridView_RowDeleting" Width="799px">
                    <Columns>
                        <asp:TemplateField HeaderText="Supplier Number">
                            <ItemTemplate>
                                <asp:Label ID="supidTB" runat="server" Text='<%#Eval("SupId") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Supplier Name">
                            <ItemTemplate>
                                <asp:Label ID="supnameTB" runat="server" Text='<%#Eval("SName") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Contact Name">
                            <ItemTemplate>
                                <asp:Label ID="contactTB" runat="server" Text="John Smith"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phone Number">
                            <ItemTemplate>
                                <asp:Label ID="phoneTB" runat="server" Text="123-456-7890"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Email">
                            <ItemTemplate>
                                <asp:Label ID="emailTB" runat="server" Text="Example@somewhere.com"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <div style="text-align:center">
                                    <asp:Button ID="ButtonEdit" runat="server" CommandName="Edit" Text="Edit" CommandArgument='<%#Eval("SupId") %>' OnCommand="ButtonEdit_Command"/>
                                    <asp:Button ID="ButtonDelete" runat="server" CommandName="Delete" Text="Delete" CommandArgument='<%#Eval("SupId") %>' OnCommand="ButtonDelete_Command" />
                                </div>
                            </ItemTemplate>
                            <FooterTemplate>
                                <div style="text-align:center">
                                    <asp:Button ID="ButtonAdd" runat="server" CommandName="AddNew"  Text="Add New" ValidationGroup="validaiton" />
                                </div>
                            </FooterTemplate>
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
                    <asp:TextBox ID="supplierTB" runat="server" Visible="false"></asp:TextBox>
                </div>
            </td>
        </tr>
    </table>
        
</asp:Content>
