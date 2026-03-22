<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register | Patel Agro Center</title>

<style>
    body {
        margin: 0;
        font-family: Segoe UI;
        background: url('images/login-bg.jpg') no-repeat center center fixed;
        background-size: cover;
    }

    .overlay {
        height: 100vh;
        background: rgba(0,0,0,0.7);
        display: flex;
        align-items: center;
        justify-content: center;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(50px); }
        to { opacity: 1; transform: translateY(0); }
    }

    .register-box {
        width: 400px;
        background: #fff;
        padding: 30px;
        border-radius: 18px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.6);
        animation: fadeUp 1.3s;
        text-align: center;
    }

    .register-box h2 {
        color: #2c3e50;
        margin-bottom: 10px;
    }

    .register-box input {
        width: 100%;
        padding: 11px;
        margin: 8px 0;
        border-radius: 8px;
        border: 1px solid #ccc;
        font-size: 14px;
    }

    .register-box button {
        width: 100%;
        padding: 12px;
        background: #27ae60;
        border: none;
        color: white;
        border-radius: 25px;
        font-size: 16px;
        margin-top: 12px;
        cursor: pointer;
    }

    .register-box button:hover {
        background: #2ecc71;
        transform: scale(1.05);
    }

    .msg {
        margin-top: 10px;
        color: red;
    }

    .link {
        margin-top: 10px;
    }

    .link a {
        color: #27ae60;
        text-decoration: none;
        font-weight: bold;
    }
</style>
</head>

<body>
<form id="Form1" runat="server">
<div class="overlay">
    <div class="register-box">
        <h2>Create Account</h2>
        <asp:TextBox ID="txtUser" runat="server" CssClass="txt" placeholder="Username"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
        ControlToValidate="txtUser"
        ErrorMessage="Username required"
        CssClass="err" />

    <asp:TextBox ID="txtEmail" runat="server" CssClass="txt" placeholder="Email"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
        ControlToValidate="txtEmail"
        ErrorMessage="Email required"
        CssClass="err" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
        ControlToValidate="txtEmail"
        ErrorMessage="Invalid email"
        CssClass="err"
        ValidationExpression="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" />

    <asp:TextBox ID="txtPass" runat="server" CssClass="txt"
        TextMode="Password" placeholder="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
        ControlToValidate="txtPass"
        ErrorMessage="Password required"
        CssClass="err" />

    <asp:TextBox ID="txtCPass" runat="server" CssClass="txt"
        TextMode="Password" placeholder="Confirm Password"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server"
        ControlToValidate="txtCPass"
        ControlToCompare="txtPass"
        ErrorMessage="Passwords do not match"
        CssClass="err" />

    <asp:Button ID="btnRegister" runat="server"
        Text="Register"
        CssClass="btn"
        OnClick="btnRegister_Click" />

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

        <div class="link">
            <a href="Login.aspx">Already have an account? Login</a>
        </div>
    </div>
</div>
</form>
</body>
</html>
