using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace ELDNET
{
    public partial class ConsultationEntry : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["GridDataSet"] = new DataSet();
                DataTable table = new DataTable("GridTable");
                table.Columns.Add(new DataColumn("Diagnosis Code"));
                table.Columns.Add(new DataColumn("Description"));
                table.Columns.Add(new DataColumn("Physician's Notes/Directions"));


                ((DataSet)ViewState["GridDataSet"]).Tables.Add(table);
                GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
                if (GridView1.DataSource == null)
                {
                    GridView1.DataSource = new string[] { };
                }
                GridView1.DataBind();
            }
            diagnosislabel5.Visible = false;
        }
        private void BindGrid()
        {

            GridView1.DataSource = table;
            GridView1.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void ImmunizationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ImmunizationEntry.aspx");
        }

        protected void RegistrationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientRegistrationForm.aspx");
        }

        protected void PhysiciansNotesTextBox_TextChanged(object sender, EventArgs e)
        {
            
            SqlConnection con1 = new SqlConnection(connection);
            SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * FROM CONSULTATIONDETAILFILE WHERE CONDDIAGCODE LIKE '" + DiagnosisTextBox.Text + "%'";
            string sql2 = "Select * FROM CONSULTATIONDETAILFILE";

            //SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            SqlCommand Comm1 = new SqlCommand(sql1, con1);
            SqlCommand Comm2 = new SqlCommand(sql2, con2);
            con1.Open();
            con2.Open();
            SqlDataReader dataReader = Comm1.ExecuteReader();
            SqlDataReader dataReader2 = Comm2.ExecuteReader();
            bool found = false;
            //dataReader.Read();
            //dataReader2.Read();

            while (dataReader.Read())
            {
                //dataReader.Read();
                if (dataReader["CONDDIAGCODE"].ToString() != DiagnosisTextBox.Text)
                {
                    DiagnosisTextBox.Text = "";
                    //PhysiciansNotesTextBox.Enabled = false;

                }
                else
                {
                    PhysiciansNotesTextBox.Enabled = true;
                    DiagnosisTextBox.Enabled = false;
                    PhysiciansNotesTextBox.Focus();
                    DataRow row = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].NewRow();
                    row["Diagnosis Code"] = DiagnosisTextBox.Text;
                    row["Description"] = dataReader["CONDNOTES"].ToString();
                    row["Physician's Notes/Directions"] = PhysiciansNotesTextBox.Text;
                    //row["Description"] = dataReader["MEDDESC"].ToString();
                    //row["Quantity"] = QuantityTextBox.Text;
                    //row["Description"] = "2";
                    //row["Amount"] = "434";

                    ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows.Add(row);
                    GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
                    GridView1.DataBind();
                    DiagnosisTextBox.Text = "";
                }
            }

            con1.Close();
            con2.Close();
            dataReader.Close();
            dataReader2.Close();
            DiagnosisTextBox.Enabled = true;
            DiagnosisTextBox.Focus();
            PhysiciansNotesTextBox.Text = "";
        }

        protected void ConsultationNoTextBox_TextChanged(object sender, EventArgs e)
        {
          
            SqlConnection con1 = new SqlConnection(connection);
            SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * from CONSULTATIONHEADERFILE";
            SqlCommand Comm1 = new SqlCommand(sql1, con1);

            string sql2 = "Select * from CONSULTATIONDETAILFILE";
            SqlCommand Comm2 = new SqlCommand(sql2, con2);

            con1.Open();
            con2.Open();
            SqlDataReader reader1 = Comm1.ExecuteReader();
            SqlDataReader reader2 = Comm2.ExecuteReader();
            bool found = false;

            while (reader1.Read())
            {

                if (reader1["CONHNO"].ToString() == ConsultationNoTextBox.Text/* || reader2["BILLDNO"].ToString() == BillingNoTextBox.Text*/)
                {
                    found = true;
                    ConsultationNoTextBox.Text = "";
                    ImmunizationTextBox.Enabled = false;
                    consultationlabel.Visible = true;
                    ImmunizationTextBox.Focus();
                    break;

                }

            }

            while (/*reader1.Read() && */reader2.Read())
            {

                if (reader2["CONDNO"].ToString() == ConsultationNoTextBox.Text)
                {
                    found = true;
                    ConsultationNoTextBox.Text = "";
                    ImmunizationTextBox.Enabled = false;
                    consultationlabel.Visible = true;
                    break;
                }
            }

            reader1.Close();
            reader2.Close();
            con1.Close();
            con2.Close();

            if (found == false)
            {
                ConsultationNoTextBox.Enabled = false;
                ImmunizationTextBox.Enabled = true;
                consultationlabel.Visible = false;
                ImmunizationTextBox.Focus();
            }
        }

        protected void ImmunizationTextBox_TextChanged(object sender, EventArgs e)
        {
           
            SqlConnection con1 = new SqlConnection(connection);
            //SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * from IMMUNIZATIONHEADERFILE";
            SqlCommand Comm1 = new SqlCommand(sql1, con1);

            //string sql2 = "Select * from BILLINGDETAILFILE";
            //SqlCommand Comm2 = new SqlCommand(sql2, con2);

            con1.Open();
            //con2.Open();
            SqlDataReader reader1 = Comm1.ExecuteReader();
            //SqlDataReader reader2 = Comm2.ExecuteReader();
            bool found = false;



            while (reader1.Read())
            {

                if (reader1["IMMHIMMUNO"].ToString() == ImmunizationTextBox.Text/* || reader2["BILLDNO"].ToString() == BillingNoTextBox.Text*/)
                {
                    found = true;
                    ImmunizationTextBox.Enabled = false;
                    DateTextBox.Text = Convert.ToDateTime(reader1["IMMHDATE"]).ToString("dd/MM/yyyy");
                    PatientCodeTextBox.Text = (reader1["IMMHPATCODE"].ToString());
                    WeightTextBox.Text = (reader1["IMMHPATWEIGHT"].ToString());
                    HeightTextBox.Text = (reader1["IMMHPATHEIGHT"].ToString());
                    PreparedByLabel.Text = (reader1["IMMHPREPBY"].ToString());
                    ExaminedByLabel.Text = (reader1["IMMHIMMUBY"].ToString());

                    string patcode = reader1["IMMHPATCODE"].ToString();
                    SqlConnection con2 = new SqlConnection(connection);
                    string sql2 = "Select * FROM PATIENTFILE WHERE PATCODE LIKE '" + patcode.ToString() + "%'";
                    SqlCommand Comm2 = new SqlCommand(sql2, con2);
                    con2.Open();
                    SqlDataReader dataReader2 = Comm2.ExecuteReader();
                    dataReader2.Read();

                    PatientNameTextBox.Text = (dataReader2["PATNAME"].ToString());
                    AddressTextBox.Text = (dataReader2["PATADDR"].ToString());
                    TelephoneTextBox.Text = (dataReader2["PATTEL"].ToString());
                    FathersNameTextBox.Text = (dataReader2["PATFATHNAME"].ToString());
                    MothersNameTextBox.Text = (dataReader2["PATMOTHNAME"].ToString());
                    GenderTextBox.Text = (dataReader2["PATGENDER"].ToString());
                    BirthdayTextBox.Text = Convert.ToDateTime(dataReader2["PATBDATE"]).ToString("dd/MM/yyyy");
                    AgeTextBox.Text = (dataReader2["PATAGE"].ToString());



                    //motherLabel.Text = reader1["PATIENTMOTHERSNAME"].ToString();
                    //BillingNoTextBox.Text = "";
                    //PatientCodeTextBox.Enabled = false;
                    //billinglabel.Visible = true;
                    break;

                }

            }

            //while (/*reader1.Read() && */reader2.Read())
            //{

            //    if (reader2["BILLDNO"].ToString() == BillingNoTextBox.Text)
            //    {
            //        found = true;
            //        BillingNoTextBox.Text = "";
            //        PatientCodeTextBox.Enabled = false;
            //        billinglabel.Visible = true;
            //        break;
            //    }
            //}

            //reader1.Close();
            //reader2.Close();
            //con1.Close();
            //con2.Close();

            if (found == false)
            {
                PatientCodeTextBox.Enabled = true;
                PatientCodeTextBox.Focus();
                immunizationlabel.Visible = true;
                ImmunizationTextBox.Enabled = false;
            }
        }

        protected void PatientCodeTextBox_TextChanged(object sender, EventArgs e)
        {
           
            SqlConnection con2 = new SqlConnection(connection);
            string sql2 = "Select * FROM PATIENTFILE";
            SqlCommand Comm2 = new SqlCommand(sql2, con2);
            con2.Open();
            SqlDataReader dataReader2 = Comm2.ExecuteReader();
            bool found = false;

            while (dataReader2.Read())
            {
                if (dataReader2["PATCODE"].ToString() == PatientCodeTextBox.Text)
                {
                    found = true;
                    PatientNameTextBox.Text = (dataReader2["PATNAME"].ToString());
                    AddressTextBox.Text = (dataReader2["PATADDR"].ToString());
                    TelephoneTextBox.Text = (dataReader2["PATTEL"].ToString());
                    FathersNameTextBox.Text = (dataReader2["PATFATHNAME"].ToString());
                    MothersNameTextBox.Text = (dataReader2["PATMOTHNAME"].ToString());
                    GenderTextBox.Text = (dataReader2["PATGENDER"].ToString());
                    BirthdayTextBox.Text = Convert.ToDateTime(dataReader2["PATBDATE"]).ToString("dd/MM/yyyy");
                    AgeTextBox.Text = (dataReader2["PATAGE"].ToString());
                    HeightTextBox.Text = (dataReader2["PATHEIGHT"].ToString());
                    WeightTextBox.Text = (dataReader2["PATWEIGHT"].ToString());
                    PatientCodeTextBox.Enabled = false;
                    patientcodelabel.Visible = false;
                }
            }

            if (found == false)
            {
                PatientCodeTextBox.Enabled = true;
                PatientCodeTextBox.Text = "";
                PatientCodeTextBox.Focus();
                patientcodelabel.Visible = true;
            }
        }

        protected void PreparedByTextBox_TextChanged(object sender, EventArgs e)
        {
            preparedlabel.Visible = false;
            preparedlabel1.Visible = false;
          
            SqlConnection con = new SqlConnection(connection);
            string sql = "Select * from EMPLOYEEFILE";
            SqlCommand Comm1 = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = Comm1.ExecuteReader();
            bool found = false;

            while (reader.Read())
            {
                if (reader["EMPCODE"].ToString() == PreparedByTextBox.Text)
                {
                    found = true;
                    if (reader["EMPSTATUS"].ToString() == "Inactive")
                    {
                        //MessageBox.Show("The staff is Inactive at the moment, please choose another Staff");
                        preparedlabel1.Visible = true;
                        PreparedByTextBox.Text = "";
                        PreparedByLabel.Text = "";
                    }
                    else
                    {
                        PreparedByLabel.Text = reader["EMPFNAME"].ToString() + " " + reader["EMPLNAME"].ToString() + " " + reader["EMPMNAME"].ToString();
                        PreparedByTextBox.Enabled = false;
                        break;
                    }
                }

            }
            reader.Close();
            con.Close();
            if (found == false)
            {
                //MessageBox.Show("Employee does not exist!");
                PreparedByTextBox.Text = "";
                preparedlabel.Visible = true;
            }
        }

        protected void ExaminedByTextBox_TextChanged(object sender, EventArgs e)
        {
            examinedlabel.Visible = false;
            examinedlabel1.Visible = false;
          
            SqlConnection con = new SqlConnection(connection);
            string sql = "Select * from EMPLOYEEFILE";
            SqlCommand Comm1 = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = Comm1.ExecuteReader();
            bool found = false;

            while (reader.Read())
            {
                if (reader["EMPCODE"].ToString() == ExaminedByTextBox.Text)
                {
                    found = true;
                    if (reader["EMPPOSITION"].ToString() != "Doctor" || reader["EMPSTATUS"].ToString() == "Inactive")
                    {
                        examinedlabel1.Visible = true;
                        //MessageBox.Show("The staff is either not a Doctor or Inactive. Please choose another staff.");
                        ExaminedByTextBox.Text = "";
                        ExaminedByLabel.Text = "";
                    }
                    else
                    {
                        ExaminedByLabel.Text = reader["EMPFNAME"].ToString() + " " + reader["EMPLNAME"].ToString() + " " + reader["EMPMNAME"].ToString();
                        ExaminedByTextBox.Enabled = false;
                        break;
                    }

                }
            }
            reader.Close();
            con.Close();

            if (found == false)
            {
                examinedlabel.Visible = true;
                //MessageBox.Show("Employee does not exist!");
                ExaminedByTextBox.Text = "";
            }
        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void DiagnosisTextBox_TextChanged(object sender, EventArgs e)
        {
          
            SqlConnection con1 = new SqlConnection(connection);

            string sql1 = "Select * FROM CONSULTATIONDETAILFILE WHERE CONDDIAGCODE LIKE '" + DiagnosisTextBox.Text + "%'";
            //SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            SqlCommand Comm1 = new SqlCommand(sql1, con1);
            con1.Open();
            SqlDataReader dataReader1 = Comm1.ExecuteReader();
            //bool found = false;

            //if (DiagnosisCodeTextBox.Text != null)
            //{
            //    PhysiciansNotesTextBox.Focus();
            //}



            //dataReader.Read();
            //dataReader2.Read();

            if(dataReader1.HasRows)
            {
                diagnosislabel5.Visible = false;
                while (dataReader1.Read())
                {
                    if (dataReader1["CONDDIAGCODE"].ToString() == DiagnosisTextBox.Text)
                    {
                        DiagnosisTextBox.Enabled = false;
                        PhysiciansNotesTextBox.Enabled = true;
                        PhysiciansNotesTextBox.Focus();
                        diagnosislabel1.Visible = false;

                    }
                    else
                    {

                        diagnosislabel5.Visible = true;
                        DiagnosisTextBox.Text = "";
                    }
                }
            }
            else
            {
                diagnosislabel5.Visible = true;
                DiagnosisTextBox.Text = "";
            }

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (DiagnosisTextBox.Text == row.Cells[0].Text)
                {
                    PhysiciansNotesTextBox.Enabled = false;
                    diagnosislabel1.Visible = true;
                    //diagnosislabel5.Visible = false;
                    DiagnosisTextBox.Enabled = true;
                    DiagnosisTextBox.Text = "";
                    DiagnosisTextBox.Focus();
                }
            }
            con1.Close();
            dataReader1.Close();
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ConsultationNoTextBox.Text) || string.IsNullOrEmpty(PatientCodeTextBox.Text) || string.IsNullOrEmpty(DateTextBox.Text) ||
                    string.IsNullOrEmpty(PreparedByLabel.Text) || string.IsNullOrEmpty(ExaminedByLabel.Text) || string.IsNullOrEmpty(WeightTextBox.Text) ||
                    string.IsNullOrEmpty(HeightTextBox.Text) || string.IsNullOrEmpty(BodyTempTextBox.Text) || GridView1.Rows.Count == 0)
            {
                Response.Write("<script>alert('Cannot save the data, there are missing fields.')</script>");
            }
            else
            {
                try
                {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);

                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    //int amount = 0;
                    //foreach (DataRow row in ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows)
                    //{
                    //    amount += Convert.ToInt32(row["Amount"]);
                    //}
                    string status = "";

                    if (ForAdmissionCheckBox.Checked == true)
                    {
                        status = "AD";
                    }
                    else if (ForLabTestCheckBox.Checked == true)
                    {
                        status = "LT";
                    }
                    else if (ForLabTestCheckBox.Checked == true && ForAdmissionCheckBox.Checked == true)
                    {
                    status = "BT";
                    }
                    else if (ForLabTestCheckBox.Checked == false || ForAdmissionCheckBox.Checked == false)
                    {
                    status = "NA";
                    }
                    else
                    {
                    }




                    string immuhcomstring = "INSERT INTO CONSULTATIONHEADERFILE VALUES (@CONHNO,@CONHIMMREF,@CONHDATE,@CONHPATCODE,@CONHPATWEIGHT,@CONHPATHEIGHT,@CONHPATBODYTEMP,@CONHREFSLIPS)";
                    SqlCommand immuhcomobj = new SqlCommand(immuhcomstring, con);
                    immuhcomobj.Parameters.AddWithValue("@CONHNO", ConsultationNoTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@CONHIMMREF", ImmunizationTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@CONHDATE", DateTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@CONHPATCODE", PatientCodeTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@CONHPATWEIGHT", WeightTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@CONHPATHEIGHT", HeightTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@CONHPATBODYTEMP", BodyTempTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@CONHREFSLIPS", status);

                    immuhcomobj.ExecuteNonQuery();


                    foreach (DataRow row in ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows)
                    {
                        string immudcomstring = "INSERT INTO CONSULTATIONDETAILFILE VALUES (@CONDNO,@CONDDIAGCODE,@CONDNOTES,'Active')";
                        SqlCommand immudcomobj = new SqlCommand(immudcomstring, con);
                        immudcomobj.Parameters.AddWithValue("@CONDNO", ConsultationNoTextBox.Text);
                        immudcomobj.Parameters.AddWithValue("@CONDDIAGCODE", row["Diagnosis Code"].ToString());
                        immudcomobj.Parameters.AddWithValue("@CONDNOTES", row["Physician's Notes/Directions"].ToString());
                        //immudcomobj.Parameters.AddWithValue("@BILLDSTATUS", 'Active');

                        immudcomobj.ExecuteNonQuery();

                    }
                    Response.Write("<script>alert('Succesfully Saved')</script>");
                    con.Close();
                }
                catch (Exception error)
                {
                    Response.Write(error.Message);
                }
                ClearButton_Click(sender, e);
            }
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            ConsultationNoTextBox.Text = "";
            DateTextBox.Text = "";
            ImmunizationTextBox.Text = "";
            PatientCodeTextBox.Text = "";
            PatientNameTextBox.Text = "";
            AddressTextBox.Text = "";
            TelephoneTextBox.Text = "";
            FathersNameTextBox.Text = "";
            MothersNameTextBox.Text = "";
            GenderTextBox.Text = "";
            BirthdayTextBox.Text = "";
            AgeTextBox.Text = "";
            WeightTextBox.Text = "";
            HeightTextBox.Text = "";
            BodyTempTextBox.Text = "";
            DiagnosisTextBox.Text = "";
            PhysiciansNotesTextBox.Text = "";
            ForLabTestCheckBox.Checked = false;
            ForAdmissionCheckBox.Checked = false;
            PreparedByTextBox.Text = "";
            PreparedByLabel.Text = "";
            ExaminedByTextBox.Text = "";
            ExaminedByLabel.Text = "";
            PreparedByTextBox.Enabled = true;
            ExaminedByTextBox.Enabled = true;
            preparedlabel.Visible = false;
            examinedlabel.Visible = false;
            ConsultationNoTextBox.Enabled = true;
            ViewState["GridDataSet"] = new DataSet();
            DataTable table = new DataTable("GridTable");
            table.Columns.Add(new DataColumn("Diagnosis Code"));
            table.Columns.Add(new DataColumn("Description"));
            table.Columns.Add(new DataColumn("Physician's Notes/Directions"));


            ((DataSet)ViewState["GridDataSet"]).Tables.Add(table);
            GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
            if (GridView1.DataSource == null)
            {
                GridView1.DataSource = new string[] { };
            }
            GridView1.DataBind();
        }

        protected void ExitButton_Click(object sender, EventArgs e)
        {
            System.Environment.Exit(1);
        }

        protected void BillingLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("BillingForm.aspx");
        }
    }
}