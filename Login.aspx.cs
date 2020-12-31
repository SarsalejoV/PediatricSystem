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
    public partial class Login : System.Web.UI.Page
    {
        string connection = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
          
            SqlConnection con = new SqlConnection(connection);
            con.Open();
            string sql = "Select * from ADMINTABLE where EMPUSERNAME = '" + UsernameTextBox.Text + "' and EMPPASSWORD = '" + PasswordTextBox.Text + "'";
            SqlCommand cmd = new SqlCommand(sql, con);

            SqlDataReader dr = cmd.ExecuteReader();

            bool found = false;
            string username = "";

            while (dr.Read())
            {
                username = dr["EMPUSERNAME"].ToString();
                found = true;
            }

            if (found == true)
            {
                Session["username"] = username;
                Response.Redirect("~/PatientRegistrationForm.aspx");
            }

            else
            {
                Response.Write("<script>alert('Invalid Login')</script>");
                //LoginStatusLabel.Text = "Invalid Login";
            }

        }

        protected void UsernameTextBox_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ExitButton_Click(object sender, EventArgs e)
        {
            System.Environment.Exit(1);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Registration.aspx");
        }

        protected void PasswordTextBox_TextChanged(object sender, EventArgs e)
        {

        }
    }
}