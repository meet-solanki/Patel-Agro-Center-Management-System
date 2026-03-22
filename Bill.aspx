<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Bill.aspx.cs" Inherits="Bill" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sales Bill</title>

<style>
.bill {
    width: 700px;
    margin: 30px auto;
    padding: 25px;
    font-family: Arial;
    background: white;
    box-shadow: 0 10px 25px rgba(0,0,0,.3);
    animation: fade 1s;
}
@keyframes fade {
    from { opacity:0; transform:scale(.95); }
    to { opacity:1; }
}
h2 { text-align:center; color:#2e7d32; }
table { width:100%; border-collapse:collapse; }
td,th { border:1px solid #999; padding:8px; text-align:center; }
th { background:#4caf50; color:white; }
.print-btn {
    margin-top:20px;
    text-align:center;
}
@media print {
    .print-btn { display:none; }
}
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
<div class="bill">

<h2>PATEL AGRO CENTER</h2>
<hr />

<p><b>Customer:</b> <asp:Label ID="lblCustomer" runat="server" /></p>
<p><b>Date:</b> <asp:Label ID="lblDate" runat="server" /></p>

<table>
<tr>
    <th>Product</th>
    <th>Price</th>
    <th>Qty</th>
    <th>Total</th>
</tr>
<tr>
    <td><asp:Label ID="lblProduct" runat="server" /></td>
    <td><asp:Label ID="lblPrice" runat="server" /></td>
    <td><asp:Label ID="lblQty" runat="server" /></td>
    <td><asp:Label ID="lblTotal" runat="server" /></td>
</tr>
</table>

<div class="print-btn">
    <button onclick="window.print();return false;">🖨 Print Bill</button>
</div>
<asp:Button ID="btnBack" runat="server"
    CssClass="dash-btn"
    Text="← Dashboard"
    OnClick="btnBack_Click" />

</div>
</form>
</body>
</html>
