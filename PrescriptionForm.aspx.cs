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
    public partial class PrescriptionForm : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    BindGrid();
            //}
            if (!IsPostBack)
            {
                ViewState["GridDataSet"] = new DataSet();
                DataTable table = new DataTable("GridTable");
                table.Columns.Add(new DataColumn("Med Code"));
                table.Columns.Add(new DataColumn("Name"));
                table.Columns.Add(new DataColumn("Dose"));
                table.Columns.Add(new DataColumn("Description"));
                table.Columns.Add(new DataColumn("Quantity"));
                table.Columns.Add(new DataColumn("Remarks"));

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


        protected void PrescriptionNoTextBox_TextChanged(object sender, EventArgs e)
        {
          
            SqlConnection con1 = new SqlConnection(connection);
            SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * from PRESCRIPTIONHEADERFILE";
            SqlCommand Comm1 = new SqlCommand(sql1, con1);

            string sql2 = "Select * from PRESCRIPTIONDETAILFILE";
            SqlCommand Comm2 = new SqlCommand(sql2, con2);

            con1.Open();
            con2.Open();
            SqlDataReader reader1 = Comm1.ExecuteReader();
            SqlDataReader reader2 = Comm2.ExecuteReader();
            bool found = false;

            while (reader1.Read())
            {

                if (reader1["PRESHCODE"].ToString() == PrescriptionNoTextBox.Text/* || reader2["BILLDNO"].ToString() == BillingNoTextBox.Text*/)
                {
                    found = true;
                    PrescriptionNoTextBox.Text = "";
                    PatientCodeTextBox.Enabled = false;
                    prescriptionlabel.Visible = true;
                    break;

                }

            }

            while (/*reader1.Read() && */reader2.Read())
            {

                if (reader2["PREDCODE"].ToString() == PrescriptionNoTextBox.Text)
                {
                    found = true;
                    PrescriptionNoTextBox.Text = "";
                    PatientCodeTextBox.Enabled = false;
                    prescriptionlabel.Visible = true;
                    break;
                }
            }

            reader1.Close();
            reader2.Close();
            con1.Close();
            con2.Close();

            if (found == false)
            {
                PrescriptionNoTextBox.Enabled = false;
                prescriptionlabel.Visible = false;
                ConsultationNoTextBox.Enabled = true;
                ConsultationNoTextBox.Focus();

            }

        }
        protected void PatientCodeTextBox_TextChanged(object sender, EventArgs e)
        {
            Label3.Visible = false;
         
            SqlConnection con = new SqlConnection(connection);
            string sql = "Select * from PATIENTFILE";
            SqlCommand Comm1 = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader read = Comm1.ExecuteReader();
            bool found = false;
            while (read.Read())
            {
                if (PatientCodeTextBox.Text == (read["PATCODE"].ToString()))
                {
                    PatientCodeTextBox.Text = (read["PATCODE"].ToString());
                    PatientNameTextBox.Text = (read["PATNAME"].ToString());
                    AgeTextBox.Text = (read["PATAGE"].ToString());
                    PatientCodeTextBox.Enabled = false;
                    found = true;
                }
            }
            if (found != true)
            {
                PatientCodeTextBox.Text = "";
                Label3.Visible = true;
            }

            read.Close();
        }

        protected void ExitButton_Click(object sender, EventArgs e)
        {

            System.Environment.Exit(1);
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            PrescriptionNoTextBox.Text = "";
            ConsultationNoTextBox.Text = "";
            DateTextBox.Text = "";
            PatientCodeTextBox.Text = "";
            PatientNameTextBox.Text = "";
            AgeTextBox.Text = "";
            MedicineCodeTextBox.Text = "";
            QuantityTextBox.Text = "";
            RemarksTextBox.Text = "";
            PrescriptionNoTextBox.Enabled = true;
            ConsultationNoTextBox.Enabled = true;
            PatientCodeTextBox.Enabled = true;
            prescriptionlabel.Visible = false;
            consultationlabel.Visible = false;
            medicinecodelabel.Visible = false;
            Label3.Visible = false;
            PreparedByTextBox.Text = "";
            PreparedByLabel.Text = "";
            PreparedByTextBox.Enabled = true;
            preparedlabel.Visible = false;
            medicinecodelabel1.Visible = false;
            ConsultationNoTextBox.Enabled = true;
            MedicineCodeTextBox.Enabled = true;
            QuantityTextBox.Enabled = false;
            ConsultationNoTextBox.Enabled = false;
            PatientCodeTextBox.Enabled = false;

            ViewState["GridDataSet"] = new DataSet();
            DataTable table = new DataTable("GridTable");
            table.Columns.Add(new DataColumn("Med Code"));
            table.Columns.Add(new DataColumn("Name"));
            table.Columns.Add(new DataColumn("Dose"));
            table.Columns.Add(new DataColumn("Description"));
            table.Columns.Add(new DataColumn("Quantity"));
            table.Columns.Add(new DataColumn("Remarks"));

            ((DataSet)ViewState["GridDataSet"]).Tables.Add(table);
            GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
            if (GridView1.DataSource == null)
            {
                GridView1.DataSource = new string[] { };
            }
            GridView1.DataBind();
        }
        protected void ConsultationNoTextBox_TextChanged(object sender, EventArgs e)
        {
            consultationlabel.Visible = false;
          
            SqlConnection con1 = new SqlConnection(connection);
            //SqlConnection con3 = new SqlConnection(connection);

            string sql1 = "Select * FROM CONSULTATIONHEADERFILE";
            //string sql3 = "Select * FROM PRESCRIPTIONHEADERFILE WHERE PRESHCONSNO LIKE '" + ConsultationNoTextBox.Text + "%'";

            //SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            SqlCommand Comm1 = new SqlCommand(sql1, con1);
            //SqlCommand Comm3 = new SqlCommand(sql3, con3);
            con1.Open();
            //con3.Open();
            //con2.Open();
            SqlDataReader dataReader = Comm1.ExecuteReader();
            //SqlDataReader dataReader3 = Comm3.ExecuteReader();
            bool found = false;
            if (ConsultationNoTextBox.Text == "")
            {
                consultationlabel.Visible = false;
            }
            else
            {
                while (dataReader.Read())
                {
                    if (ConsultationNoTextBox.Text == (dataReader["CONHNO"].ToString()))
                    {
                        DateTextBox.Text = Convert.ToDateTime(dataReader["CONHDATE"]).ToString("dd/MM/yyyy");
                        //DateTextBox.Text = dataReader["CONHDATE"].ToString();
                        PatientCodeTextBox.Text = dataReader["CONHPATCODE"].ToString();
                        string patcode = dataReader["CONHPATCODE"].ToString();

                        SqlConnection con2 = new SqlConnection(connection);
                        string sql2 = "Select * FROM PATIENTFILE WHERE PATCODE LIKE '" + patcode.ToString() + "%'";
                        SqlCommand Comm2 = new SqlCommand(sql2, con2);
                        con2.Open();
                        SqlDataReader dataReader2 = Comm2.ExecuteReader();
                        dataReader2.Read();



                        //SqlConnection con3 = new SqlConnection(connection);
                        //string sql3 = "Select * FROM PRESCRIPTIONHEADERFILE WHERE PRESHCONSNO LIKE '" + ConsultationNoTextBox.Text + "%'";
                        //SqlCommand Comm3 = new SqlCommand(sql3, con3);
                        //con3.Open();
                        //SqlDataReader dataReader3 = Comm3.ExecuteReader();
                        //dataReader3.Read();

                        PatientNameTextBox.Text = dataReader2["PATNAME"].ToString();
                        AgeTextBox.Text = dataReader2["PATAGE"].ToString();
                        //DateTextBox.Text = dataReader3["PRESHDATE"].ToString();
                        //DateTextBox.Text = dataReader["CONHDATE"].ToString();
                        PatientCodeTextBox.Enabled = false;
                        consultationlabel.Visible = false;
                        found = true;
                        ConsultationNoTextBox.Enabled = false;
                    }
                    else
                    {
                        ConsultationNoTextBox.Enabled = false;
                        consultationlabel.Visible = true;
                        PatientCodeTextBox.Enabled = true;
                        DateTextBox.Enabled = true;
                    }
                }


                //if (found == true)
                //{
                //    consultationlabel.Visible = false;
                //    ConsultationNoTextBox.Enabled = false;
                //}
                //else
                //{
                //    consultationlabel.Visible = true;
                //    ConsultationNoTextBox.Text = "";
                //}
            }
            dataReader.Close();
            con1.Close();
        }


        protected void RemarksTextBox_TextChanged(object sender, EventArgs e)
        {
          
            SqlConnection con = new SqlConnection(connection);

            string sql = "Select * FROM MEDICINEFILE WHERE MEDCODE LIKE '" + MedicineCodeTextBox.Text + "%'";
            //SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            SqlCommand Comm1 = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader dataReader = Comm1.ExecuteReader();
            bool found = false;

            //GridView1.Columns[5].FooterText = RemarksTextBox.Text;
            //adapter.Fill(table);
            //BindGrid();
            dataReader.Read();

            //GridView1.Columns[5].FooterText = RemarksTextBox.Text;
            //GridView1.Columns[0].FooterText = MedicineCodeTextBox.Text;
            //GridView1.Columns[1].FooterText = dataReader["MEDNAME"].ToString();
            DataRow row = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].NewRow();
            row["Med Code"] = dataReader["MEDCODE"].ToString();
            row["Name"] = dataReader["MEDNAME"].ToString();
            row["Dose"] = dataReader["MEDDOSE"].ToString();
            row["Description"] = dataReader["MEDDESC"].ToString();
            row["Quantity"] = QuantityTextBox.Text;
            row["Remarks"] = RemarksTextBox.Text;

            ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows.Add(row);
            GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
            GridView1.DataBind();

            MedicineCodeTextBox.Text =  "";
            MedicineCodeTextBox.Enabled = true;
            QuantityTextBox.Text = "";
            RemarksTextBox.Text = "";
            RemarksTextBox.Enabled = false;
            MedicineCodeTextBox.Focus();
        }

        protected void MedicineCodeTextBox_TextChanged(object sender, EventArgs e)
        {
         
            SqlConnection con = new SqlConnection(connection);

            string sql = "Select * FROM MEDICINEFILE";
            SqlCommand Comm1 = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = Comm1.ExecuteReader();
            bool found = false;

            while (reader.Read())
            {
                if (MedicineCodeTextBox.Text == (reader["MEDCODE"].ToString()))
                {
                    MedicineCodeTextBox.Enabled = false;
                    medicinecodelabel.Visible = false;
                    QuantityTextBox.Enabled = true;
                    QuantityTextBox.Focus();
                    medicinecodelabel1.Visible = false;
                    found = true;
                }
            }
            if (found == false)
            {
                MedicineCodeTextBox.Text = "";
                MedicineCodeTextBox.Focus();
                QuantityTextBox.Enabled = false;
                medicinecodelabel.Visible = true;
                medicinecodelabel1.Visible = false;
            }

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (MedicineCodeTextBox.Text == row.Cells[0].Text)
                {
                    medicinecodelabel1.Visible = true;
                    MedicineCodeTextBox.Text = "";
                    MedicineCodeTextBox.Enabled = true;
                    QuantityTextBox.Enabled = false;
                    MedicineCodeTextBox.Focus();
                }
            }
        }
        protected void QuantityTextBox_TextChanged(object sender, EventArgs e)
        {
            //string connection = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Sarsalejo\source\repos\ELDNET\ELDNET\App_Data\Database1.mdf;Integrated Security=True;Connect Timeout=30";
            //SqlConnection con = new SqlConnection(connection);

            //string sql = "Select * from MEDICINEFILE";

            //SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
            //con.Open();

            //GridView1.Columns[4].FooterText = QuantityTextBox.Text;
            //adapter.Fill(table);
            //BindGrid(); 
            if (MedicineCodeTextBox.Text == "")
            {
                QuantityTextBox.Enabled = false;
            }

                if (QuantityTextBox.Text != null)
            {
                RemarksTextBox.Enabled = true;
                QuantityTextBox.Enabled = false;
                RemarksTextBox.Focus();
            }
        }

        protected void SaveButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ConsultationNoTextBox.Text) || string.IsNullOrEmpty(PatientCodeTextBox.Text) || string.IsNullOrEmpty(DateTextBox.Text) ||
                    string.IsNullOrEmpty(PrescriptionNoTextBox.Text) || string.IsNullOrEmpty(AgeTextBox.Text) || string.IsNullOrEmpty(PatientNameTextBox.Text) ||
                    string.IsNullOrEmpty(PreparedByLabel.Text) || GridView1.Rows.Count == 0)
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

                    string immuhcomstring = "INSERT INTO PRESCRIPTIONHEADERFILE VALUES (@PRESHCODE,@PRESHCONSNO,@PRESHPATCODE,@PRESHDATE,@PRESHPREPBY,'Active')";
                    SqlCommand immuhcomobj = new SqlCommand(immuhcomstring, con);
                    immuhcomobj.Parameters.AddWithValue("@PRESHCODE", PrescriptionNoTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PRESHCONSNO", ConsultationNoTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PRESHPATCODE", PatientCodeTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PRESHDATE", DateTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PRESHPREPBY", PreparedByTextBox.Text);

                    immuhcomobj.ExecuteNonQuery();


                    foreach (DataRow row in ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows)
                    {
                        string immudcomstring = "INSERT INTO PRESCRIPTIONDETAILFILE VALUES (@PREDCODE,@PREDMEDCODE,@PREDQTY,@PREDREMARKS,'Active')";
                        SqlCommand immudcomobj = new SqlCommand(immudcomstring, con);
                        immudcomobj.Parameters.AddWithValue("@PREDCODE", PrescriptionNoTextBox.Text);
                        immudcomobj.Parameters.AddWithValue("@PREDMEDCODE", row["Med Code"].ToString());
                        immudcomobj.Parameters.AddWithValue("@PREDQTY", Convert.ToInt32(row["Quantity"].ToString()));
                        immudcomobj.Parameters.AddWithValue("@PREDREMARKS", row["Remarks"].ToString());
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

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {

        }

        protected void DateTextBox_TextChanged(object sender, EventArgs e)
        {
            if(DateTextBox.Text != null)
            {
                DateTextBox.Enabled = false;
                PatientCodeTextBox.Focus();
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

        protected void PatientNameTextBox_TextChanged(object sender, EventArgs e)
        {
            Response.Redirect("BillingForm.aspx");
        }

        protected void ConsultationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultationEntry.aspx");
        }

        protected void RegistrationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientRegistrationForm.aspx");
        }
    }
}