<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="ELDNET.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style2 {
            width: 29%;
            background-color: #99CCFF;
        }
        .auto-style6 {
            width: 230px;
            font-weight: bold;
            text-align: left;
            background-color: #00FFCC;
        }
        .auto-style5 {
            width: 230px;
            text-align: left;
            background-color: #00FFCC;
        }
        .auto-style7 {
            width: 230px;
            text-align: left;
            background-color: #00FFCC;
            height: 30px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <table align="center" class="auto-style2">
            <tr>
                <td class="auto-style6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Sign Up</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Labe" runat="server" Text="Id No."></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="EmployeeIDTextBox" runat="server" AutoPostBack="True" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    &nbsp; <asp:Label ID="EmpIDlabel" runat="server" Enabled="False" ForeColor="Red" Text="Already Exists!"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="UsernameTextBox" runat="server" AutoPostBack="True" Enabled="False" OnTextChanged="UsernameTextBox_TextChanged"></asp:TextBox>
                    &nbsp; <asp:Label ID="EmpUserLabel" runat="server" Enabled="False" ForeColor="Red" Text="Already Exists!"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                    &nbsp;&nbsp;
                    <asp:TextBox ID="PasswordTextBox" runat="server" style="height: 22px" AutoPostBack="True" Enabled="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="RegisterButton" runat="server" OnClick="RegisterButton_Click" Text="Register" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="LoginButton" runat="server" CausesValidation="False" CssClass="auto-style7" OnClick="LoginButton_Click" Text="Login" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
