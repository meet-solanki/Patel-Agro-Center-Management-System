using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

public partial class Dashboard : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblCustomers.Text = GetCount("CustomerTable");
            lblProducts.Text = GetCount("ProductTable");
            lblSales.Text = GetCount("SalesTable");
        }
    }

    private string GetCount(string tableName)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM " + tableName, con);
            con.Open();
            return cmd.ExecuteScalar().ToString();
        }
    }
}