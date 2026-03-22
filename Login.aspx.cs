using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] != null)
        {
            Response.Redirect("Dashboard.aspx");
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

        if (txtUsername.Text.Trim() == "" || txtPassword.Text.Trim() == "")
        {
            alert("Username and Password are required");
            return;
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT COUNT(*) FROM Users WHERE Username=@u AND Password=@p", con);

            cmd.Parameters.AddWithValue("@u", txtUsername.Text);
            cmd.Parameters.AddWithValue("@p", txtPassword.Text);

            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());

            if (count == 1)
            {
                alert("Login Successful");
                Response.Redirect("Dashboard.aspx");
            }
            else
            {
                alert("Invalid Username or Password");
            }
        }
    }

    void alert(string msg)
    {
        ClientScript.RegisterStartupScript(
            this.GetType(),
            "alert",
            "alert('" + msg + "');",
            true);
    }
}