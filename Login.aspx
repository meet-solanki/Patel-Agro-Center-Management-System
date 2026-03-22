<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Patel Agro Center | Login</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial;
            background: url('images/login-bg.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .overlay {
            background: rgba(0,0,0,0.55);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login-box {
            width: 360px;
            background: white;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.4);
            animation: slideDown 0.8s ease;
        }

        @keyframes slideDown {
            from { transform: translateY(-40px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .title {
            text-align: center;
            font-size: 22px;
            color: #2e7d32;
            margin-bottom: 20px;
        }

        .input-box {
            margin-bottom: 15px;
        }

        .input-box input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
            transition: 0.3s;
        }

        .input-box input:focus {
            border-color: #2e7d32;
            box-shadow: 0 0 8px rgba(46,125,50,0.4);
        }
        .password-box {
            position: relative;
        }

        .password-input {
            width: 100%;
            padding: 10px 40px 10px 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        .eye {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            font-size: 18px;
            transition: transform 0.3s ease;
        }   

        .eye:hover {
            transform: translateY(-50%) scale(1.2);
        }

        .btn-login {
            width: 100%;
            padding: 10px;
            background: #2e7d32;
            color: white;
            font-size: 16px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-login:hover {
            background: #1b5e20;
            transform: scale(1.05);
        }

        .links {
            text-align: center;
            margin-top: 15px;
        }

        .links a {
            color: #2e7d32;
            text-decoration: none;
            font-size: 14px;
        }

        .links a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body>
<form id="Form1" runat="server">

<div class="overlay">
    <div class="login-box">

        <div class="title">🌱 Patel Agro Center Login</div>

        <div class="input-box">
            <asp:TextBox ID="txtUsername" runat="server" placeholder="Username" />
        </div>

        <div class="input-box password-box">
             <asp:TextBox ID="txtPassword" runat="server"
                TextMode="Password"
                CssClass="password-input"
                placeholder="Password" />

                <span class="eye" onclick="togglePassword()">
                    👁
            </span>
          </div>

        <asp:Button ID="btnLogin" runat="server"
            Text="Login"
            CssClass="btn-login"
            OnClick="btnLogin_Click" />

        <div class="links">
            <a href="ForgotPassword.aspx">Forgot Password?</a><br />
            <a href="Register.aspx">New User? Register</a>
        </div>

    </div>
</div>

<script type="text/javascript">
    function togglePassword() {
        var pwd = document.getElementById('<%= txtPassword.ClientID %>');
        var eye = document.querySelector('.eye');

        if (pwd.type === "password") {
            pwd.type = "text";
            eye.innerHTML = "🙈";
        } else {
            pwd.type = "password";
            eye.innerHTML = "👁";
        }
    }
</script>


</form>
</body>
</html>
