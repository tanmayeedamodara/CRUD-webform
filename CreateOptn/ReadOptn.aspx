<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReadOptn.aspx.cs" Inherits="CRUD_webform.ReadOptn" EnableEventValidation="false" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Product details</h2>
            <br />

            <b>Search products by entering product name </b> &nbsp; &nbsp;
            <asp:TextBox ID="TextBox1" runat="server" /> &nbsp;
            <asp:Button  Text="Search" runat="server" OnClick="SearchBtn_Click" />
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" 
                AutoGenerateColumns="false">
                <AlternatingRowStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                <SortedAscendingCellStyle BackColor="#F4F4FD" />
                <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
                <SortedDescendingCellStyle BackColor="#D8D8F0" />
                <SortedDescendingHeaderStyle BackColor="#3E3277" />
                
                
                <Columns>
                    <asp:BoundField DataField="Product_Name" HeaderText="Name of the product"/>
                    <asp:BoundField DataField="Product_Date" HeaderText="Date of packaging"/>
                    <asp:BoundField DataField="Product_Category" HeaderText="Product category"/>
                    <asp:BoundField DataField="Product_Price" HeaderText="Price of the product"/>
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <%--<asp:HiddenField ID="hdnProductID" runat="server" Value='<%# Eval("Product_ID") %>' />--%>
                            <asp:Button id="btn_edit" text="Edit" runat="server" 
                                CommandName="getID" CommandArgument='<%#Eval("Product_ID")%>' OnCommand="GridView1_Edit" BackColor="PaleVioletRed"/>
                            <asp:Button id="btn_del" Text="Delete" runat="server" 
                                CommandName="getName" CommandArgument='<%#Eval("Product_Name")%>' oncommand="GridView1_Delete" BackColor="RosyBrown"/>
                        </ItemTemplate>
                </asp:TemplateField>
                </Columns>
            </asp:GridView>


            <br />
            <asp:Label id="Label1" runat="server"/>
            <br />
            <br />
            <asp:Button Text="Go back to insert page" runat="server" OnClick="Back_to_insert_click" BackColor="DarkSlateBlue" ForeColor="WhiteSmoke"/>
        </div>
    </form>
</body>
</html>
