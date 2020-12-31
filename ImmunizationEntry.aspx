<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ImmunizationEntry.aspx.cs" Inherits="ELDNET.ImmunizationEntry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .auto-style1 {
            width: 68%;
            height: 554px;
        }
        .auto-style10 {
            text-align: center;
            height: 73px;
            background-color: #CC6699;
        }
        .auto-style19 {
            color: #FFFFFF;
        }
        .auto-style21 {
            background-color: #CCCCFF;
        }
        .auto-style2 {
            width: 426px;
            background-color: #FFCCFF;
        }
        .auto-style14 {
            width: 305px;
            background-color: #FFCCFF;
        }
        .auto-style12 {
            width: 164px;
            background-color: #FFCCFF;
        }
        .auto-style18 {
            background-color: #FFCCFF;
        }
        .auto-style13 {
            width: 164px;
            text-align: center;
            background-color: #FFCCFF;
        }
        .auto-style9 {
            text-align: center;
            background-color: #FFCCFF;
        }
        .auto-style6 {
            height: 117px;
            background-color: #FFCCFF;
        }
        .auto-style17 {
            width: 426px;
            background-color: #CC6699;
        }
        .auto-style16 {
            width: 305px;
            background-color: #CC6699;
        }
        .auto-style15 {
            width: 164px;
            text-align: center;
            background-color: #CC6699;
        }
        .auto-style22 {
            color: #000000;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        }
        .auto-style23 {
            width: 426px;
            background-color: #CC6699;
            height: 45px;
        }
        .auto-style24 {
            width: 305px;
            background-color: #CC6699;
            height: 45px;
        }
        .auto-style25 {
            width: 164px;
            text-align: center;
            background-color: #CC6699;
            height: 45px;
        }
        .auto-style26 {
            width: 426px;
            background-color: #FFCCFF;
            height: 68px;
        }
        .auto-style27 {
            width: 305px;
            background-color: #FFCCFF;
            height: 68px;
        }
        .auto-style28 {
            width: 164px;
            text-align: center;
            background-color: #FFCCFF;
            height: 68px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" class="auto-style1">
                <tr>
                    <td class="auto-style10" colspan="3"><span class="auto-style19"><strong>PEDIATRIC CLINICAL SYSTEM</strong></span><br class="auto-style19" />
                        <strong><span class="auto-style19">PERPETUAL SUCCOUR GENERAL HOSPITAL</span><br class="auto-style19" />
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style19" Text="IMMUNIZATION ENTRY"></asp:Label>
                        </strong></td>
                </tr>
                <tr>
                    <td class="auto-style21" colspan="3">&nbsp;PATIENT INFO&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label1" runat="server" Text="Immunization Code"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="ImmunizationCodeTextBox" runat="server" CssClass="auto-style7" OnTextChanged="ImmunizationCodeTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="auto-style13">
                        <asp:Label ID="immunizationlabel" runat="server" ForeColor="Red" Text="Already Exist" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style14">
                        <asp:Label ID="Label21" runat="server" Text="Date"></asp:Label>
                        &nbsp;<asp:TextBox ID="DateTextBox0" runat="server" TextMode="Date" Width="129px"></asp:TextBox>
                    </td>
                    <td class="auto-style12">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style18" colspan="3">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label3" runat="server" Text="Patient Code"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="PatientCodeTextBox" runat="server" OnTextChanged="PatientCodeTextBox_TextChanged" Enabled="False" Height="22px" AutoPostBack="True"></asp:TextBox>
                    &nbsp;
                        <span class="auto-style13">
                        <asp:Label ID="patientcodelabel" runat="server" ForeColor="Red" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style14">
                        <asp:Label ID="Label6" runat="server" Text="Father's Name"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="FathersNameTextBox" runat="server" CssClass="auto-style22" Width="190px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="Label10" runat="server" Text="Age"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="AgeTextBox" runat="server" CssClass="auto-style22" Width="32px" Enabled="False"></asp:TextBox>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label11" runat="server" Text="Patient Name"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="PatientNameTextBox" runat="server" CssClass="auto-style22" Width="201px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style14">
                        <asp:Label ID="Label7" runat="server" Text="Mother's Name"></asp:Label>
                        &nbsp;
                        <asp:TextBox ID="MothersNameTextBox" runat="server" CssClass="auto-style22" Width="186px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="Label18" runat="server" Text="Weight"></asp:Label>
                        &nbsp;&nbsp;
                        <asp:TextBox ID="WeightTextBox" runat="server" Width="55px" AutoPostBack="True"></asp:TextBox>
                        &nbsp;
                        <asp:Label ID="Label19" runat="server" Text="kg."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                        <asp:TextBox ID="AddressTextBox" runat="server" CssClass="auto-style22" Width="204px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style14">
                        <asp:Label ID="Label8" runat="server" Text="Gender"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="GenderTextBox" runat="server" CssClass="auto-style22" Width="87px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="Label17" runat="server" Text="Height"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="HeightTextBox" runat="server" Width="59px" AutoPostBack="True"></asp:TextBox>
                        &nbsp;
                        <asp:Label ID="Label20" runat="server" Text="cm."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Label ID="Label5" runat="server" Text="Telephone"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TelephoneTextBox" runat="server" CssClass="auto-style22" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style14">
                        <asp:Label ID="Label9" runat="server" Text="Birthday"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="BirthdayTextBox" runat="server" CssClass="auto-style22" Width="82px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style12">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style21" colspan="3">VACCINE INFO</td>
                </tr>
                <tr>
                    <td class="auto-style26">
                        <asp:Label ID="Label16" runat="server" Text="Vaccine Code"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="VaccineCodeTextBox" runat="server" OnTextChanged="VaccineCodeTextBox_TextChanged" Width="100px" AutoPostBack="True"></asp:TextBox>
                    &nbsp;<span class="auto-style13"><asp:Label ID="vaccinelabel3" runat="server" ForeColor="Red" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        <br />
                        <asp:Label ID="vaccinelabel1" runat="server" ForeColor="Red" Text="Vaccine Code already exists in the datagrid" Visible="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style27">
                        <asp:Label ID="Label15" runat="server" Text="Shot Number"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="ShotNumberTextBox" runat="server" Width="87px" OnTextChanged="ShotNumberTextBox_TextChanged" AutoPostBack="True" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style28">
                        <asp:Button ID="SaveButton" runat="server" Text="Save" Width="67px" UseSubmitBehavior="false" OnClick="SaveButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9" colspan="2">
                        <asp:Label ID="Label14" runat="server" Text="Reaction"></asp:Label>
                        &nbsp;<asp:TextBox ID="ReactionTextBox" runat="server" CssClass="auto-style11" Width="435px" AutoPostBack="True" Enabled="False" OnTextChanged="ReactionTextBox_TextChanged"></asp:TextBox>
                    </td>
                    <td class="auto-style13">
                        <asp:Button ID="ExitButton" runat="server" Text="Exit" Width="60px" UseSubmitBehavior="false" OnClick="ExitButton_Click" />
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="ClearButton" runat="server" Text="Clear" Width="65px" UseSubmitBehavior="false" OnClick="ClearButton_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="3">
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False" CaptionAlign="Top" CellPadding="4" GridLines="None" Height="16px" PageSize="1" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="536px" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" ForeColor="#333333">
                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            <Columns>
                                <asp:BoundField AccessibleHeaderText="Vaccine Code" HeaderText="Vaccine Code" DataField="Vaccine Code" />
                                <asp:BoundField AccessibleHeaderText="Name" HeaderText="Name" DataField="Name" />
                                <asp:BoundField AccessibleHeaderText="Description" HeaderText="Description" DataField="Description" />
                                <asp:BoundField AccessibleHeaderText="Shot Number" DataField="Shot Number" HeaderText="Shot Number" />
                                <asp:BoundField AccessibleHeaderText="Reaction" DataField="Reaction" HeaderText="Reaction" />
                            </Columns>
                            <EditRowStyle BackColor="#999999" />
                            <FooterStyle BackColor="#5D7B9D" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <SortedAscendingCellStyle BackColor="#E9E7E2" />
                            <SortedAscendingHeaderStyle BackColor="#506C8C" />
                            <SortedDescendingCellStyle BackColor="#FFFDF8" />
                            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                        </asp:GridView>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17">
                        <asp:Label ID="Label12" runat="server" Text="Prepared By"></asp:Label>
                        &nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="PreparedByTextBox" runat="server" Width="156px" OnTextChanged="PreparedByTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                    &nbsp;
                        <span class="auto-style22"> <span class="auto-style13">
                        <asp:Label ID="preparedlabel" runat="server" ForeColor="Yellow" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        <br />
                        <asp:Label ID="preparedlabel1" runat="server" ForeColor="Yellow" Text="The employee is inactive" Visible="False" Enabled="False"></asp:Label>
                        </span> </span>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="PreparedByLabel" runat="server" CssClass="auto-style22" Width="204px" Enabled="False"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style15">&nbsp;&nbsp;
                        <asp:LinkButton ID="RegistrationLinkButton" runat="server" CssClass="auto-style19" OnClick="RegistrationLinkButton_Click">Patient Registration Form</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="BillingLinkButton" runat="server" CssClass="auto-style19" OnClick="BillingLinkButton_Click">Billing Form</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <asp:Label ID="Label13" runat="server" Text="Immunized By"></asp:Label>
                        &nbsp;
                        <asp:TextBox ID="ImmunizedByTextBox" runat="server" Width="156px" OnTextChanged="ImmunizedByTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                    &nbsp;
                        <span class="auto-style22"> <span class="auto-style13">
                        <asp:Label ID="examinedlabel" runat="server" ForeColor="Yellow" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        <br />
                        <asp:Label ID="examinedlabel1" runat="server" ForeColor="Yellow" Text="The employee is either inactive or is not a doctor" Visible="False" Enabled="False"></asp:Label>
                        </span> </span>
                    </td>
                    <td class="auto-style24">
                        <asp:TextBox ID="ImmunizedByLabel" runat="server" CssClass="auto-style22" Width="204px" Enabled="False"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                    <td class="auto-style25">
                        <asp:LinkButton ID="ConsultationLinkButton" runat="server" CssClass="auto-style19" OnClick="ConsultationLinkButton_Click">Consultation Form</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
