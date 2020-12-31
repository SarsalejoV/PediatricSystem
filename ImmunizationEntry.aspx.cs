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
    public partial class ImmunizationEntry : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["GridDataSet"] = new DataSet();
                DataTable table = new DataTable("GridTable");
                table.Columns.Add(new DataColumn("Vaccine Code"));
                table.Columns.Add(new DataColumn("Name"));
                table.Columns.Add(new DataColumn("Description"));
                table.Columns.Add(new DataColumn("Shot Number"));
                table.Columns.Add(new DataColumn("Reaction"));


                ((DataSet)ViewState["GridDataSet"]).Tables.Add(table);
                GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
                if (GridView1.DataSource == null)
                {
                    GridView1.DataSource = new string[] { };
                }
                GridView1.DataBind();

                
            }
        }
        private void BindGrid()
        {

            GridView1.DataSource = table;
            GridView1.DataBind();
        }
        protected void ConsultationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultationEntry.aspx");
        }

        protected void RegistrationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientRegistrationForm.aspx");
        }

        protected void ImmunizationCodeTextBox_TextChanged(object sender, EventArgs e)
        {
          
            SqlConnection con1 = new SqlConnection(connection);
            SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * from IMMUNIZATIONHEADERFILE";
            SqlCommand Comm1 = new SqlCommand(sql1, con1);

            string sql2 = "Select * from IMMUNIZATIONDETAILFILE";
            SqlCommand Comm2 = new SqlCommand(sql2, con2);

            con1.Open();
            con2.Open();
            SqlDataReader reader1 = Comm1.ExecuteReader();
            SqlDataReader reader2 = Comm2.ExecuteReader();
            bool found = false;

            while (reader1.Read())
            {

                if (reader1["IMMHIMMUNO"].ToString() == ImmunizationCodeTextBox.Text/* || reader2["BILLDNO"].ToString() == BillingNoTextBox.Text*/)
                {
                    found = true;
                    ImmunizationCodeTextBox.Text = "";
                    PatientCodeTextBox.Enabled = false;
                    immunizationlabel.Visible = true;
                    break;

                }

            }

            while (/*reader1.Read() && */reader2.Read())
            {

                if (reader2["IMMDIMMUHNO"].ToString() == ImmunizationCodeTextBox.Text)
                {
                    found = true;
                    ImmunizationCodeTextBox.Text = "";
                    PatientCodeTextBox.Enabled = false;
                    immunizationlabel.Visible = true;
                    break;
                }
            }

            reader1.Close();
            reader2.Close();
            con1.Close();
            con2.Close();

            if (found == false)
            {
                ImmunizationCodeTextBox.Enabled = false;
                PatientCodeTextBox.Enabled = true;
                immunizationlabel.Visible = false;
                PatientCodeTextBox.Focus();
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

        protected void ImmunizedByTextBox_TextChanged(object sender, EventArgs e)
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
                if (reader["EMPCODE"].ToString() == ImmunizedByTextBox.Text)
                {
                    found = true;
                    if (reader["EMPPOSITION"].ToString() != "Doctor" || reader["EMPSTATUS"].ToString() == "Inactive")
                    {
                        examinedlabel1.Visible = true;
                        //MessageBox.Show("The staff is either not a Doctor or Inactive. Please choose another staff.");
                        ImmunizedByTextBox.Text = "";
                        ImmunizedByLabel.Text = "";
                    }
                    else
                    {
                        ImmunizedByLabel.Text = reader["EMPFNAME"].ToString() + " " + reader["EMPLNAME"].ToString() + " " + reader["EMPMNAME"].ToString();
                        ImmunizedByTextBox.Enabled = false;
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
                ImmunizedByTextBox.Text = "";
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

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }

        protected void VaccineCodeTextBox_TextChanged(object sender, EventArgs e)
        {
            //immunizationlabel.Visible = false;
            //immunizationlabel1.Visible = false;
            vaccinelabel1.Visible = false;
            vaccinelabel3.Visible = false;
         
            SqlConnection con1 = new SqlConnection(connection);
            //SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * FROM VACCINEFILE WHERE VACCODE LIKE '" + VaccineCodeTextBox.Text + "%'";
            //string sql2 = "Select * FROM IMMUNIZATIONDETAILFILE";

            //SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            SqlCommand Comm1 = new SqlCommand(sql1, con1);
            //SqlCommand Comm2 = new SqlCommand(sql2, con2);
            con1.Open();
            //con2.Open();
            SqlDataReader dataReader1 = Comm1.ExecuteReader();
            //SqlDataReader dataReader2 = Comm2.ExecuteReader();
            //bool found = false;
            //dataReader.Read();
            //dataReader2.Read();

            //foreach (DataRow row in ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows)

            

            if(dataReader1.HasRows)
            {
                vaccinelabel3.Visible = false;
                while (dataReader1.Read())
                {
                    if (dataReader1["VACCODE"].ToString() != VaccineCodeTextBox.Text)
                    {
                        VaccineCodeTextBox.Text = "";
                        VaccineCodeTextBox.Focus();
                        vaccinelabel3.Visible = true;
                    }
                    else
                    {
                        VaccineCodeTextBox.Enabled = false;
                        ShotNumberTextBox.Focus();
                        vaccinelabel3.Visible = false;
                        ShotNumberTextBox.Enabled = true;
                    }
                }
            }
            else
            {
                vaccinelabel3.Visible = true;
                VaccineCodeTextBox.Text = "";
            }

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (VaccineCodeTextBox.Text == row.Cells[0].Text)
                {
                    VaccineCodeTextBox.Enabled = true;
                    vaccinelabel1.Visible = true;
                    VaccineCodeTextBox.Text = "";
                    VaccineCodeTextBox.Focus();
                    vaccinelabel3.Visible = false;
                    ShotNumberTextBox.Enabled = false;
                    ReactionTextBox.Enabled = false;
                }
            }


            con1.Close();
            //con2.Close();
            dataReader1.Close();
            //dataReader2.Close();
        }

        protected void ShotNumberTextBox_TextChanged(object sender, EventArgs e)
        {
            if(ShotNumberTextBox.Text == "")
            {
                ReactionTextBox.Enabled = false;
                ShotNumberTextBox.Focus();
            }
            else
            {
                ReactionTextBox.Enabled = true;
                ShotNumberTextBox.Enabled = false;
                ReactionTextBox.Focus();
            }
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            ImmunizationCodeTextBox.Text = "";
            DateTextBox0.Text = "";
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
            VaccineCodeTextBox.Text = "";
            ShotNumberTextBox.Text = "";
            ReactionTextBox.Text = "";
            PreparedByTextBox.Text = "";
            PreparedByLabel.Text = "";
            ImmunizedByTextBox.Text = "";
            ImmunizedByLabel.Text = "";
            PreparedByTextBox.Enabled = true;
            ImmunizedByTextBox.Enabled = true;
            preparedlabel.Visible = false;
            examinedlabel.Visible = false;
            //shotnumlabel.Visible = false;
            //shotnumlabel1.Visible = false;
            ImmunizationCodeTextBox.Enabled = true;
            VaccineCodeTextBox.Enabled = true;
            ViewState["GridDataSet"] = new DataSet();
            DataTable table = new DataTable("GridTable");
            table.Columns.Add(new DataColumn("Vaccine Code"));
            table.Columns.Add(new DataColumn("Name"));
            table.Columns.Add(new DataColumn("Description"));
            table.Columns.Add(new DataColumn("Shot Number"));
            table.Columns.Add(new DataColumn("Reaction"));


            ((DataSet)ViewState["GridDataSet"]).Tables.Add(table);
            GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
            if (GridView1.DataSource == null)
            {
                GridView1.DataSource = new string[] { };
            }
            GridView1.DataBind();
        }

        protected void ReactionTextBox_TextChanged(object sender, EventArgs e)
        {
         
            SqlConnection con1 = new SqlConnection(connection);
            SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * FROM VACCINEFILE WHERE VACCODE LIKE '" + VaccineCodeTextBox.Text + "%'";
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
                //if (dataReader["CONDDIAGCODE"].ToString() != DiagnosisTextBox.Text)
                //{
                //    DiagnosisTextBox.Text = "";
                //    //PhysiciansNotesTextBox.Enabled = false;

                //}
                //else
                //{
                //PhysiciansNotesTextBox.Enabled = true;
                //DiagnosisCodeTextBox.Enabled = false;
                ReactionTextBox.Focus();
                DataRow row = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].NewRow();
                row["Vaccine Code"] = VaccineCodeTextBox.Text;
                row["Name"] = dataReader["VACNAME"].ToString();
                row["Description"] = dataReader["VACDESC"].ToString();
                row["Shot Number"] = ShotNumberTextBox.Text;
                row["Reaction"] = ReactionTextBox.Text;
                //row["Description"] = dataReader["MEDDESC"].ToString();
                //row["Quantity"] = QuantityTextBox.Text;
                //row["Description"] = "2";
                //row["Amount"] = "434";

                ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows.Add(row);
                GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
                GridView1.DataBind();
                VaccineCodeTextBox.Text = "";
                ShotNumberTextBox.Text = "";
                //}
            }

            con1.Close();
            con2.Close();
            dataReader.Close();
            dataReader2.Close();
            VaccineCodeTextBox.Enabled = true;
            VaccineCodeTextBox.Focus();
            ReactionTextBox.Text = "";
            ReactionTextBox.Enabled = false;
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ImmunizationCodeTextBox.Text) || string.IsNullOrEmpty(PatientCodeTextBox.Text) || string.IsNullOrEmpty(DateTextBox0.Text) ||
                    string.IsNullOrEmpty(PreparedByLabel.Text) || string.IsNullOrEmpty(WeightTextBox.Text) || string.IsNullOrEmpty(HeightTextBox.Text) ||
                    string.IsNullOrEmpty(ImmunizedByLabel.Text) || GridView1.Rows.Count == 0)
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

                    string immuhcomstring = "INSERT INTO IMMUNIZATIONHEADERFILE VALUES (@IMMHIMMUNO,@IMMHDATE,@IMMHPATCODE,@IMMHPATWEIGHT,@IMMHPATHEIGHT,@IMMHPREPBY,@IMMHIMMUBY,'Active')";
                    SqlCommand immuhcomobj = new SqlCommand(immuhcomstring, con);
                    immuhcomobj.Parameters.AddWithValue("@IMMHIMMUNO", ImmunizationCodeTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@IMMHDATE", DateTextBox0.Text);
                    immuhcomobj.Parameters.AddWithValue("@IMMHPATCODE", PatientCodeTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@IMMHPATWEIGHT", WeightTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@IMMHPATHEIGHT", HeightTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@IMMHPREPBY", PreparedByLabel.Text);
                    immuhcomobj.Parameters.AddWithValue("@IMMHIMMUBY", ImmunizedByLabel.Text);

                    immuhcomobj.ExecuteNonQuery();


                    foreach (DataRow row in ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows)
                    {
                        string immudcomstring = "INSERT INTO IMMUNIZATIONDETAILFILE VALUES (@IMMDIMMUHNO,@IMMDVACCODE,@IMMDSHOTNUM,@IMMDREACTION,'Active')";
                        SqlCommand immudcomobj = new SqlCommand(immudcomstring, con);
                        immudcomobj.Parameters.AddWithValue("@IMMDIMMUHNO", ImmunizationCodeTextBox.Text);
                        immudcomobj.Parameters.AddWithValue("@IMMDVACCODE", row["Vaccine Code"].ToString());
                        immudcomobj.Parameters.AddWithValue("@IMMDSHOTNUM", row["Shot Number"].ToString());
                        immudcomobj.Parameters.AddWithValue("@IMMDREACTION", row["Reaction"].ToString());
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