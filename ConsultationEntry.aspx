<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConsultationEntry.aspx.cs" Inherits="ELDNET.ConsultationEntry" %>

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
        .auto-style27 {
            background-color: #CC99FF;
            width: 159px;
        }
        .auto-style22 {
            color: #000000;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        }
        .auto-style8 {
            text-align: center;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
            height: 33px;
            background-color: #9933FF;
        }
        .auto-style12 {
            width: 327px;
            margin-left: 40px;
            background-color: #CC99FF;
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
        }
        .auto-style13 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style33 {}
        .auto-style46 {
            width: 352px;
            background-color: #CC99FF;
        }
        .auto-style49 {
            width: 326px;
            background-color: #CC99FF;
            height: 47px;
        }
        .auto-style50 {
            background-color: #CC99FF;
            height: 47px;
        }
        .auto-style52 {
            text-align: center;
            background-color: #9933FF;
            width: 159px;
        }
        .auto-style53 {
            width: 326px;
            background-color: #CC99FF;
            height: 66px;
        }
        .auto-style54 {
            width: 327px;
            background-color: #CC99FF;
            height: 66px;
        }
        .auto-style55 {
            background-color: #CC99FF;
            width: 159px;
            height: 66px;
        }
        .auto-style56 {
            width: 326px;
            background-color: #CC99FF;
        }
        .auto-style57 {
            width: 327px;
            background-color: #CC99FF;
        }
        .auto-style58 {
            width: 326px;
            background-color: #9933FF;
        }
        .auto-style59 {
            width: 327px;
            background-color: #9933FF;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" class="auto-style2">
                <tr>
                    <td class="auto-style42" colspan="3"><span class="auto-style43">PEDIATRIC CLINICAL SYSTEMPER</span><br class="auto-style43" />
                        <span class="auto-style43">PETUAL SUCCOUR GENERAL HOSPITAL</span><br class="auto-style43" />
                        <span class="auto-style43">CONSULTATION ENTRY</span></td>
                </tr>
                <tr>
                    <td class="auto-style53">
                        <asp:Label ID="Label1" runat="server" CssClass="auto-style22" Text="Consultation No."></asp:Label>
                        &nbsp;<asp:TextBox ID="ConsultationNoTextBox" runat="server" BackColor="White" CssClass="auto-style33" Width="96px" OnTextChanged="ConsultationNoTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="auto-style13">
                        <asp:Label ID="consultationlabel" runat="server" ForeColor="Red" Text="Already Exist" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style54">
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style22" Text="Immunization (referral) No."></asp:Label>
                        &nbsp;<asp:TextBox ID="ImmunizationTextBox" runat="server" BackColor="White" Width="159px" Enabled="False" OnTextChanged="ImmunizationTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <br />
&nbsp;<span class="auto-style13"><asp:Label ID="immunizationlabel" runat="server" ForeColor="Red" Text="No Referral Found, new referral created" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style55">
                        <asp:Label ID="Label3" runat="server" CssClass="auto-style22" Text="Date"></asp:Label>
                        <span class="auto-style22">&nbsp;
                        <asp:TextBox ID="DateTextBox" runat="server" BackColor="White" CssClass="auto-style15" Width="128px" style="margin-left: 0px" TextMode="Date"></asp:TextBox>
                        </span></td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="3">Patient Information</td>
                </tr>
                <tr>
                    <td class="auto-style56">
                        <asp:Label ID="Label4" runat="server" CssClass="auto-style22" Text="Patient Code"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="PatientCodeTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Enabled="False" OnTextChanged="PatientCodeTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <span class="auto-style13">
                        <asp:Label ID="patientcodelabel" runat="server" ForeColor="Red" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style57">
                        <asp:Label ID="Label8" runat="server" CssClass="auto-style22" Text="Father's Name"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="FathersNameTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="215px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style27">
                        <asp:Label ID="Label12" runat="server" CssClass="auto-style22" Text="Age"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="AgeTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style14" Width="65px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style56">
                        <asp:Label ID="Label5" runat="server" CssClass="auto-style22" Text="Patient Name"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="PatientNameTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="184px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style57">
                        <asp:Label ID="Label9" runat="server" CssClass="auto-style22" Text="Mother's Name"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp; </span>
                        <asp:TextBox ID="MothersNameTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style13" Width="213px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style27">
                        <asp:Label ID="Label13" runat="server" CssClass="auto-style22" Text="Weight"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="WeightTextBox" runat="server" BackColor="White" CssClass="auto-style15" Width="65px" AutoPostBack="True"></asp:TextBox>
                        <span class="auto-style22">&nbsp; </span>
                        <asp:Label ID="Label16" runat="server" CssClass="auto-style22" Text="kg."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style56">
                        <asp:Label ID="Label6" runat="server" CssClass="auto-style22" Text="Address"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="AddressTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="184px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="Label10" runat="server" CssClass="auto-style22" Text="Gender"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><asp:TextBox ID="GenderTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style11" Width="94px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style27">
                        <asp:Label ID="Label14" runat="server" CssClass="auto-style22" Text="Height"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="HeightTextBox" runat="server" BackColor="White" CssClass="auto-style16" Width="61px" AutoPostBack="True"></asp:TextBox>
                        <span class="auto-style22">&nbsp; </span>
                        <asp:Label ID="Label17" runat="server" CssClass="auto-style22" Text="cm."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style56">
                        <asp:Label ID="Label7" runat="server" CssClass="auto-style22" Text="Telephone"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="TelephoneTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style57">
                        <asp:Label ID="Label11" runat="server" CssClass="auto-style22" Text="Birthday"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </span>
                        <asp:TextBox ID="BirthdayTextBox" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="94px" Enabled="False"></asp:TextBox>
                    </td>
                    <td class="auto-style27">
                        <asp:Label ID="Label15" runat="server" CssClass="auto-style22" Text="Body Temp."></asp:Label>
                        &nbsp;<asp:TextBox ID="BodyTempTextBox" runat="server" BackColor="White" CssClass="auto-style33" Width="60px" AutoPostBack="True"></asp:TextBox>
                        <span class="auto-style22">&nbsp; </span>
                        <asp:Label ID="Label18" runat="server" CssClass="auto-style22" Text="cel."></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style45" colspan="3">Diagnosis Information</td>
                </tr>
                <tr>
                    <td class="auto-style49">
                        <asp:Label ID="Label19" runat="server" CssClass="auto-style22" Text="Diagnosis Code"></asp:Label>
                        <span class="auto-style22">&nbsp; </span>
                        <asp:TextBox ID="DiagnosisTextBox" runat="server" OnTextChanged="DiagnosisTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                    &nbsp;<span class="auto-style13"><asp:Label ID="diagnosislabel5" runat="server" ForeColor="Red" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        </span>
                        <br />
                        <span class="auto-style13">
                        <asp:Label ID="diagnosislabel1" runat="server" ForeColor="Red" Text="Diagnosis Code already exists in the datagrid" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                    <td class="auto-style50" colspan="2">
                        <asp:Label ID="Label20" runat="server" CssClass="auto-style22" Text="Physician's Notes/Directions"></asp:Label>
                        <span class="auto-style22">&nbsp;&nbsp; </span>
                        <asp:TextBox ID="PhysiciansNotesTextBox" runat="server" BackColor="White" CssClass="auto-style33" Width="313px" OnTextChanged="PhysiciansNotesTextBox_TextChanged" Enabled="False" AutoPostBack="True"></asp:TextBox>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style10" colspan="3">
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CaptionAlign="Top" CellPadding="3" GridLines="None" Height="16px" PageSize="1" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="536px" CellSpacing="1" HorizontalAlign="Center" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                            <Columns>
                                <asp:BoundField AccessibleHeaderText="Diagnosis Code" HeaderText="Diagnosis Code" DataField="Diagnosis Code" />
                                <asp:BoundField AccessibleHeaderText="Description" HeaderText="Description" DataField="Description" />
                                <asp:BoundField AccessibleHeaderText="Physician's Notes/Directions" HeaderText="Physician's Notes/Directions" DataField="Physician's Notes/Directions" />
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
                    <td class="auto-style35" colspan="2">
                        <asp:CheckBox ID="ForAdmissionCheckBox" runat="server" CssClass="auto-style22" Text="For Admission?" />
                    </td>
                    <td class="auto-style27"><span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:CheckBox ID="ForLabTestCheckBox" runat="server" CssClass="auto-style22" Text="For Laboratory Test?" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style58">
                        <asp:Label ID="Label21" runat="server" CssClass="auto-style22" Text="Prepared By"></asp:Label>
                        &nbsp;<asp:TextBox ID="PreparedByTextBox" runat="server" BackColor="White" Width="160px" OnTextChanged="PreparedByTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <span class="auto-style22">&nbsp; <span class="auto-style13">
                        <asp:Label ID="preparedlabel" runat="server" ForeColor="Yellow" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        <br />
                        <asp:Label ID="preparedlabel1" runat="server" ForeColor="Yellow" Text="The employee is inactive" Visible="False" Enabled="False"></asp:Label>
                        </span> </span></td>
                    <td class="auto-style59">
                        <asp:TextBox ID="PreparedByLabel" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="201px"></asp:TextBox>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:Button ID="SaveButton" runat="server" BackColor="#CCCCFF" CssClass="auto-style26" ForeColor="Black" Text="Save" Width="101px" UseSubmitBehavior="false" OnClick="SaveButton_Click" />
                    </td>
                    <td class="auto-style52"><span class="auto-style22">&nbsp; </span>
                        <asp:LinkButton ID="ImmunizationLinkButton" runat="server" CssClass="auto-style46" OnClick="ImmunizationLinkButton_Click">Immunization Form</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style58">
                        <asp:Label ID="Label22" runat="server" CssClass="auto-style22" Text="Examined By"></asp:Label>
                        &nbsp;<asp:TextBox ID="ExaminedByTextBox" runat="server" BackColor="White" Width="156px" OnTextChanged="ExaminedByTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <span class="auto-style22">&nbsp; <span class="auto-style13">
                        <asp:Label ID="examinedlabel" runat="server" ForeColor="Yellow" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        <br />
                        <asp:Label ID="examinedlabel1" runat="server" ForeColor="Yellow" Text="The employee is either inactive or is not a doctor" Visible="False" Enabled="False"></asp:Label>
                        </span> </span></td>
                    <td class="auto-style59">
                        <asp:TextBox ID="ExaminedByLabel" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="201px"></asp:TextBox>
                        <span class="auto-style22">&nbsp;&nbsp;&nbsp; </span>
                        <asp:Button ID="ExitButton" runat="server" BackColor="#CCFFCC" BorderColor="#99FF99" CssClass="auto-style31" ForeColor="Red" Text="Exit" Width="59px" UseSubmitBehavior="false" OnClick="ExitButton_Click" />
                        <span class="auto-style22">&nbsp;&nbsp; </span>
                        <asp:Button ID="ClearButton" runat="server" BackColor="#CCFFCC" CssClass="auto-style32" ForeColor="#9900CC" Text="Clear" Width="49px" UseSubmitBehavior="false" OnClick="ClearButton_Click" />
                    </td>
                    <td class="auto-style52">
                        <asp:LinkButton ID="RegistrationLinkButton" runat="server" CssClass="auto-style46" OnClick="RegistrationLinkButton_Click">Patient Registration Form</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="BillingLinkButton" runat="server" CssClass="auto-style46" OnClick="BillingLinkButton_Click">Billing Form</asp:LinkButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
