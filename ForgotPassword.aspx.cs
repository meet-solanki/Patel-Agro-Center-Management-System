using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {
            string query = "UPDATE Users SET Password=@p WHERE Username=@u AND Email=@e";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@u", txtUser.Text);
            cmd.Parameters.AddWithValue("@e", txtEmail.Text);
            cmd.Parameters.AddWithValue("@p", txtNewPass.Text);

            con.Open();
            int rows = cmd.ExecuteNonQuery();

            if (rows > 0)
            {
                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Password updated successfully!";
            }
            else
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Invalid Username or Email";
            }
        }
    }
}