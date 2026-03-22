<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Patel Agro Center</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial;
            background: url('images/agro-bg.jpg') no-repeat center center fixed;
            background-size: cover;
            overflow: hidden;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.65);
            height: 100vh;
            width: 100%;
        }

        /* Fade animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Slide animation */
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(50px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .header {
            text-align: center;
            color: white;
            padding-top: 80px;
            animation: fadeIn 2s;
        }

        .header h1 {
            font-size: 48px;
            letter-spacing: 2px;
        }

        .header p {
            font-size: 20px;
            margin-top: 10px;
        }

        .menu {
            text-align: center;
            margin-top: 30px;
            animation: fadeIn 3s;
        }

        .menu a {
            color: #fff;
            text-decoration: none;
            padding: 14px 30px;
            margin: 10px;
            background: #27ae60;
            border-radius: 30px;
            font-weight: bold;
            display: inline-block;
            transition: 0.3s;
        }

        .menu a:hover {
            background: #2ecc71;
            transform: scale(1.1);
        }

        .content {
            width: 75%;
            margin: 60px auto;
            background: #ffffff;
            padding: 35px;
            border-radius: 15px;
            text-align: center;
            animation: slideUp 2s;
        }

        .content h2 {
            color: #2c3e50;
            font-size: 32px;
        }

        .content p {
            color: #555;
            font-size: 17px;
            line-height: 28px;
        }

        .footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            color: white;
            text-align: center;
            padding: 12px;
            background: rgba(0,0,0,0.5);
            animation: fadeIn 4s;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">
    <div class="overlay">

        <div class="header">
            <h1>Patel Agro Center</h1>
            <p>Pesticides & Seeds Corporation</p>
        </div>

        <div class="menu">

           <a href="Login.aspx">Login</a>
            <a href="Products.aspx">Products</a>
            <a href="Customers.aspx">Customers</a>
            <a href="Sales.aspx">Sales</a>
        </div>

        <div class="content">
            <h2>Welcome to Patel Agro Center</h2>
            <p>
                Patel Agro Center provides high-quality seeds, pesticides, and agricultural
                solutions to farmers. Our mission is to increase productivity, protect crops,
                and support sustainable farming practices.
            </p>
        </div>

        <div class="footer">
            © 2026 Patel Agro Center | All Rights Reserved
        </div>

    </div>
</form>
</body>
</html>
