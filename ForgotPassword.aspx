<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
   <title>Forgot Password</title>

<style>
    body {
        margin: 0;
        font-family: Segoe UI;
        background: url('images/.jpg') no-repeat center center fixed;
        background-size: cover;
    }

    .overlay {
        height: 100vh;
        background: rgba(0,0,0,0.7);
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .box {
        width: 360px;
        background: #fff;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 15px 35px rgba(0,0,0,0.6);
        text-align: center;
        animation: slide 1.2s;
    }

    @keyframes slide {
        from { opacity: 0; transform: translateY(40px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .box h2 {
        color: #2c3e50;
    }

    .box input {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 8px;
        border: 1px solid #ccc;
    }

    .box button {
        width: 100%;
        padding: 12px;
        background: #27ae60;
        color: white;
        border: none;
        border-radius: 25px;
        font-size: 16px;
        cursor: pointer;
    }

    .msg {
        margin-top: 10px;
        color: red;
    }

    .back {
        margin-top: 10px;
    }

    .back a {
        text-decoration: none;
        color: #27ae60;
        font-weight: bold;
    }
</style>
</head>

<body>
<form id="Form1" runat="server">
<div class="overlay">
    <div class="box">
        <h2>Forgot Password</h2>

        <asp:TextBox ID="txtUser" runat="server" placeholder="Username"></asp:TextBox>
        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email"></asp:TextBox>
        <asp:TextBox ID="txtNewPass" runat="server" TextMode="Password" placeholder="New Password"></asp:TextBox>

        <asp:Button ID="btnReset" runat="server" Text="Reset Password" OnClick="btnReset_Click" />

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

        <div class="back">
            <a href="Login.aspx">← Back to Login</a>
        </div>
    </div>
</div>
</form>
</body>
</html>
