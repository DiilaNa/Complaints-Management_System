<%--
  Created by IntelliJ IDEA.
  User: liyan
  Date: 6/15/2025
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .container {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 100%;
            max-width: 450px;
            animation: slideUp 0.6s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-size: 28px;
            font-weight: 600;
        }

        .form-group {
            position: relative;
            margin-bottom: 25px;
        }

        .form-group input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid #e1e5e9;
            border-radius: 12px;
            font-size: 16px;
            background: #fff;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-group input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-2px);
        }

        .form-group input:focus + label,
        .form-group input:not(:placeholder-shown) + label {
            top: -10px;
            left: 15px;
            font-size: 12px;
            color: #667eea;
            background: #fff;
            padding: 0 8px;
        }

        .form-group label {
            position: absolute;
            top: 15px;
            left: 20px;
            color: #999;
            font-size: 16px;
            pointer-events: none;
            transition: all 0.3s ease;
        }

        .button-group {
            margin-top: 30px;
        }

        .btn {
            width: 100%;
            padding: 15px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(102, 126, 234, 0.3);
        }

        .btn:active {
            transform: translateY(0);
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            color: #667eea;
            text-decoration: none;
            font-size: 14px;
            transition: color 0.3s ease;
        }

        .back-link a:hover {
            color: #764ba2;
            text-decoration: underline;
        }

        .icon {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #999;
            font-size: 18px;
        }

        .form-group:has(input[type="email"]) .icon::before {
            content: "✉";
        }

        .form-group:has(input[type="password"]) .icon::before {
            content: "🔒";
        }

        .error-message {
            color: #e74c3c;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        .success-message {
            color: #27ae60;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }

        @media (max-width: 480px) {
            .container {
                padding: 30px 20px;
                margin: 10px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <form action="resetPassword" method="post" id="resetForm">
        <h2>Reset Your Password</h2>

        <div class="form-group">
            <input type="email" name="email" id="email" required placeholder=" ">
            <label>Email Address</label>
            <span class="icon"></span>
            <div class="error-message" id="emailError">Please enter a valid email address</div>
        </div>

        <div class="form-group">
            <input type="password" name="newPassword" id="newPassword" required placeholder=" ">
            <label>New Password</label>
            <span class="icon"></span>
            <div class="error-message" id="passwordError">Password does not meet requirements</div>
        </div>

        <div class="form-group">
            <input type="password" name="confirmPassword" id="confirmPassword" required placeholder=" ">
            <label>Confirm Password</label>
            <span class="icon"></span>
            <div class="error-message" id="confirmError">Passwords do not match</div>
        </div>

        <div class="success-message" id="successMessage">Password reset successfully!</div>

        <div class="button-group">
            <button type="submit" class="btn">Reset Password</button>
        </div>

        <div class="back-link">
            <a href="LoginPage.jsp">← Back to Login</a>
        </div>
    </form>
</div>
</body>
</html>
