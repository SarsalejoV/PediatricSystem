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
    public partial class Registration : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            EmpIDlabel.Visible = false;
            EmpUserLabel.Visible = false;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            EmpIDlabel.Visible = false;

            SqlConnection con1 = new SqlConnection(connection);

            string sql1 = "SELECT EMPID FROM ADMINTABLE";
            SqlCommand cmd1 = new SqlCommand(sql1, con1);
            con1.Open();
            SqlDataReader reader1 = cmd1.ExecuteReader();
            bool found = false;

            while (reader1.Read())
            {

                if (EmployeeIDTextBox.Text == (reader1["EMPID"].ToString())/* || reader2["BILLDNO"].ToString() == BillingNoTextBox.Text*/)
                {
                    found = true;
                    EmployeeIDTextBox.Text = "";
                    EmployeeIDTextBox.Focus();
                    EmpIDlabel.Visible = true;

                }


            }




            if (found == false)
            {
                UsernameTextBox.Focus();
                EmployeeIDTextBox.Enabled = false;
                EmpIDlabel.Visible = false;
                UsernameTextBox.Enabled = true;
            }

            reader1.Close();
            con1.Close();
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Login.aspx");
        }

        protected void RegisterButton_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(EmployeeIDTextBox.Text) || string.IsNullOrEmpty(EmployeeIDTextBox.Text) || string.IsNullOrEmpty(PasswordTextBox.Text))
            {
                Response.Write("<script>alert('Cannot save the data, there are missing fields.')</script>");
            }
            else
            {
                try
                {

                    SqlConnection con = new SqlConnection(connection);
                    con.Open();

                    string immuhcomstring = "INSERT INTO ADMINTABLE VALUES (@EMPID,@EMPUSERNAME,@EMPPASSWORD,'defname','09123456789')";
                    SqlCommand immuhcomobj = new SqlCommand(immuhcomstring, con);
                    immuhcomobj.Parameters.AddWithValue("@EMPID", EmployeeIDTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@EMPUSERNAME", UsernameTextBox.Text);
                    immuhcomobj.Parameters.AddWithValue("@EMPPASSWORD", PasswordTextBox.Text);

                    immuhcomobj.ExecuteNonQuery();

                    Response.Write("<script>alert('Succesfully Saved')</script>");
                    con.Close();

                    EmployeeIDTextBox.Text = "";
                    UsernameTextBox.Text = "";
                    PasswordTextBox.Text = "";
                }
                catch (Exception error)
                {
                    Response.Write(error.Message);
                }
            }
        }

        protected void UsernameTextBox_TextChanged(object sender, EventArgs e)
        {
            EmpUserLabel.Visible = false;

            SqlConnection con1 = new SqlConnection(connection);

            string sql1 = "SELECT EMPUSERNAME FROM ADMINTABLE";
            SqlCommand cmd1 = new SqlCommand(sql1, con1);
            con1.Open();
            SqlDataReader reader1 = cmd1.ExecuteReader();
            bool found = false;

            while (reader1.Read())
            {

                if (UsernameTextBox.Text == (reader1["EMPUSERNAME"].ToString())/* || reader2["BILLDNO"].ToString() == BillingNoTextBox.Text*/)
                {
                    found = true;
                    UsernameTextBox.Text = "";
                    UsernameTextBox.Focus();
                    EmpUserLabel.Visible = true;

                }


            }




            if (found == false)
            {
                PasswordTextBox.Focus();
                UsernameTextBox.Enabled = false;
                EmpUserLabel.Visible = false;
                PasswordTextBox.Enabled = true;
            }

            reader1.Close();
            con1.Close();
        }
    }
}