using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class Customers : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["AgroDB"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            BindCustomers();
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "INSERT INTO CustomerTable(CustomerName,MobileNo,Address) VALUES(@n,@m,@a)", con);

            cmd.Parameters.AddWithValue("@n", txtName.Text);
            cmd.Parameters.AddWithValue("@m", txtMobile.Text);
            cmd.Parameters.AddWithValue("@a", txtAddress.Text);

            con.Open();
            cmd.ExecuteNonQuery();
        }
        lblMsg.ForeColor = System.Drawing.Color.Green;
        lblMsg.Text = "Customer Added Successfully";

        Clear();
        BindCustomers();
    }

    void BindCustomers()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM CustomerTable", con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvCustomers.DataSource = dt;
            gvCustomers.DataBind();
        }
    }

    void Clear()
    {
        txtName.Text = "";
        txtMobile.Text = "";
        txtAddress.Text = "";
    }

    protected void gvCustomers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
    {
        gvCustomers.EditIndex = e.NewEditIndex;
        BindCustomers();
    }

    protected void gvCustomers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
    {
        gvCustomers.EditIndex = -1;
        BindCustomers();
    }

    protected void gvCustomers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvCustomers.DataKeys[e.RowIndex].Value);

        string name = ((System.Web.UI.WebControls.TextBox)gvCustomers.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
        string mobile = ((System.Web.UI.WebControls.TextBox)gvCustomers.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
        string address = ((System.Web.UI.WebControls.TextBox)gvCustomers.Rows[e.RowIndex].Cells[3].Controls[0]).Text;

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand(
                "UPDATE CustomerTable SET CustomerName=@n,MobileNo=@m,Address=@a WHERE CustomerID=@id", con);

            cmd.Parameters.AddWithValue("@n", name);
            cmd.Parameters.AddWithValue("@m", mobile);
            cmd.Parameters.AddWithValue("@a", address);
            cmd.Parameters.AddWithValue("@id", id);

            con.Open();
            cmd.ExecuteNonQuery();
        }
        lblMsg.ForeColor = System.Drawing.Color.Green;
        lblMsg.Text = "Customer Updated Successfully";

        gvCustomers.EditIndex = -1;
        BindCustomers();
    }

    protected void gvCustomers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvCustomers.DataKeys[e.RowIndex].Value);

        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("DELETE FROM CustomerTable WHERE CustomerID=@id", con);
            cmd.Parameters.AddWithValue("@id", id);
            con.Open();
            cmd.ExecuteNonQuery();
        }
        lblMsg.ForeColor = System.Drawing.Color.Green;
        lblMsg.Text = "Customer Delete Successfully";
        BindCustomers();
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("Dashboard.aspx");
    }
}