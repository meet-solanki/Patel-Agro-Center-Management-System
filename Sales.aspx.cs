using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class Sales : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadCustomers();
            LoadProducts();
        }
    }

    void LoadCustomers()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT CustomerID, CustomerName FROM CustomerTable", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlCustomer.DataSource = dt;
            ddlCustomer.DataTextField = "CustomerName";
            ddlCustomer.DataValueField = "CustomerID";
            ddlCustomer.DataBind();
        }
    }

    void LoadProducts()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter(
                "SELECT ProductID, ProductName FROM ProductTable", con);
            DataTable dt = new DataTable();
            da.Fill(dt);

            ddlProduct.DataSource = dt;
            ddlProduct.DataTextField = "ProductName";
            ddlProduct.DataValueField = "ProductID";
            ddlProduct.DataBind();
        }
    }

    // 🔹 AUTO PRICE
    protected void ddlProduct_SelectedIndexChanged(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "SELECT Price FROM ProductTable WHERE ProductID=@id", con);
            cmd.Parameters.AddWithValue("@id", ddlProduct.SelectedValue);

            con.Open();
            object price = cmd.ExecuteScalar();

            if (price != null)
            {
                txtPrice.Text = price.ToString();   // numeric only
                txtTotal.Text = "";
                txtQty.Text = "";
            }
        }
    }

    // 🔹 AUTO TOTAL
    protected void txtQty_TextChanged(object sender, EventArgs e)
    {
        int qty;
        decimal price;

        if (int.TryParse(txtQty.Text.Trim(), out qty) &&
            decimal.TryParse(txtPrice.Text.Trim(), out price))
        {
            txtTotal.Text = (qty * price).ToString("0.00");
        }
        else
        {
            txtTotal.Text = "";
        }
    }

    // 🔹 SAVE + BILL
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (txtQty.Text == "" || txtPrice.Text == "" || txtTotal.Text == "")
            return;

        int saleId;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
            @"INSERT INTO SalesTable
                  (CustomerID, ProductID, Quantity, Price, TotalAmount)
                  OUTPUT INSERTED.SaleID
                  VALUES (@c,@p,@q,@pr,@t)", con);

            cmd.Parameters.Add("@c", SqlDbType.Int).Value = Convert.ToInt32(ddlCustomer.SelectedValue);
            cmd.Parameters.Add("@p", SqlDbType.Int).Value = Convert.ToInt32(ddlProduct.SelectedValue);
            cmd.Parameters.Add("@q", SqlDbType.Int).Value = Convert.ToInt32(txtQty.Text);
            cmd.Parameters.Add("@pr", SqlDbType.Decimal).Value = Convert.ToDecimal(txtPrice.Text);
            cmd.Parameters.Add("@t", SqlDbType.Decimal).Value = Convert.ToDecimal(txtTotal.Text);

            con.Open();
            saleId = (int)cmd.ExecuteScalar();
        }

        // 👉 Redirect to bill page
        Response.Redirect("Bill.aspx?sid=" + saleId);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}