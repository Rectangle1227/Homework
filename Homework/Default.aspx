<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Homework.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            color: #6699FF;
            font-size: xx-large;
            background-color: #C3DED5;
        }
        .auto-style2 {
            width: 100%;
        }
        .auto-style5 {
            height: 31px;
        }
        .auto-style6 {
            text-align: center;
        }
        .auto-style7 {
            height: 31px;
            text-align: center;
        }
        .auto-style8 {
            margin-left: 21px;
        }
        .auto-style9 {
            margin-left: 22px;
        }
    </style>
</head>
<body style="background-size: cover; background-image: url('螢幕擷取畫面 2023-10-06 150402.png'); background-position: center center; background-attachment: fixed; background-repeat: no-repeat">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>歡迎來到茶水間</strong></div>
        <table class="auto-style2" style="position: relative">
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style7">
                    <asp:Label ID="accountLB" runat="server" Text="帳號"></asp:Label>
                    <asp:TextBox ID="accountTB" runat="server" CssClass="auto-style8"></asp:TextBox>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style5"></td>
                <td class="auto-style7">
                    <asp:Label ID="passwordLB" runat="server" Text="密碼"></asp:Label>
                    <asp:TextBox ID="passwordTB" runat="server" CssClass="auto-style9"></asp:TextBox>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="loginBT" runat="server" OnClick="loginBT_Click" Text="登入" />
                    <asp:LinkButton ID="entry" runat="server">進入商店</asp:LinkButton>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:DetailsView ID="clientDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="clientDetail" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                <asp:BoundField DataField="user_money" HeaderText="user_money" SortExpression="user_money" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="clientDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" SelectCommand="SELECT [user_name], [user_money] FROM [userData] WHERE (([user_name] = @user_name) AND ([user_password] = @user_password))">
            <SelectParameters>
                <asp:ControlParameter ControlID="accountTB" Name="user_name" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="passwordTB" Name="user_password" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
