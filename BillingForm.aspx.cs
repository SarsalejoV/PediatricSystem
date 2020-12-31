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
    public partial class BillingForm : System.Web.UI.Page
    {
        DataTable table = new DataTable();
        string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        //Boolean flag = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["GridDataSet"] = new DataSet();
                DataTable table = new DataTable("GridTable");
                table.Columns.Add(new DataColumn("Count"));
                table.Columns.Add(new DataColumn("Description"));
                table.Columns.Add(new DataColumn("Amount"));


                ((DataSet)ViewState["GridDataSet"]).Tables.Add(table);
                GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
                if (GridView1.DataSource == null)
                {
                    GridView1.DataSource = new string[] { };
                }
                GridView1.DataBind();
            }

            immunizationlabel.Visible = false;

        }
        private void BindGrid()
        {

            GridView1.DataSource = table;
            GridView1.DataBind();
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


        protected void txt_Item_Number_KeyDown(object sender, EventArgs e) { 
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
        }

        protected void PatientCodeTextBox_TextChanged(object sender, EventArgs e)
        {
            if (BillingNoTextBox.Text == " ")
            {
                PatientCodeTextBox.Enabled = false;
                patientlabel1.Visible = true;
            }

            SqlConnection con = new SqlConnection(connection);
            string sql = "Select * from PATIENTFILE";
            SqlCommand Comm1 = new SqlCommand(sql, con);
            con.Open();
            SqlDataReader reader = Comm1.ExecuteReader();
            bool found = false;
            while (reader.Read())
            {
                if (PatientCodeTextBox.Text == (reader["PATCODE"].ToString()))
                {
                    PatientCodeTextBox.Text = (reader["PATCODE"].ToString());
                    PatientNameTextBox.Text = (reader["PATNAME"].ToString());
                    PatientAgeTextBox.Text = (reader["PATAGE"].ToString());
                    found = true;
                }
            }
            if (found == true)
            {
                PatientCodeTextBox.Enabled = false;
                patientlabel.Visible = false;
            }
            else
            {
                PatientCodeTextBox.Text = "";
                Label3.Visible = true;
                patientlabel.Visible = true;
            }
            reader.Close();
        }

        protected void ConsultationDatagridView_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void BillingNoTextBox_TextChanged(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection(connection);
            SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * from BILLINGHEADERFILE";
            SqlCommand Comm1 = new SqlCommand(sql1, con1);

            string sql2 = "Select * from BILLINGDETAILFILE";
            SqlCommand Comm2 = new SqlCommand(sql2, con2);

            con1.Open();
            con2.Open();
            SqlDataReader reader1 = Comm1.ExecuteReader();
            SqlDataReader reader2 = Comm2.ExecuteReader();
            bool found = false;

            while (reader1.Read())
            {

                if (reader1["BILLHNO"].ToString() == BillingNoTextBox.Text/* || reader2["BILLDNO"].ToString() == BillingNoTextBox.Text*/)
                {
                    found = true;
                    BillingNoTextBox.Text = "";
                    PatientCodeTextBox.Enabled = false;
                    billinglabel.Visible = true;
                    break;

                }

            }

            while (/*reader1.Read() && */reader2.Read())
            {

                if (reader2["BILLDNO"].ToString() == BillingNoTextBox.Text)
                {
                    found = true;
                    BillingNoTextBox.Text = "";
                    PatientCodeTextBox.Enabled = false;
                    billinglabel.Visible = true;
                    break;
                }
            }

            reader1.Close();
            reader2.Close();
            con1.Close();
            con2.Close();

            if (found == false)
            {
                BillingNoTextBox.Enabled = false;
                PatientCodeTextBox.Enabled = true;
                billinglabel.Visible = false;
                PatientCodeTextBox.Focus();
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

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            //ConsultationDatagridView.DataSource = null;
            BillingNoTextBox.Text = "";
            DateTextBox.Text = "";
            PatientCodeTextBox.Text = "";
            PatientNameTextBox.Text = "";
            PatientAgeTextBox.Text = "";
            ConsultationCheckBox.Checked = false;
            ImmunizationCheckBox.Checked = false;
            ImmunizationNoTextBox.Text = "";
            PreparedByTextBox.Text = "";
            PreparedByLabel.Text = "";
            ExaminedByTextBox.Text = "";
            ExaminedByLabel.Text = "";
            BillingNoTextBox.Enabled = true;
            PreparedByTextBox.Enabled = true;
            ExaminedByTextBox.Enabled = true;
            preparedlabel.Visible = false;
            examinedlabel.Visible = false;
            ViewState["GridDataSet"] = new DataSet();
            DataTable table = new DataTable("GridTable");
            table.Columns.Add(new DataColumn("Count"));
            table.Columns.Add(new DataColumn("Description"));
            table.Columns.Add(new DataColumn("Amount"));


            ((DataSet)ViewState["GridDataSet"]).Tables.Add(table);
            GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
            if (GridView1.DataSource == null)
            {
                GridView1.DataSource = new string[] { };
            }
            GridView1.DataBind();
            //foreach (GridViewRow row in GridView1.Rows)
            //{
            //    row.Cells.Clear();
            //}
        }
        protected void ExitButton_Click(object sender, EventArgs e)
        {
            System.Environment.Exit(1);
        }

        protected void ImmunizationNoTextBox_TextChanged(object sender, EventArgs e)
        {
            immunizationlabel.Visible = false;
            immunizationlabel1.Visible = false;
            
            SqlConnection con1 = new SqlConnection(connection);
            SqlConnection con2 = new SqlConnection(connection);

            string sql1 = "Select * FROM IMMUNIZATIONDETAILFILE, VACCINEFILE WHERE IMMDIMMUHNO LIKE '" + ImmunizationNoTextBox.Text + "%'";
            string sql2 = "Select * FROM IMMUNIZATIONDETAILFILE";

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

            //foreach (DataRow row in ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows)

            foreach (GridViewRow row in GridView1.Rows)
            {
                if (ImmunizationNoTextBox.Text == row.Cells[1].Text)
                {
                    immunizationlabel1.Visible = true;
                    ImmunizationNoTextBox.Text = "";
                    ImmunizationNoTextBox.Focus();
                    immunizationlabel.Visible = false;
                }
            }

            if(dataReader.HasRows)
            {
                immunizationlabel.Visible = false;
                while (dataReader.Read())
                {
                    //dataReader.Read();
                    if (dataReader["IMMDIMMUHNO"].ToString() != ImmunizationNoTextBox.Text)
                    {
                        //ImmunizationNoTextBox.Text = "";
                        //immunizationlabel.Visible = true;


                    }
                    else
                    {
                        DataRow row = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].NewRow();
                        row["Count"] = dataReader["IMMDSHOTNUM"].ToString();
                        row["Description"] = ImmunizationNoTextBox.Text;
                        row["Amount"] = dataReader["VACPRICE"].ToString();
                        //row["Description"] = dataReader["MEDDESC"].ToString();
                        //row["Quantity"] = QuantityTextBox.Text;
                        //row["Description"] = "2";
                        //row["Amount"] = "434";

                        ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows.Add(row);
                        GridView1.DataSource = ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"];
                        GridView1.DataBind();
                        ImmunizationNoTextBox.Text = "";
                    }
                }

            }
            else
            {
                immunizationlabel.Visible = true;
                ImmunizationNoTextBox.Text = "";
            }

            

            con1.Close();
            con2.Close();
            dataReader.Close();
            dataReader2.Close();
        }

        protected void save_Click(object sender, EventArgs e)
        {


            if (string.IsNullOrEmpty(BillingNoTextBox.Text) || string.IsNullOrEmpty(PatientCodeTextBox.Text) || string.IsNullOrEmpty(DateTextBox.Text) ||
                    string.IsNullOrEmpty(PreparedByLabel.Text) || string.IsNullOrEmpty(ExaminedByLabel.Text) || GridView1.Rows.Count == 0)
                {
                    Response.Write("<script>alert('Cannot save the data, there are missing fields.')</script>");
                }
                else
                {
                    try
                    {
                    //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Record Inserted Successfully')", true);
                   
                    //SqlConnection con = new SqlConnection(connection);
                    //string sql = "Select * from BILLINGHEADERFILE";
                    ////SqlCommand Comm1 = new SqlCommand(sql, con);
                    //con.Open();
                    ////SqlDataReader reader = Comm1.ExecuteReader();

                    //SqlDataAdapter adapter = new SqlDataAdapter(sql, con);
                    //SqlCommandBuilder builder = new SqlCommandBuilder(adapter);
                    //DataSet thisDataSet = new DataSet();
                    ////adapter.MissingSchemaAction = MissingSchemaAction.AddWithKey;
                    //adapter.Fill(thisDataSet, "BILLINGHEADERFILE");

                    //DataRow headerRow = thisDataSet.Tables["BILLINGHEADERFILE"].NewRow();

                    //headerRow["BILLHNO"] = BillingNoTextBox.Text;
                    //headerRow["BILLHPATCODE"] = PatientCodeTextBox.Text;
                    //headerRow["BILLHDATE"] = "10/10/2020";
                    //headerRow["BILLHPREPBY"] = PreparedByLabel.Text;
                    //headerRow["BILLHSTAT"] = "Active";
                    //headerRow["BILLHTOTAMT"] = 300;



                    SqlConnection con = new SqlConnection(connection);
                    con.Open();
                    int amount = 0;
                    foreach (DataRow row in ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows)
                    {
                        amount += Convert.ToInt32(row["Amount"]);
                    }

                    string immuhcomstring = "INSERT INTO BILLINGHEADERFILE VALUES (@BILLHNO,@BILLHPATCODE,@BILLHDATE,@BILLHTOTAMT,@BILLHPREPBY,'Active')";
                    SqlCommand immuhcomobj = new SqlCommand(immuhcomstring, con);
                    immuhcomobj.Parameters.AddWithValue("@BILLHNO", BillingNoTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@BILLHPATCODE", PatientCodeTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@BILLHDATE", DateTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@BILLHTOTAMT", amount.ToString());
                    immuhcomobj.Parameters.AddWithValue("@BILLHPREPBY", PreparedByLabel.Text);

                    immuhcomobj.ExecuteNonQuery();


                    foreach (DataRow row in ((DataSet)ViewState["GridDataSet"]).Tables["GridTable"].Rows)
                    {
                        string immudcomstring = "INSERT INTO BILLINGDETAILFILE VALUES (@BILLDNO,@BILLDCOUNT,@BILLDDESC,@BILLDAMOUNT,'Active')";
                        SqlCommand immudcomobj = new SqlCommand(immudcomstring, con);
                        immudcomobj.Parameters.AddWithValue("@BILLDNO", BillingNoTextBox.Text);
                        immudcomobj.Parameters.AddWithValue("@BILLDCOUNT", row["Count"].ToString());
                        immudcomobj.Parameters.AddWithValue("@BILLDDESC", row["Description"].ToString());
                        immudcomobj.Parameters.AddWithValue("@BILLDAMOUNT", row["Amount"].ToString());
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
            //}
        }

        protected void RegistrationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientRegistrationForm.aspx");
        }

        protected void ConsultationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultationEntry.aspx");
        }

        protected void ImmunizationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ImmunizationEntry.aspx");
        }

        protected void PrescriptionLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("PrescriptionForm.aspx");
        }
    }
}