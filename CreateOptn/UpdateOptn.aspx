<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateOptn.aspx.cs" Inherits="CRUD_webform.UpdateOptn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table>
                <tr>
                    <th><b>Name of the product</b></th>
                    <th><b>Date of packaging</b></th>
                    <th><b>Category</b></th>
                    <th><b>Price of the product</b></th>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="tbName" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="This field is empty" ControlToValidate="tbName" runat="server" ForeColor="PaleVioletRed" ValidationGroup="val"/>

                    </td>
                    <td>
                        <asp:TextBox ID="tbDate" runat="server" textmode="Date"/>
                        <asp:RequiredFieldValidator ErrorMessage="This field is empty" ControlToValidate="tbDate" runat="server" ForeColor="PaleVioletRed" ValidationGroup="val"/>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlCategory" runat="server">
                            <asp:ListItem Text="Select Category" />
                            <asp:ListItem Text="Food" />
                            <asp:ListItem Text="Medicines" />
                            <asp:ListItem Text="Shoes" />
                            <asp:ListItem Text="Scent" />
                            <asp:ListItem Text="Dress" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="This field is empty" ControlToValidate="ddlCategory" runat="server" ForeColor="PaleVioletRed" InitialValue="Select Category" ValidationGroup="val"/>
                    </td>
                    <td>
                        <asp:TextBox ID="tbPrice" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="This field is empty" ControlToValidate="tbPrice" runat="server" ForeColor="PaleVioletRed" ValidationGroup="val"/>
                    </td>
                </tr>
            </table>

            <asp:Button ID="btn_update_data" Text="Update" runat="server" onclick="Button_Update_Data" ValidationGroup="val"/>
            <br />
            <asp:Label id="Label1" Text="Click to update" runat="server" />
            <br />
            <br />
            <asp:Button Text="Go back to read page" runat="server" OnClick="Back_to_read_click" />

        </div>
    </form>
</body>
</html>
