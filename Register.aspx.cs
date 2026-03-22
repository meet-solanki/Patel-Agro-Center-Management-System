using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Register : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) return;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand chk = new SqlCommand(
                "SELECT COUNT(*) FROM Users WHERE Username=@u", con);
            chk.Parameters.AddWithValue("@u", txtUser.Text.Trim());

            con.Open();
            int count = Convert.ToInt32(chk.ExecuteScalar());

            if (count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(),
                    "msg", "alert('Username already exists');", true);
                return;
            }

            SqlCommand cmd = new SqlCommand(
                "INSERT INTO Users (Username,Password,Email) VALUES (@u,@p,@e)", con);

            cmd.Parameters.AddWithValue("@u", txtUser.Text.Trim());
            cmd.Parameters.AddWithValue("@p", txtPass.Text.Trim());
            cmd.Parameters.AddWithValue("@e", txtEmail.Text.Trim());

            cmd.ExecuteNonQuery();
        }

        ClientScript.RegisterStartupScript(this.GetType(),
            "ok", "alert('Registration Successful');window.location='Login.aspx';", true);
    }
}