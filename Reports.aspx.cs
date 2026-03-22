using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Reports : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAll();
        }
    }

    void LoadAll()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT s.SaleID,c.CustomerName,p.ProductName,s.Quantity,s.Price,s.TotalAmount,s.SaleDate " +
                "FROM SalesTable s " +
                "JOIN CustomerTable c ON s.CustomerID=c.CustomerID " +
                "JOIN ProductTable p ON s.ProductID=p.ProductID", con);

            DataTable dt = new DataTable();
            da.Fill(dt);
            gvSales.DataSource = dt;
            gvSales.DataBind();
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT s.SaleID,c.CustomerName,p.ProductName,s.Quantity,s.Price,s.TotalAmount,s.SaleDate " +
                "FROM SalesTable s " +
                "JOIN CustomerTable c ON s.CustomerID=c.CustomerID " +
                "JOIN ProductTable p ON s.ProductID=p.ProductID " +
                "WHERE s.SaleDate BETWEEN @f AND @t", con);

            da.SelectCommand.Parameters.AddWithValue("@f", txtFrom.Text);
            da.SelectCommand.Parameters.AddWithValue("@t", txtTo.Text);

            DataTable dt = new DataTable();
            da.Fill(dt);
            gvSales.DataSource = dt;
            gvSales.DataBind();
        }
    }
    protected void btnAll_Click(object sender, EventArgs e)
    {
        LoadAll();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}