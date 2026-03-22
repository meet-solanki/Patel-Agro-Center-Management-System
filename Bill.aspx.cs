using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

public partial class Bill : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int saleId = Convert.ToInt32(Request.QueryString["sid"]);
            LoadBill(saleId);
        }
    }

    void LoadBill(int saleId)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
            @"SELECT s.Quantity, s.Price, s.TotalAmount,
                     c.CustomerName, p.ProductName
              FROM SalesTable s
              JOIN CustomerTable c ON s.CustomerID = c.CustomerID
              JOIN ProductTable p ON s.ProductID = p.ProductID
              WHERE s.SaleID=@id", con);

            cmd.Parameters.AddWithValue("@id", saleId);
            con.Open();

            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                lblCustomer.Text = dr["CustomerName"].ToString();
                lblProduct.Text = dr["ProductName"].ToString();
                lblPrice.Text = dr["Price"].ToString();
                lblQty.Text = dr["Quantity"].ToString();
                lblTotal.Text = dr["TotalAmount"].ToString();
                lblDate.Text = DateTime.Now.ToString("dd/MM/yyyy");
            }
        }
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}