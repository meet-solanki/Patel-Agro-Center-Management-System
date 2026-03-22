<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sales.aspx.cs" Inherits="Sales" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sales | Patel Agro Center</title>

<style>
body{
    margin:0;
    font-family:'Segoe UI';
    background:url('images/sales-bg.jpg') no-repeat center center fixed;
    background-size:cover;
}
.overlay{
    min-height:100vh;
    background:rgba(0,0,0,0.7);
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
.sales-box{
    background:#fff;
    max-width:550px;
    margin:20px auto;
    padding:25px;
    border-radius:15px;
    box-shadow:0 15px 40px rgba(0,0,0,.5);
    animation:slideUp 1s;
}
@keyframes slideUp{
    from{opacity:0;transform:translateY(40px);}
    to{opacity:1;transform:translateY(0);}
}
.sales-box select, .sales-box input{
    width:100%;
    padding:10px;
    margin:10px 0;
    border-radius:8px;
    border:1px solid #ccc;
}
.sales-box button{
    width:100%;
    padding:12px;
    background:#27ae60;
    color:#fff;
    border:none;
    border-radius:25px;
    font-size:16px;
    cursor:pointer;
}
.sales-box button:hover{
    background:#2ecc71;
    transform:scale(1.05);
}
.bill-box{
    background:#fff;
    margin:30px auto;
    padding:20px;
    max-width:600px;
    border-radius:15px;
    box-shadow:0 10px 30px rgba(0,0,0,.5);
    animation:fadeIn 1s;
}
@keyframes fadeIn{from{opacity:0;}to{opacity:1;}}
.dash-btn {
        padding: 12px 26px;
        border-radius: 40px;
        border: none;
        background: linear-gradient(45deg,#1b5e20,#43a047);
        color: white;
        font-size: 15px;
        cursor: pointer;
        transition: 0.4s;
        position: relative;
        overflow: hidden;
        box-shadow: 0 6px 20px rgba(0,0,0,.25);
    }

    .dash-btn:hover {
        transform: translateX(-6px);
        box-shadow: 0 12px 30px rgba(67,160,71,.6);
    }

    .dash-btn:before {
        content: '←';
        position: absolute;
        left: -25px;
        top: 50%;
        transform: translateY(-50%);
        font-size: 18px;
        transition: .4s;
        opacity: 0;
    }

    .dash-btn:hover:before {
        left: 18px;
        opacity: 1;
    }

    .dash-btn span {
        transition: .4s;
    }

    .dash-btn:hover span {
        margin-left: 15px;
    }
</style>
</head>

<body>
<form id="Form1" runat="server">
<div class="overlay">

<h2>Sales Entry</h2>

<div class="sales-box">
    <asp:DropDownList ID="ddlCustomer" runat="server"></asp:DropDownList>

    <asp:DropDownList ID="ddlProduct" runat="server"
        AutoPostBack="true" OnSelectedIndexChanged="ddlProduct_SelectedIndexChanged">
    </asp:DropDownList>

    <asp:TextBox ID="txtPrice" runat="server" placeholder="Price" ReadOnly="true"></asp:TextBox>

    <asp:TextBox ID="txtQty" runat="server" placeholder="Quantity"
        AutoPostBack="true" OnTextChanged="txtQty_TextChanged"></asp:TextBox>

    <asp:TextBox ID="txtTotal" runat="server" placeholder="Total Amount" ReadOnly="true"></asp:TextBox>

   <asp:Button ID="btnSave" runat="server"
    Text="Generate Bill"
    OnClick="btnSave_Click"
    CssClass="btn" />
    <asp:Button ID="btnBack" runat="server"
    CssClass="dash-btn"
    Text="← Dashboard"
    OnClick="btnBack_Click" />
</div>
</div>
</form>
</body>
</html>
