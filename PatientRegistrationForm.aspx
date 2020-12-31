<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatientRegistrationForm.aspx.cs" Inherits="ELDNET.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">


        .auto-style1 {
            border-style: solid;
width: 77%;
            height: 362px;
        }
        .auto-style10 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
            text-align: center;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            background-color: #669900;
        }
        .auto-style34 {
            font-size: large;
            color: #FFFFFF;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        }
        .auto-style35 {
            font-size: large;
            color: #FFFFFF;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
        }
        .auto-style37 {
            font-weight: normal;
        }
        .auto-style33 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
            text-align: left;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            background-color: #99FF99;
        }
        .auto-style17 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
            width: 144px;
            text-align: center;
            color: #000000;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            background-color: #CCFFCC;
        }
        .auto-style13 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
            width: 581px;
            background-color: #CCFFCC;
        }
        .auto-style32 {
            text-align: center;
            width: 171px;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            background-color: #99FF99;
        }
        .auto-style9 {
            width: 235px;
            background-color: #99FF99;
        }
        .auto-style8 {
            width: 85px;
            height: 21px;
            margin-top: 6px;
        }
        .auto-style5 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
width: 144px;
            margin-left: 40px;
            text-align: center;
            color: #000000;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            background-color: #CCFFCC;
        }
        .auto-style26 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
            width: 144px;
            text-align: center;
            height: 17px;
            color: #000000;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            background-color: #CCFFCC;
        }
        .auto-style27 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
            width: 581px;
            height: 17px;
            background-color: #CCFFCC;
        }
        .auto-style31 {
            text-align: center;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            background-color: #99FF99;
        }
        .auto-style20 {
            width: 100%;
            height: 99px;
            margin-left: 0px;
        }
        .auto-style28 {
            height: 41px;
        }
        .auto-style38 {
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        }
        .auto-style21 {
            width: 112px;
        }
        .auto-style16 {
            color: #000000;
            background-color: #FFFFFF;
        }
        .auto-style22 {
            border-style: solid;
            border-width: 1px;
            padding: 1px 4px;
            text-align: right;
            color: #FFFFFF;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            background-color: #99FF99;
        }
        .auto-style23 {
            width: 100%;
            height: 74px;
            background-color: #66FF66;
        }
        .auto-style24 {
            width: 204px;
            text-align: center;
            background-color: #669900;
        }
        .auto-style25 {
            text-align: center;
            background-color: #669900;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <table align="center" class="auto-style1">
            <tr>
                <td class="auto-style10" colspan="4"><span class="auto-style34">ELECTIVE PEDIATRIC CLINIC</span><br class="auto-style35" />
                    <strong class="auto-style37"><span class="auto-style34">PATIENT REGISTRATION</span></strong></td>
            </tr>
            <tr>
                <td class="auto-style33" colspan="4">PATIENT INFO</td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Patient Code</td>
                <td class="auto-style13">
                    <asp:TextBox ID="PatientCodeTextBox" runat="server" AutoPostBack="True" CausesValidation="True" CssClass="auto-style36" Width="123px" OnTextChanged="PatientCodeTextBox_TextChanged"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;<asp:Label ID="Label1" runat="server" Enabled="False" ForeColor="Red" Text="Already Exists!"></asp:Label>
                </td>
                <td class="auto-style32">Gender </td>
                <td class="auto-style9">
                    <div class="auto-style8">
                    </div>
                    <asp:DropDownList ID="GenderDropDownList" runat="server" CssClass="auto-style19" Height="23px" Width="66px">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Male</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">Patient Name</td>
                <td class="auto-style13">
                    <asp:TextBox ID="PatientNameTextBox" runat="server" CssClass="auto-style36" Width="259px"></asp:TextBox>
                    &nbsp;</td>
                <td class="auto-style32">Birthday </td>
                <td class="auto-style9">
                    <asp:TextBox ID="BirthdayTextBox" runat="server" CssClass="auto-style38" TextMode="Date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Address</td>
                <td class="auto-style13">
                    <asp:TextBox ID="AddressTextBox" runat="server" CssClass="auto-style36" Width="259px"></asp:TextBox>
                </td>
                <td class="auto-style32">Age </td>
                <td class="auto-style9">
                    <asp:TextBox ID="AgeTextBox" runat="server" CssClass="auto-style38"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Telephone</td>
                <td class="auto-style13">
                    <asp:TextBox ID="TelephoneTextBox" runat="server" CssClass="auto-style3" Width="125px"></asp:TextBox>
                </td>
                <td class="auto-style32">Weight </td>
                <td class="auto-style9">
                    <asp:TextBox ID="WeightTextBox" runat="server" CssClass="auto-style38"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Father&#39;s Name</td>
                <td class="auto-style13">
                    <asp:TextBox ID="FathersNameTextBox" runat="server" CssClass="auto-style36" Width="259px"></asp:TextBox>
                </td>
                <td class="auto-style32">Height </td>
                <td class="auto-style9">
                    <asp:TextBox ID="HeightTextBox" runat="server" CssClass="auto-style7"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style26">Mother&#39;s Name</td>
                <td class="auto-style27">
                    <asp:TextBox ID="MothersNameTextBox" runat="server" CssClass="auto-style36" Width="209px"></asp:TextBox>
                </td>
                <td class="auto-style31" colspan="2" rowspan="2">
                    <table class="auto-style20">
                        <tr>
                            <td class="auto-style28" colspan="2"><span class="auto-style38">Encoded By</span><br class="auto-style38" />
                                <asp:TextBox ID="EncodedByTextBox" runat="server" CssClass="auto-style38" Width="201px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style21">
                                <asp:Button ID="ClearButton" runat="server" BackColor="#669900" CausesValidation="False" CssClass="auto-style19" ForeColor="White" OnClick="ClearButton_Click" Text="Clear" Width="68px" />
                            </td>
                            <td><span class="auto-style16">
                                <asp:Button ID="RegisterButton" runat="server" BackColor="#669900" BorderColor="#99CC00" CssClass="auto-style19" ForeColor="White" OnClick="RegisterButton_Click" Text="Save" Width="69px" />
                                </span></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style22" colspan="2">
                    <table class="auto-style23">
                        <tr>
                            <td class="auto-style24"><kbd><strong class="auto-style37">
                                <asp:LinkButton ID="ImmunizationLinkButton" runat="server" CausesValidation="False" CssClass="auto-style30" OnClick="ImmunizationLinkButton_Click">Immunization Form</asp:LinkButton>
                                </strong></kbd></td>
                            <td class="auto-style25"><strong class="auto-style37"><kbd>
                                <asp:LinkButton ID="ConsultationLinkButton" runat="server" CausesValidation="False" CssClass="auto-style29" OnClick="ConsultationLinkButton_Click">Consultation Form</asp:LinkButton>
                                </kbd></strong></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
