<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Customers.aspx.cs" Inherits="Customers" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title>Customers | Patel Agro Center</title>

<style>
body{
    margin:0;
    font-family:'Segoe UI';
    background:url('images/customers-bg.jpg') no-repeat center center fixed;
    background-size:cover;
}
.overlay{
    min-height:100vh;
    background:rgba(0,0,0,0.65);
    padding:30px;
}
h2{
    color:#fff;
    text-align:center;
    animation:fadeDown 1s;
}
@keyframes fadeDown{
    from{opacity:0;transform:translateY(-30px);}
    to{opacity:1;transform:translateY(0);}
}
.form-box{
    background:#fff;
    border-radius:15px;
    padding:25px;
    max-width:500px;
    margin:20px auto;
    box-shadow:0 15px 40px rgba(0,0,0,.5);
    animation:slideUp 1s;
}
@keyframes slideUp{
    from{opacity:0;transform:translateY(40px);}
    to{opacity:1;transform:translateY(0);}
}
.form-box input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:8px;
    border:1px solid #ccc;
}
.form-box button{
    width:100%;
    padding:12px;
    background:#2980b9;
    color:#fff;
    border:none;
    border-radius:25px;
    font-size:16px;
    cursor:pointer;
}
.form-box button:hover{
    background:#3498db;
    transform:scale(1.05);
}
.grid-box{
    background:#fff;
    padding:20px;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,.5);
    animation:fadeIn 1s;
}
@keyframes fadeIn{from{opacity:0;}to{opacity:1;}}
.grid-box th{
    background:#2980b9;
    color:#fff;
}
</style>
</head>

<body>
<form id="Form1" runat="server">
<div class="overlay">

<h2>Customer Management</h2>

<div class="form-box">
    <asp:TextBox ID="txtName" runat="server" placeholder="Customer Name"></asp:TextBox>
    <asp:TextBox ID="txtMobile" runat="server" placeholder="Mobile Number"></asp:TextBox>
    <asp:TextBox ID="txtAddress" runat="server" placeholder="Address"></asp:TextBox>
    <asp:Button ID="btnAdd" runat="server" Text="Add Customer" OnClick="btnAdd_Click" />
    <asp:Button ID="btnBack" runat="server"
                 CssClass="dash-btn"
                 Text="← Dashboard"
                OnClick="btnBack_Click" />
    <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
</div>

<div class="grid-box">
    <asp:GridView ID="gvCustomers" runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="CustomerID"
        OnRowEditing="gvCustomers_RowEditing"
        OnRowUpdating="gvCustomers_RowUpdating"
        OnRowCancelingEdit="gvCustomers_RowCancelingEdit"
        OnRowDeleting="gvCustomers_RowDeleting">

        <Columns>
            <asp:BoundField DataField="CustomerID" HeaderText="ID" ReadOnly="true" />
            <asp:BoundField DataField="CustomerName" HeaderText="Name" />
            <asp:BoundField DataField="MobileNo" HeaderText="Mobile" />
            <asp:BoundField DataField="Address" HeaderText="Address" />
            <asp:CommandField ShowEditButton="true" ShowDeleteButton="true" />
        </Columns>
    </asp:GridView>
    <asp:Label ID="Label1" runat="server" CssClass="msg"></asp:Label>
</div>

</div>
</form>
</body>
</html>
