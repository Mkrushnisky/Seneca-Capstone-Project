<%@ Page Title="" Language="C#" MasterPageFile="~/TrueMaster.Master" AutoEventWireup="true" CodeBehind="SupplierResults.aspx.cs" Inherits="A1___Website_UI.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 30px;
        }
        .auto-style2 {
            width: 160px;
        }
        .auto-style3 {
            width: 90px;
        }
        .auto-style4 {
            width: 100px;
        }
        .auto-style5 {
            width: 200px;
        }
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
            <td class="auto-style1"></td>
        </tr>
        <tr>
            <th class="auto-style1">
                ID
            </th>
            <th class="auto-style2">
                Supplier Name
            </th>
            <th class="auto-style3">
                Sub-Category
            </th>
            <th class="auto-style4">
                Contact Name
            </th>
            <th class="auto-style4">
                Phone Number
            </th>
            <th class="auto-style5">
                Email
            </th>
            <td></td>
        </tr>
        <tr>
            <td class="auto-style1"><asp:HyperLink ID="HyperLink1" runat="server">1</asp:HyperLink></td>
            <td class="auto-style2">YKK AP America Inc.</td>
            <td class="auto-style3">2</td>
            <td class="auto-style4">John Doe</td>
            <td class="auto-style4">123-456-7890</td>
            <td class="auto-style5">johndoe@johndoe.com</td>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Edit" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="Delete" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1"><asp:HyperLink ID="HyperLink2" runat="server">2</asp:HyperLink></td>
            <td class="auto-style2">Whitehall Industries</td>
            <td class="auto-style3">4</td>
            <td class="auto-style4">Tennouji Kotarou</td>
            <td class="auto-style4">123-456-7890</td>
            <td class="auto-style5">TennoujiKotarou@TrollForum.com</td>
            <td>
                <asp:Button ID="Button3" runat="server" Text="Edit" OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" Text="Delete" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1"><asp:HyperLink ID="HyperLink3" runat="server">3</asp:HyperLink></td>
            <td class="auto-style2">Tri-City Extrusion Inc.</td>
            <td class="auto-style3">3</td>
            <td class="auto-style4">Tomoya Okazaki</td>
            <td class="auto-style4">123-456-7890</td>
            <td class="auto-style5">TomoyaOkazaki@DramaClub.com</td>
            <td>
                <asp:Button ID="Button5" runat="server" Text="Edit" OnClick="Button5_Click" />
                <asp:Button ID="Button6" runat="server" Text="Delete" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1"><asp:HyperLink ID="HyperLink4" runat="server">4</asp:HyperLink></td>
            <td class="auto-style2">Taber Extrusions LLC</td>
            <td class="auto-style3">5</td>
            <td class="auto-style4">Riki Naoe</td>
            <td class="auto-style4">123-456-7890</td>
            <td class="auto-style5">RikiNaoe@baseball.com</td>
            <td>
                <asp:Button ID="Button7" runat="server" Text="Edit" OnClick="Button7_Click" />
                <asp:Button ID="Button8" runat="server" Text="Delete" />
            </td>
        </tr>
    </table>
        
</asp:Content>
