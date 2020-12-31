<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ELDNET.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style1 {
            width: 40%;
        }
        .auto-style6 {
            width: 65px;
            background-color: #CC66FF;
        }
        .auto-style8 {
            background-color: #FF9999;
            width: 282px;
        }
        .auto-style5 {
            background-color: #CC66FF;
            width: 282px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <table align="center" class="auto-style1">
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label2" runat="server" Text="Username"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="UsernameTextBox" runat="server" OnTextChanged="UsernameTextBox_TextChanged" Width="128px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UsernameTextBox" ErrorMessage="*Required" ForeColor="Red">*Required</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">
                        <asp:Label ID="Label1" runat="server" Text="Password"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="PasswordTextBox" runat="server" Width="128px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PasswordTextBox" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6">&nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button ID="LoginButton" runat="server" CssClass="auto-style4" OnClick="LoginButton_Click" Text="Login" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button1" runat="server" CausesValidation="False" OnClick="Button1_Click" Text="Sign Up" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:Button ID="ExitButton" runat="server" CausesValidation="False" CssClass="auto-style7" OnClick="ExitButton_Click" Text="Exit" Width="42px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
