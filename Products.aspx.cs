    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using System.Data.SqlClient;
    using System.Data;
    using System.Configuration;

    public partial class Products : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
            if (!IsPostBack)
            BindProducts();
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        decimal price;
        int stock;

        if (txtProductName.Text == "" || ddlCategory.SelectedIndex == 0 ||
            !decimal.TryParse(txtPrice.Text, out price) ||
            !int.TryParse(txtStock.Text, out stock))
        {
            ShowAlert("Please enter valid product details");
            return;
        }

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO ProductTable VALUES (@n,@c,@p,@s)", con);

            cmd.Parameters.AddWithValue("@n", txtProductName.Text);
            cmd.Parameters.AddWithValue("@c", ddlCategory.SelectedValue);
            cmd.Parameters.AddWithValue("@p", price);
            cmd.Parameters.AddWithValue("@s", stock);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        lblMsg.ForeColor = System.Drawing.Color.Green;
        lblMsg.Text = "Product Added Successfully";

        Clear();
        BindProducts();
    }

    void BindProducts()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM ProductTable", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvProducts.DataSource = dt;
            gvProducts.DataBind();
        }
    }

    void Clear()
    {
        txtProductName.Text = "";
        ddlCategory.SelectedIndex = 0;
        txtPrice.Text = "";
        txtStock.Text = "";
    }

    protected void gvProducts_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        // Get selected row
        GridViewRow row = gvProducts.Rows[e.NewEditIndex];

        // Get ProductID
        ViewState["ProductID"] = gvProducts.DataKeys[e.NewEditIndex].Value.ToString();

        // Show data in TextBoxes
        txtProductName.Text = row.Cells[1].Text;
        ddlCategory.SelectedValue = row.Cells[2].Text;
        txtPrice.Text = row.Cells[3].Text;
        txtStock.Text = row.Cells[4].Text;

        // Change button text
        btnAdd.Text = "Update Product";

        lblMsg.Text = "Edit mode enabled";
        lblMsg.ForeColor = System.Drawing.Color.Green;

        // Stop GridView inline editing
        gvProducts.EditIndex = -1;
    }

    protected void gvProducts_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        gvProducts.EditIndex = -1;
        BindProducts();
    }

    protected void gvProducts_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

        string name = ((System.Web.UI.WebControls.TextBox)gvProducts.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        string category = ((System.Web.UI.WebControls.TextBox)gvProducts.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        decimal price = Convert.ToDecimal(((System.Web.UI.WebControls.TextBox)gvProducts.Rows[e.RowIndex].Cells[3].Controls[0]).Text);
        int stock = Convert.ToInt32(((System.Web.UI.WebControls.TextBox)gvProducts.Rows[e.RowIndex].Cells[4].Controls[0]).Text);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE ProductTable SET ProductName=@n, Category=@c, Price=@p, Stock=@s WHERE ProductID=@id", con);

            cmd.Parameters.AddWithValue("@n", name);
            cmd.Parameters.AddWithValue("@c", category);
            cmd.Parameters.AddWithValue("@p", price);
            cmd.Parameters.AddWithValue("@s", stock);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }

        gvProducts.EditIndex = -1;
        BindProducts();
    }

    protected void gvProducts_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM ProductTable WHERE ProductID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
        }

        BindProducts();
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }

    void ShowAlert(string msg)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "a",
            "alert('{msg}');", true);
    }
    }