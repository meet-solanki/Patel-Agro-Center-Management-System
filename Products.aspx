<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <title>Products Management</title>

    <style>
        body {
            margin:0;
            font-family: 'Segoe UI', Arial;
            background: url('images/product-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            min-height: 100vh;
            background: rgba(0,0,0,0.55);
            padding-top: 40px;
        }

        h1 {
            color: white;
            text-align: center;
            margin-bottom: 20px;
            animation: fadeDown 1s;
        }

        @keyframes fadeDown {
            from {opacity:0; transform:translateY(-20px);}
            to {opacity:1; transform:translateY(0);}
        }

        .card {
            width: 420px;
            margin: auto;
            background: white;
            border-radius: 12px;
            padding: 25px;
            animation: zoomIn 0.8s;
            box-shadow: 0 20px 40px rgba(0,0,0,0.4);
        }

        @keyframes zoomIn {
            from {transform:scale(0.9); opacity:0;}
            to {transform:scale(1); opacity:1;}
        }

        .input {
            width: 100%;
            padding: 12px;
            margin: 10px 0;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .btn {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 8px;
            background: #2e7d32;
            color: white;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            transition: 0.3s;
        }

        .btn:hover {
            background: #1b5e20;
            transform: scale(1.02);
        }

        .btn-back {
            background: #388e3c;
        }

        .msg {
            text-align:center;
            margin-top:10px;
            font-weight:600;
        }

        .grid-box {
            width: 90%;
            margin: 40px auto;
            background: white;
            border-radius: 12px;
            padding: 20px;
            animation: fadeUp 1s;
        }

        @keyframes fadeUp {
            from {opacity:0; transform:translateY(30px);}
            to {opacity:1; transform:translateY(0);}
        }

        .grid th {
            background: #27ae60;
            color: white;
            padding: 10px;
        }

        .grid td {
            padding: 8px;
            text-align: center;
        }

        .grid a {
            color: blue;
            font-weight: 600;
            text-decoration: none;
            margin: 0 5px;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">

<div class="overlay">
    <h1>Products Management</h1>

    <div class="card">
        <asp:TextBox ID="txtProductName" runat="server" CssClass="input" Placeholder="Product Name"></asp:TextBox>

        <asp:DropDownList ID="ddlCategory" runat="server" CssClass="input">
            <asp:ListItem Text="Select Category" Value=""></asp:ListItem>
            <asp:ListItem>Seed</asp:ListItem>
            <asp:ListItem>Fertilizer</asp:ListItem>
            <asp:ListItem>Pesticide</asp:ListItem>
        </asp:DropDownList>

        <asp:TextBox ID="txtPrice" runat="server" CssClass="input" Placeholder="Price"></asp:TextBox>
        <asp:TextBox ID="txtStock" runat="server" CssClass="input" Placeholder="Stock Quantity"></asp:TextBox>

        <asp:Button ID="btnAdd" runat="server" Text="Add Product" CssClass="btn" OnClick="btnAdd_Click" />
        <asp:Button ID="btnBack" runat="server" Text="← Dashboard" CssClass="btn btn-back" OnClick="btnBack_Click" />

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
    </div>

    <div class="grid-box">
        <asp:GridView ID="gvProducts" runat="server" CssClass="grid"
            AutoGenerateColumns="False"
            DataKeyNames="ProductID"
            OnRowEditing="gvProducts_RowEditing"
            OnRowUpdating="gvProducts_RowUpdating"
            OnRowCancelingEdit="gvProducts_RowCancelingEdit"
            OnRowDeleting="gvProducts_RowDeleting">

            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Category" HeaderText="Category" />
                <asp:BoundField DataField="Price" HeaderText="Price" />
                <asp:BoundField DataField="Stock" HeaderText="Stock" />

                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
    </div>
</div>

</form>
</body>
</html>
