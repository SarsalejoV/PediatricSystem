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
    public partial class WebForm1 : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void ImmunizationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ImmunizationEntry.aspx");
        }

        protected void ConsultationLinkButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("ConsultationEntry.aspx");
        }

        protected void PatientCodeTextBox_TextChanged(object sender, EventArgs e)
        {
            Label1.Visible = false;
          
            SqlConnection con1 = new SqlConnection(connection);
            string sql = "Select * from PATIENTFILE";
            SqlCommand Comm1 = new SqlCommand(sql, con1);
            con1.Open();
            SqlDataReader reader1 = Comm1.ExecuteReader();
            bool found = false;


            while (reader1.Read())
            {

                if (PatientCodeTextBox.Text == (reader1["PATCODE"].ToString())/* || reader2["BILLDNO"].ToString() == BillingNoTextBox.Text*/)
                {
                    found = true;
                    PatientCodeTextBox.Text = "";
                    PatientCodeTextBox.Focus();
                    Label1.Visible = true;

                }


            }


            

            if (found == false)
            {
                PatientNameTextBox.Focus();
                PatientCodeTextBox.Enabled = false;
                Label1.Visible = false;
            }

            reader1.Close();
            con1.Close();
        }

        protected void ClearButton_Click(object sender, EventArgs e)
        {
            PatientCodeTextBox.Text = "";
            PatientNameTextBox.Text = "";
            AgeTextBox.Text = "";
            AddressTextBox.Text = "";
            TelephoneTextBox.Text = "";
            FathersNameTextBox.Text = "";
            MothersNameTextBox.Text = "";
            GenderDropDownList.Text = "";
            BirthdayTextBox.Text = "";
            WeightTextBox.Text = "";
            HeightTextBox.Text = "";
            EncodedByTextBox.Text = "";
            Label1.Visible = false;
            PatientCodeTextBox.Enabled = true;
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(PatientCodeTextBox.Text) || string.IsNullOrEmpty(PatientNameTextBox.Text) || string.IsNullOrEmpty(AddressTextBox.Text) ||
                    string.IsNullOrEmpty(TelephoneTextBox.Text) || string.IsNullOrEmpty(FathersNameTextBox.Text) || string.IsNullOrEmpty(MothersNameTextBox.Text)
                     || string.IsNullOrEmpty(GenderDropDownList.Text) || string.IsNullOrEmpty(BirthdayTextBox.Text) || string.IsNullOrEmpty(AgeTextBox.Text)
                      || string.IsNullOrEmpty(WeightTextBox.Text) || string.IsNullOrEmpty(HeightTextBox.Text) || string.IsNullOrEmpty(EncodedByTextBox.Text))
            {
                Response.Write("<script>alert('Cannot save the data, there are missing fields.')</script>");
            }
            else
            {
                try
                {
               
                    SqlConnection con = new SqlConnection(connection);
                    con.Open();

                    string immuhcomstring = "INSERT INTO PATIENTFILE VALUES (@PATCODE,@PATNAME,@PATAGE,@PATGENDER,@PATBDATE,@PATADDR,@PATTEL,@PATFATHNAME,@PATMOTHNAME,@PATHEIGHT,@PATWEIGHT,'Active',@PATENCODEDBY)";
                    SqlCommand immuhcomobj = new SqlCommand(immuhcomstring, con);
                    immuhcomobj.Parameters.AddWithValue("@PATCODE", PatientCodeTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATNAME", PatientNameTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATAGE", AgeTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATGENDER", GenderDropDownList.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATBDATE", BirthdayTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATADDR", AddressTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATTEL", TelephoneTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATFATHNAME", FathersNameTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATMOTHNAME", MothersNameTextBox.ToString());
                    immuhcomobj.Parameters.AddWithValue("@PATHEIGHT", HeightTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATWEIGHT", WeightTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@PATENCODEDBY", EncodedByTextBox.Text);

                    immuhcomobj.ExecuteNonQuery();

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
    }
}