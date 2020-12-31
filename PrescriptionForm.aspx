<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrescriptionForm.aspx.cs" Inherits="ELDNET.PrescriptionForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">



        .auto-style1 {
            width: 731px;
            height: 350px;
            border-style: solid;
            border-width: 3px;
        }
        .auto-style4 {
            text-align: center;
            background-color: #009999;
        }
        .auto-style10 {
            color: #FFFFFF;
            font-family: "Courier New", Courier, monospace;
            font-weight: bold;
        }
        .auto-style11 {
            font-family: "Courier New", Courier, monospace;
            font-weight: bold;
        }
        .auto-style15 {
            width: 553px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            color: #669900;
            font-weight: bold;
            background-color: #CCCCFF;
        }
        .auto-style14 {
            width: 553px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            background-color: #CCFFCC;
        }
        .auto-style13 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style26 {
            width: 536px;
            text-align: justify;
            background-color: #CCCCFF;
        }
        .auto-style25 {
            width: 553px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            background-color: #CCFFCC;
            height: 45px;
        }
        .auto-style8 {
            width: 536px;
            text-align: left;
            background-color: #CCCCFF;
            height: 45px;
        }
        .auto-style16 {
            width: 553px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            color: #669900;
            font-weight: bold;
            background-color: #CCFFCC;
        }
        .auto-style3 {
            width: 536px;
            background-color: #CCCCFF;
        }
        .auto-style24 {
            width: 553px;
            text-align: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            background-color: #CCFFCC;
        }
        .auto-style7 {
            width: 553px;
            text-align: justify;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            background-color: #CCFFCC;
        }
        .auto-style2 {
            width: 553px;
            background-color: #CCFFCC;
        }
        .auto-style12 {
            width: 536px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            background-color: #CCCCFF;
        }
        .auto-style27 {
            width: 553px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            background-color: #CCFFCC;
            height: 58px;
        }
        .auto-style28 {
            width: 536px;
            text-align: justify;
            background-color: #CCCCFF;
            height: 58px;
        }
        .auto-style22 {
            color: #000000;
            font-family: "Franklin Gothic Medium", "Arial Narrow", Arial, sans-serif;
        }
        .auto-style19 {
            color: #FFFFFF;
        }
        .auto-style29 {
            width: 553px;
            background-color: #CCFFCC;
            height: 23px;
        }
        .auto-style30 {
            width: 536px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            background-color: #CCCCFF;
            height: 23px;
        }
        </style>
</head>
<body>
    <form id="form2" runat="server">
        <div style="height: 339px">
            <table align="center" class="auto-style1">
                <tr>
                    <td class="auto-style4" colspan="2"><span class="auto-style10">PEDIATRIC CLINICAL SYSTEM</span><br class="auto-style11" />
                        <span class="auto-style10">PERPETUAL SUCCOUR GENERAL HOSPITAL</span><br class="auto-style10" />
                        <span class="auto-style10">PRESCRIPTION</span></td>
                </tr>
                <tr>
                    <%--<td class="auto-style14"><span class="auto-style13">Prescription No.&nbsp;&nbsp; </span>
                        <asp:TextBox ID="PrescriptionNoTextBox" runat="server" CssClass="auto-style13" OnTextChanged="PrescriptionNoTextBox_TextChanged" Width="92px"></asp:TextBox>
                    </td>--%>
                    <td class="auto-style15">Medicine to Prescribe</td>
                </tr>
                <tr>
                    <td class="auto-style27"><span class="auto-style13">Prescription No.&nbsp;&nbsp;
                        <asp:TextBox ID="PrescriptionNoTextBox" runat="server" CssClass="auto-style13" OnTextChanged="PrescriptionNoTextBox_TextChanged" Width="96px" AutoPostBack="True"></asp:TextBox>
                        <br />
                        <asp:Label ID="prescriptionlabel" runat="server" ForeColor="Red" Text="Already Exist" Visible="False"></asp:Label>
                        </span></td>
                    <td class="auto-style28"><span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Medicine Code&nbsp;&nbsp; </span>
                        <asp:TextBox ID="MedicineCodeTextBox" runat="server" CssClass="auto-style13" OnTextChanged="MedicineCodeTextBox_TextChanged" Width="109px" AutoPostBack="True"></asp:TextBox>
                        <asp:Label ID="medicinecodelabel" runat="server" ForeColor="Red" Text="*Not Found" Visible="False" Enabled="False"></asp:Label>
                        <br />
                        <span class="auto-style13">
                        <asp:Label ID="medicinecodelabel1" runat="server" ForeColor="Red" Text="Medicine Code already exists in the datagrid" Visible="False" Enabled="False"></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14"><span class="auto-style13">Consultation No. &nbsp;</span><asp:TextBox ID="ConsultationNoTextBox" runat="server" CssClass="auto-style13" OnTextChanged="ConsultationNoTextBox_TextChanged" Width="96px" Enabled="False" AutoPostBack="True"></asp:TextBox>
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="ConsultationNoTextBox" ErrorMessage="*Already Exist" ForeColor="Red" Visible="False">.</asp:CustomValidator>
                        <br />
                        <asp:Label ID="consultationlabel" runat="server" ForeColor="Red" Text="*Not found, you are going to create a new record" Visible="False" Enabled="False"></asp:Label>
                    </td>
                    <td class="auto-style26"><span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quantity&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="QuantityTextBox" runat="server" CssClass="auto-style13" OnTextChanged="QuantityTextBox_TextChanged" Width="109px" Enabled="False" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="QuantityTextBox" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style25">&nbsp;Date&nbsp;<br />
                        <span class="auto-style22">
                        <asp:TextBox ID="DateTextBox" runat="server" BackColor="White" CssClass="auto-style15" Width="128px" style="margin-left: 0px" TextMode="Date"></asp:TextBox>
                        </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="auto-style13"><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DateTextBox" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        </span></td>
                    <td class="auto-style8"><span class="auto-style13">Remarks&nbsp;&nbsp;&nbsp; </span>
                        <asp:TextBox ID="RemarksTextBox" runat="server" CssClass="auto-style13" OnTextChanged="RemarksTextBox_TextChanged" Width="341px" Enabled="False" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="RemarksTextBox" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">Patient Info</td>
                    <td class="auto-style3" rowspan="5">
                        <asp:GridView ID="GridView1" runat="server" AllowCustomPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#336666" BorderStyle="Solid" BorderWidth="3px" CaptionAlign="Top" CellPadding="12" CssClass="auto-style19" GridLines="Vertical" Height="16px" PageSize="1" ShowFooter="True" ShowHeaderWhenEmpty="True" Width="536px">
                            <Columns>
                                <asp:BoundField AccessibleHeaderText="MedCode" HeaderText="Med Code" DataField="Med Code" />
                                <asp:BoundField AccessibleHeaderText="Name" HeaderText="Name" DataField="Name" />
                                <asp:BoundField AccessibleHeaderText="Dose" HeaderText="Dose" DataField="Dose" />
                                <asp:BoundField AccessibleHeaderText="Description" HeaderText="Description" DataField="Description" />
                                <asp:BoundField AccessibleHeaderText="Quantity" HeaderText="Quantity" DataField="Quantity" />
                                <asp:BoundField AccessibleHeaderText="Remarks" HeaderText="Remarks" DataField="Remarks" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#333333" />
                            <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                            <RowStyle BackColor="White" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F7F7F7" />
                            <SortedAscendingHeaderStyle BackColor="#487575" />
                            <SortedDescendingCellStyle BackColor="#E5E5E5" />
                            <SortedDescendingHeaderStyle BackColor="#275353" />
                        </asp:GridView>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24">Patient Code&nbsp;&nbsp;&nbsp;<br />
                        <asp:TextBox ID="PatientCodeTextBox" runat="server" CssClass="auto-style6" OnTextChanged="PatientCodeTextBox_TextChanged" Width="107px" Enabled="False" AutoPostBack="True"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="PatientCodeTextBox" ErrorMessage="*Required" ForeColor="Red" ValidateRequestMode="Disabled"></asp:RequiredFieldValidator>
                        <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="*Not Found" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style24"><span class="auto-style13">Patient Name&nbsp;&nbsp; </span>
                        <asp:TextBox ID="PatientNameTextBox" runat="server" CssClass="auto-style23" Enabled="False" Width="109px" AutoPostBack="True" OnTextChanged="PatientNameTextBox_TextChanged"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7"><span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Age&nbsp;<br />
                        </span><asp:TextBox ID="AgeTextBox" runat="server" CssClass="auto-style23" Enabled="False" Width="49px" AutoPostBack="True"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="SaveButton" runat="server" CausesValidation="False" CssClass="auto-style22" OnClick="SaveButton_Click" Text="Save" ValidateRequestMode="Disabled" Width="58px" UseSubmitBehavior="false" />
                        <span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:Button ID="ClearButton" runat="server" CausesValidation="False" CssClass="auto-style21" OnClick="ClearButton_Click" Text="Clear" ValidateRequestMode="Disabled" Width="57px" UseSubmitBehavior="false" />
                        <span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                        <asp:Button ID="ExitButton" runat="server" CausesValidation="False" CssClass="auto-style20" OnClick="ExitButton_Click" Text="Exit" ValidateRequestMode="Disabled" Width="56px" UseSubmitBehavior="false" />
                    </td>
                    <td class="auto-style12">
                        <asp:Label ID="Label21" runat="server" CssClass="auto-style22" Text="Prepared By"></asp:Label>
                        &nbsp;<asp:TextBox ID="PreparedByTextBox" runat="server" BackColor="White" Width="160px" OnTextChanged="PreparedByTextBox_TextChanged" AutoPostBack="True"></asp:TextBox>
                        <asp:TextBox ID="PreparedByLabel" runat="server" BackColor="#CCCCFF" CssClass="auto-style33" Width="201px"></asp:TextBox>
                        <br />
                        <span class="auto-style22"> <span class="auto-style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="preparedlabel" runat="server" ForeColor="Red" Text="Not Found" Visible="False" Enabled="False"></asp:Label>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Label ID="preparedlabel1" runat="server" ForeColor="Red" Text="The employee is inactive" Visible="False" Enabled="False"></asp:Label>
                        </span> </span></td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style12">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="ConsultationLinkButton" runat="server" CssClass="auto-style19" OnClick="ConsultationLinkButton_Click" ForeColor="#FF0066">Consultation Form</asp:LinkButton>
                        &nbsp;<br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td class="auto-style12">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:LinkButton ID="RegistrationLinkButton" runat="server" CssClass="auto-style19" OnClick="RegistrationLinkButton_Click" ForeColor="#FF0066">Patient Registration Form</asp:LinkButton>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style29">
                    </td>
                    <td class="auto-style30">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:LinkButton ID="BillingLinkButton" runat="server" CssClass="auto-style19" OnClick="ConsultationLinkButton_Click" ForeColor="#FF0066">Billing Form</asp:LinkButton>
                        <br />
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
