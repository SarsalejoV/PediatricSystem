<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BillingForm.aspx.cs" Inherits="ELDNET.BillingForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">



        .auto-style2 {
            width: 70%;
            height: 539px;
        }
        .auto-style42 {
            text-align: center;
            background-color: #9933FF;
        }
        .auto-style43 {
            color: #FFFFFF;
            font-family: "Franklin Gothic Medium";
            font-size: large;
        }
        .auto-style3 {
            width: 317px;
            background-color: #CC99FF;
        }
        .auto-style7 {
            width: 349px;
            background-color: #CC99FF;
        }
        .auto-style27 {
            background-color: #CC99FF;
        }
        .auto-style8 {
            text-align: center;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            height: 33px;
            background-color: #9933FF;
        }
        .auto-style47 {
            width: 317px;
            background-color: #CC99FF;
            height: 32px;
        }
        .auto-style22 {
            color: #000000;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        }
        .auto-style48 {
            width: 349px;
            background-color: #CC99FF;
            height: 32px;
        }
        .auto-style49 {
            background-color: #CC99FF;
            height: 32px;
        }
        .auto-style51 {
            width: 317px;
            background-color: #CC99FF;
            height: 31px;
        }
        .auto-style12 {
            width: 349px;
            margin-left: 40px;
            background-color: #CC99FF;
            height: 31px;
        }
        .auto-style52 {
            background-color: #CC99FF;
            height: 31px;
        }
        .auto-style45 {
            text-align: center;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            height: 32px;
            background-color: #9933FF;
        }
        .auto-style10 {
            height: 123px;
            background-color: #CC99FF;
        }
        .auto-style35 {
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            text-align: right;
            background-color: #CC99FF;
            height: 25px;
        }
        .auto-style50 {
            background-color: #CC99FF;
            height: 25px;
        }
        .auto-style29 {
            width: 317px;
            background-color: #9933FF;
        }
        .auto-style28 {
            width: 349px;
            background-color: #9933FF;
        }
        .auto-style13 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            &nbsp;&nbsp;
            <table align="center" class="auto-style2">
                <tr>
                    <td class="auto-style42" colspan="3"><span class="auto-style43">PEDIATRIC CLINICAL SYSTEMPER</span><br class="auto-style43" />
                        <span class="auto-style43">PERPETUAL SUCCOUR GENERAL HOSPITAL</span><br class="auto-style43" />
                        <span class="auto-style43">BILLING</span></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style22" Text="Billing No."></asp:Label>
                        &nbsp;<asp:TextBox ID="BillingNoTextBox" runat="server" OnTextChanged="BillingNoTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <span class="auto-style13">
                        <asp:Label ID="patientlabel1" runat="server" ForeColor="Red" Text="Required" Visible="False" Enabled="False"></asp:Label>
                        </span>
                        <br />
                        <span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="billinglabel" runat="server" ForeColor="Red" Text="Already Exist" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style27">
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style22" Text="Date"></asp:Label>
                        &nbsp;<asp:TextBox ID="DateTextBox" runat="server" TextMode="Date" Width="136px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3">Patient Information</td>
                </tr>
                <tr>
                    <td class="auto-style47">
                        <asp:Label ID="Label4" runat="server" CssClass="auto-style22" Text="Patient Code"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox AutoPostBack="True" ID="PatientCodeTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" OnTextChanged="PatientCodeTextBox_TextChanged" Enabled="False" OnKeyDown="txt_Item_Number_KeyDown"></asp:TextBox>
                        <br />
                        <span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="patientlabel" runat="server" ForeColor="Red" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style48"><span class="auto-style22">&nbsp;&nbsp; </span></td>
                    <td class="auto-style49"><span class="auto-style22">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label5" runat="server" CssClass="auto-style22" Text="Patient Name"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="PatientNameTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="184px" Enabled="False" AutoPostBack="True"></asp:TextBox>
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style27">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style51">
                        <asp:Label ID="Label6" runat="server" CssClass="auto-style22" Text="Age"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="PatientAgeTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="184px" Enabled="False" AutoPostBack="True"></asp:TextBox>
                    </td>
                    <td class="auto-style12"><span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></td>
                    <td class="auto-style52"><span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </span></td>
                </tr>
                <tr>
                    <td class="auto-style3"><span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Service Type<br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:CheckBox ID="ConsultationCheckBox" runat="server" Text="Consultation" />
                        &nbsp;&nbsp;
                        <asp:CheckBox ID="ImmunizationCheckBox" runat="server" Text="Immunization" />
                    </td>
                    <td class="auto-style7">&nbsp;</td>
                    <td class="auto-style27">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style45" colspan="3">Consultation/Vaccine Taken </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label19" runat="server" CssClass="auto-style22" Text="Immunization No."></asp:Label>
                        <span class="auto-style22">&nbsp; </span>
                        <asp:TextBox ID="ImmunizationNoTextBox" runat="server" OnTextChanged="ImmunizationNoTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span class="auto-style13">
                        <asp:Label ID="immunizationlabel" runat="server" ForeColor="Red" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        </span>
                        <br />
                        <span class="auto-style13">
                        <asp:Label ID="immunizationlabel1" runat="server" ForeColor="Red" Text="Diagnosis Code already exists in the datagrid" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style27" colspan="2"><span class="auto-style22">&nbsp;&nbsp; </span></td>
                </tr>
                <tr>
                    <td class="auto-style10" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:GridView ID="GridView1" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CaptionAlign="Top" CellPadding="3" CssClass="auto-style19" GridLines="None" Height="16px" PageSize="1" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="536px" CellSpacing="1" HorizontalAlign="Center">
                            <Columns>
                                <asp:BoundField AccessibleHeaderText="Count" HeaderText="Count" DataField="Count" />
                                <asp:BoundField AccessibleHeaderText="Description" HeaderText="Description" DataField="Description" />
                                <asp:BoundField AccessibleHeaderText="Amount" HeaderText="Amount" DataField="Amount" />
                            </Columns>
                            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                            <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#594B9C" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#33276A" />
                        </asp:GridView>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style35" colspan="2"></td>
                    <td class="auto-style50"><span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                </tr>
                <tr>
                    <td class="auto-style29">
                        <asp:Label ID="Label21" runat="server" CssClass="auto-style22" Text="Prepared By"></asp:Label>
                        &nbsp;<asp:TextBox AutoPostBack="True" ID="PreparedByTextBox" runat="server" BackColor="White" CssClass="auto-style37" OnTextChanged="PreparedByTextBox_TextChanged" Width="181px"></asp:TextBox>
                        <span class="auto-style22">&nbsp; <span class="auto-style13">
                        <br />
                        <asp:Label ID="preparedlabel" runat="server" ForeColor="Yellow" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        <br />
                        <asp:Label ID="preparedlabel1" runat="server" ForeColor="Yellow" Text="The employee is inactive" Visible="False" Enabled="False"></asp:Label>
                        </span> </span></td>
                    <td class="auto-style28">
                        <asp:TextBox ID="PreparedByLabel" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="201px" Enabled="False"></asp:TextBox>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                        <br />
                        </span>
                        <asp:Button ID="save" runat="server" OnClick="save_Click" Text="Save" UseSubmitBehavior="false" BackColor="#66FF33" ForeColor="#CC00FF"/>
                    </td>
                    <td class="auto-style42"><span class="auto-style22">&nbsp;&nbsp;<asp:LinkButton ID="RegistrationLinkButton" runat="server" ForeColor="#FF9900" OnClick="RegistrationLinkButton_Click">Patient Registration Form</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="ConsultationLinkButton" runat="server" ForeColor="#FF9900" OnClick="ConsultationLinkButton_Click">Consultation Form</asp:LinkButton>
                        <br />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></td>
                </tr>
                <tr>
                    <td class="auto-style29">
                        <asp:Label ID="Label22" runat="server" CssClass="auto-style22" Text="Examined By"></asp:Label>
                        &nbsp;<asp:TextBox ID="ExaminedByTextBox" runat="server" BackColor="White" CssClass="auto-style33" OnTextChanged="ExaminedByTextBox_TextChanged" Width="184px" AutoPostBack="True"></asp:TextBox>
                        <span class="auto-style22">&nbsp; <span class="auto-style13">
                        <br />
                        <asp:Label ID="examinedlabel" runat="server" ForeColor="Yellow" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        <br />
                        <asp:Label ID="examinedlabel1" runat="server" ForeColor="Yellow" Text="The employee is either inactive or is not a doctor" Visible="False" Enabled="False"></asp:Label>
                        </span> </span></td>
                    <td class="auto-style28">
                        <asp:TextBox ID="ExaminedByLabel" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="201px" Enabled="False" EnableTheming="True"></asp:TextBox>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp; </span>
                        <asp:Button ID="ExitButton" runat="server" BackColor="#CCFFCC" BorderColor="#99FF99" CssClass="auto-style31" ForeColor="Red" OnClick="ExitButton_Click" UseSubmitBehavior="false" Text="Exit" Width="59px" />
                        <span class="auto-style22">&nbsp;&nbsp; </span>
                        <asp:Button ID="ClearButton" runat="server" BackColor="#CCFFCC" CssClass="auto-style32" ForeColor="#9900CC" OnClick="ClearButton_Click" Text="Clear" Width="49px" UseSubmitBehavior="false" style="height: 26px"/>
                    </td>
                    <td class="auto-style42">
                        <br />
                        <strong>
                        <asp:LinkButton ID="ImmunizationLinkButton" runat="server" ForeColor="#FF9900" OnClick="ImmunizationLinkButton_Click">Immunization Form</asp:LinkButton>
                        </strong>
                        <br />
                        <br />
                        <strong>
                        <asp:LinkButton ID="PrescriptionLinkButton" runat="server" ForeColor="#FF9900" OnClick="PrescriptionLinkButton_Click">Prescription Form</asp:LinkButton>
                        <br />
                        </strong>
                    </td>
                </tr>
            </table>
        </div>
    </form>
    <%--    <form id="form1" runat="server">
        <div>
        </div>
    </form>--%>
</body>
</html>
