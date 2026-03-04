<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ELearningPlatform.Login" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EduStream - Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Rajdhani:wght@600;700&family=DM+Sans:wght@400;500;600&display=swap" rel="stylesheet" />
    <style>
        :root {
            --navy: #0f1221;
            --cyan: #00c8ff;
            --cyan2: #00e5ff;
            --white: #ffffff;
            --grey-bg: #f0f3f8;
            --grey-text: #8892a4;
            --label: #2d3561;
            --border: #dde3ef;
            --red: #ff4d6d;
        }

        * { margin: 0; padding: 0; box-sizing: border-box; }

        body {
            font-family: 'DM Sans', sans-serif;
            background: var(--grey-bg);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 30px 20px;
        }

        .card-wrapper {
            width: 440px;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(15,18,33,0.18);
        }

        .top-bar {
            background: var(--navy);
            padding: 18px 30px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .top-bar .brand {
            font-family: 'Rajdhani', sans-serif;
            font-size: 22px;
            font-weight: 700;
            color: var(--cyan);
            letter-spacing: 2px;
        }

        .top-bar .dot {
            width: 8px; height: 8px;
            background: var(--cyan);
            border-radius: 50%;
            animation: pulse 1.5s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; transform: scale(1); }
            50% { opacity: 0.4; transform: scale(0.7); }
        }

        .card {
            background: var(--white);
            padding: 36px 36px 30px;
        }

        .card-title {
            font-family: 'Rajdhani', sans-serif;
            font-size: 26px;
            font-weight: 700;
            color: var(--navy);
            margin-bottom: 4px;
        }

        .card-sub {
            font-size: 13px;
            color: var(--grey-text);
            margin-bottom: 28px;
        }

        .form-group { margin-bottom: 18px; }

        .form-group label {
            display: block;
            font-size: 12px;
            font-weight: 600;
            color: var(--label);
            margin-bottom: 7px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .form-group input {
            width: 100%;
            padding: 12px 16px;
            border: 1.5px solid var(--border);
            border-radius: 10px;
            font-size: 14px;
            font-family: 'DM Sans', sans-serif;
            color: var(--navy);
            background: #fafbff;
            outline: none;
            transition: all 0.25s;
        }

        .form-group input:focus {
            border-color: var(--cyan);
            background: #fff;
            box-shadow: 0 0 0 3px rgba(0,200,255,0.1);
        }

        .form-group input::placeholder { color: #b0bac9; }

        .btn {
            width: 100%;
            padding: 13px;
            background: var(--navy);
            color: var(--cyan);
            border: none;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 700;
            font-family: 'Rajdhani', sans-serif;
            letter-spacing: 2px;
            cursor: pointer;
            transition: all 0.3s;
            margin-top: 6px;
            text-transform: uppercase;
        }

        .btn:hover {
            background: var(--cyan);
            color: var(--navy);
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(0,200,255,0.3);
        }

        .lbl-message {
            display: block;
            font-size: 12px;
            color: var(--red);
            margin-top: 10px;
            text-align: center;
            min-height: 16px;
        }

        .bottom-link {
            text-align: center;
            margin-top: 22px;
            font-size: 13px;
            color: var(--grey-text);
            padding-top: 18px;
            border-top: 1px solid var(--border);
        }

        .bottom-link a {
            color: var(--cyan2);
            text-decoration: none;
            font-weight: 600;
        }

        .bottom-link a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card-wrapper">

            <!-- Top Navy Bar with EduStream brand -->
            <div class="top-bar">
                <div class="dot"></div>
                <span class="brand">EduStream</span>
            </div>

            <div class="card">
                <div class="card-title">Welcome Back!</div>
                <div class="card-sub">Login to continue your learning journey</div>

                <!-- Email Field -->
                <div class="form-group">
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="Enter your email" TextMode="Email" />
                </div>

                <!-- Password Field -->
                <div class="form-group">
                    <label>Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter your password" TextMode="Password" />
                </div>

                <!-- Login Button -->
                <asp:Button ID="btnLogin" runat="server" Text="LOGIN" CssClass="btn" OnClick="btnLogin_Click" />

                <!-- Message Label - shows error if login fails -->
                <asp:Label ID="lblMessage" runat="server" CssClass="lbl-message" />

                <!-- Link to Register page -->
                <div class="bottom-link">
                    Don't have an account? <a href="Register.aspx">Register here</a>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
