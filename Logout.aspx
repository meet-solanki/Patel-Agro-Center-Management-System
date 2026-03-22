<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Logout" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logout | Patel Agro Center</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial;
            background: url('images/logout-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            background: rgba(0, 0, 0, 0.65);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-card {
            width: 400px;
            background: #ffffff;
            padding: 35px;
            border-radius: 18px;
            text-align: center;
            box-shadow: 0 20px 50px rgba(0,0,0,0.4);
            animation: fadeSlide 0.8s ease;
        }

        @keyframes fadeSlide {
            from {
                opacity: 0;
                transform: translateY(50px) scale(0.9);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .icon {
            font-size: 65px;
            margin-bottom: 15px;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.1); }
            100% { transform: scale(1); }
        }

        h2 {
            color: #2e7d32;
            margin-bottom: 10px;
        }

        p {
            color: #555;
            margin-bottom: 25px;
        }

        .btn {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            padding: 10px 22px;
            border-radius: 25px;
            font-size: 15px;
            cursor: pointer;
            transition: 0.3s;
            margin-left: 6px;
            margin-right: 6px;
            margin-top: 0;
        }

        .btn-logout {
            background: #2e7d32;
            color: #fff;
        }

        .btn-logout:hover {
            background: #1b5e20;
            transform: scale(1.08);
        }

        .btn-cancel {
            background: #eee;
        }

        .btn-cancel:hover {
            background: #ddd;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">

<div class="overlay">
    <div class="logout-card">

        <div class="icon">🌾</div>

        <h2>Logout Confirmation</h2>
        <p>You are about to logout from Patel Agro Center.</p>

        <asp:Button ID="btnYes" runat="server"
            Text="Logout"
            CssClass="btn btn-logout"
            OnClick="btnYes_Click" />

        <asp:Button ID="btnNo" runat="server"
            Text="Cancel"
            CssClass="btn btn-cancel"
            OnClick="btnNo_Click" />

    </div>
</div>

</form>
</body>
</html>
