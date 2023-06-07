<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Prod.aspx.cs" Inherits="CRUD_webform.Create_Prod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD</title>
    <style type="text/css">
        body{
            margin:0;
            padding:0;
        }
        div{
            width: 70%;
            height: 100%;
            
        }
        table
        {
            align-items: center;
        }
        .table-td{
            width: 200px;
            height: 75px;
            text-align: center;            
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <th>Name</th>
                    <th>Date</th>
                    <th>Category</th>
                    <th>Price</th>
                </tr>
                <tr>
                    <td class="table-td">
                        <asp:TextBox ID="TextBox1" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="This field is empty" ControlToValidate="TextBox1" runat="server" Text="*" ForeColor="PaleVioletRed" ValidationGroup="val"/>
                        <br />
                        <asp:RegularExpressionValidator ErrorMessage="Enter valid name" ControlToValidate="TextBox1" runat="server" text="*" 
                            ValidationExpression="^[A-Za-z]*$" ForeColor="PaleVioletRed" ValidationGroup="val"/>  
                    </td>
                    <td class="table-td">
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Date" />
                        <asp:RequiredFieldValidator ErrorMessage="This field is empty" ControlToValidate="TextBox3" runat="server" Text="*" 
                            ForeColor="PaleVioletRed" ValidationGroup="val"/><br />
                        <br />
                    </td>
                    <td class="table-td">
                        <asp:DropDownList ID="DropDownList1" runat="server">
                            <asp:ListItem Text="Select Category" />
                            <asp:ListItem Text="Food" />
                            <asp:ListItem Text="Medicines" />
                            <asp:ListItem Text="Shoes" />
                            <asp:ListItem Text="Scent" />
                            <asp:ListItem Text="Dress" />
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ErrorMessage="This field is empty" ControlToValidate="DropDownList1" runat="server" Text="*"
                            ForeColor="PaleVioletRed" InitialValue="Select Category" ValidationGroup="val"/><br />
                        <br />
                    </td>
                    <td class="table-td">
                        <asp:TextBox ID="TextBox3" runat="server" />
                        <asp:RequiredFieldValidator ErrorMessage="This field is empty" ControlToValidate="TextBox3" runat="server" Text="*" ForeColor="PaleVioletRed" ValidationGroup="val"/>
                        <br />
                        <asp:RegularExpressionValidator ErrorMessage="Enter valid price value" ControlToValidate="TextBox1" runat="server" text="*" ValidationExpression="^[0-9]*$" ForeColor="PaleVioletRed"/>  
                    </td>
                </tr>
            </table>

            <br />

            <table>
                <tr>
                    <td class="table-td">
                        <asp:Button ID="Button1" Text="Insert" runat="server" onclick="Btn1Insert_Click" BackColor="CadetBlue" ValidationGroup=""/></td>
                    <td class="table-td">
                        <asp:Button ID="Button2" Text="Read" runat="server" onclick="Btn2Read_Click" BackColor="YellowGreen"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label id="Label1" Text="Click any one of the options" runat="server" forecolor="gray"/>
                    </td>
                </tr>
            </table>
        </div>        
    </form>
</body>
</html>
