<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Sales Report</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial;
            background: url('images/report-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            background: rgba(0,0,0,0.6);
            min-height: 100vh;
            padding: 30px;
        }

        .report-box {
            background: white;
            max-width: 1100px;
            margin: auto;
            border-radius: 12px;
            padding: 25px;
            animation: slideUp 0.7s ease;
        }

        @keyframes slideUp {
            from { transform: translateY(40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        h2 {
            text-align: center;
            color: #2e7d32;
            margin-bottom: 20px;
        }

        .filters {
            display: flex;
            justify-content: center;
            gap: 12px;
            margin-bottom: 20px;
        }

        .filters input, .filters button {
            padding: 8px 12px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        .filters button {
            background: #2e7d32;
            color: white;
            cursor: pointer;
            transition: 0.3s;
        }

        .filters button:hover {
            background: #1b5e20;
            transform: scale(1.05);
        }

        .grid {
            animation: fadeIn 0.6s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th {
            background: #2e7d32;
            color: white;
            padding: 10px;
        }

        .table td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }

        .table tr:hover {
            background: #f1f8e9;
            transition: 0.3s;
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

<div class="overlay">
    <div class="report-box">

        <h2>📊 Sales Report</h2>

        <div class="filters">
            <asp:TextBox ID="txtFrom" runat="server" CssClass="date" />
            <asp:TextBox ID="txtTo" runat="server" CssClass="date" />

            <asp:Button ID="btnSearch" runat="server" Text="Search"
                OnClick="btnSearch_Click" />

            <asp:Button ID="btnAll" runat="server" Text="Show All"
                OnClick="btnAll_Click" />
        </div>

        <div class="grid">
            <asp:GridView ID="gvSales" runat="server"
                AutoGenerateColumns="false"
                CssClass="table">

                <Columns>
                    <asp:BoundField DataField="SaleID" HeaderText="ID" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product" />
                    <asp:BoundField DataField="Quantity" HeaderText="Qty" />
                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="TotalAmount" HeaderText="Total" />
                    <asp:BoundField DataField="SaleDate" HeaderText="Date"
                        DataFormatString="{0:dd-MM-yyyy}" />
                </Columns>

            </asp:GridView>
        </div>

    </div>
    <asp:Button ID="btnBack" runat="server"
    CssClass="dash-btn"
    Text="← Dashboard"
    OnClick="btnBack_Click" />
</div>

<script type="text/javascript">
    window.onload = function () {
        document.getElementById('<%= txtFrom.ClientID %>').setAttribute('type', 'date');
        document.getElementById('<%= txtTo.ClientID %>').setAttribute('type', 'date');
    };
</script>

</form>
</body>
</html>
