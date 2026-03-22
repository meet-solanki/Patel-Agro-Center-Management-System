<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard | Patel Agro Center</title>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />

 <style>
        body {
            margin: 0;
            font-family: 'Segoe UI';
            background: url('images/login-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            min-height: 100vh;
            background: rgba(0,0,0,0.7);
            display: flex;
        }

        /* Sidebar */
        .sidebar {
            width: 220px;
            background: #27ae60;
            color: white;
            flex-shrink: 0;
            transition: width 0.3s;
            display: flex;
            flex-direction: column;
        }

        .sidebar.collapsed {
            width: 60px;
        }

        .sidebar h2 {
            text-align: center;
            margin: 20px 0;
            font-size: 20px;
            transition: opacity 0.3s;
        }

        .sidebar.collapsed h2 {
            opacity: 0;
        }

        .toggle-btn {
            background: none;
            border: none;
            color: white;
            font-size: 22px;
            margin: 10px;
            cursor: pointer;
        }

        .sidebar a {
            padding: 15px 20px;
            text-decoration: none;
            color: white;
            display: flex;
            align-items: center;
            margin: 5px 10px;
            border-radius: 10px;
            font-weight: bold;
            transition: 0.3s;
            position: relative;
        }

        .sidebar a i {
            width: 25px;
            text-align: center;
        }

        .sidebar.collapsed a span {
            display: none;
        }

        .sidebar a:hover {
            background: #2ecc71;
            transform: scale(1.05);
        }

        .sidebar a::before {
            content: '•';
            position: absolute;
            left: 10px;
            color: yellow;
            opacity: 0;
            transform: translateX(-20px);
            transition: 0.3s;
        }

        .sidebar a:hover::before {
            opacity: 1;
            transform: translateX(0);
        }

        /* Main content */
        .main {
            flex: 1;
            padding: 30px;
            display: flex;
            flex-direction: column;
            animation: fadeIn 1s;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .cards {
            display: flex;
            flex-wrap: wrap;
            margin-top: 20px;
        }

        .card {
            width: 240px;
            height: 140px;
            background: white;
            border-radius: 15px;
            margin: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            transition: transform 0.3s;
        }

        .card:hover {
            transform: scale(1.08);
        }

        .card h3 {
            margin: 0;
            color: #2c3e50;
        }

        .count {
            font-size: 36px;
            margin-top: 15px;
            color: #27ae60;
            font-weight: bold;
        }

        .logout-btn {
            margin-top: auto;
            margin-bottom: 20px;
        }

        .logout-btn a {
            text-decoration: none;
            color: white;
            padding: 10px 20px;
            display: block;
            background: red;
            border-radius: 10px;
            margin: 10px;
            text-align: center;
        }

        .logout-btn a:hover {
            background: #ff4c4c;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">
<div class="overlay">

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <button class="toggle-btn" onclick="toggleSidebar(); return false;">
            <i class="fas fa-bars"></i>
        </button>
        <h2>Patel Agro</h2>
        <a href="Dashboard.aspx"><i class="fas fa-tachometer-alt"></i> <span>Dashboard</span></a>
        <a href="Products.aspx"><i class="fas fa-seedling"></i> <span>Products</span></a>
        <a href="Customers.aspx"><i class="fas fa-users"></i> <span>Customers</span></a>
        <a href="Sales.aspx"><i class="fas fa-cart-plus"></i> <span>Sales</span></a>
        <a href="Reports.aspx"><i class="fas fa-file-alt"></i> <span>Reports</span></a>

        <div class="logout-btn">
            <a href="Logout.aspx"><i class="fas fa-sign-out-alt"></i><span>Logout</span></a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main">
        <h2>Welcome, Admin</h2>
        <div class="cards">
            <div class="card">
                <h3>Total Customers</h3>
                <div class="count"><asp:Label ID="lblCustomers" runat="server" /></div>
            </div>
            <div class="card">
                <h3>Total Products</h3>
                <div class="count"><asp:Label ID="lblProducts" runat="server" /></div>
            </div>
            <div class="card">
                <h3>Total Sales</h3>
                <div class="count"><asp:Label ID="lblSales" runat="server" /></div>
            </div>
        </div>
    </div>

</div>
</form>

<script>
    function toggleSidebar() {
        var sidebar = document.getElementById("sidebar");
        sidebar.classList.toggle("collapsed");
    }
</script>
</body>
</html>
