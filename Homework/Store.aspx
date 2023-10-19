<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="Homework.Store" %>

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
        .auto-style3 {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body style="background-size: cover; background-image: url('螢幕擷取畫面 2023-10-06 150402.png'); background-position: center center; background-attachment: fixed; background-repeat: no-repeat"">
    <form id="form1" runat="server">
        <div class="auto-style1">
            <strong>歡迎來到茶水間</strong></div>
        <table class="auto-style2">
            <tr>
                <td>
                    <asp:Label ID="userShowLB" runat="server" CssClass="auto-style3" Text="將顯示使用者資料"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="drinkList" runat="server" AutoPostBack="True" DataSourceID="drinkData" DataTextField="drink_name" DataValueField="drink_Id" Height="17px" OnSelectedIndexChanged="drinkList_SelectedIndexChanged" Width="90px">
                    </asp:DropDownList>
                    <asp:Label ID="drinkPriceLB" runat="server" CssClass="auto-style3" Text="X元"></asp:Label>
                    <asp:Label ID="drinkQtLB" runat="server" CssClass="auto-style3" Text="庫存：X個"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="drinkImage" runat="server" />
                    <br />
                    <asp:SqlDataSource ID="drinkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drink_name], [drink_Id] FROM [drinkTable]"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="drinkDataSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drink_price], [drink_qt] FROM [drinkTable] WHERE ([drink_Id] = @drink_Id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="drinkList" Name="drink_Id" PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:DetailsView ID="drinkDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="drinkDataSelect" Height="50px" OnPageIndexChanging="drinkDetailsView_PageIndexChanging" Visible="False" Width="125px">
                        <Fields>
                            <asp:BoundField DataField="drink_price" HeaderText="drink_price" SortExpression="drink_price" />
                            <asp:BoundField DataField="drink_qt" HeaderText="drink_qt" SortExpression="drink_qt" />
                        </Fields>
                    </asp:DetailsView>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
