<%--
  Created by IntelliJ IDEA.
  User: liyan
  Date: 6/13/2025
  Time: 2:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Sign Up</title>

</head>
<body>
<!-- Floating particles -->
<div class="particle" style="left: 10%; animation-delay: 0s;"></div>
<div class="particle" style="left: 20%; animation-delay: 1s;"></div>
<div class="particle" style="left: 30%; animation-delay: 2s;"></div>
<div class="particle" style="left: 40%; animation-delay: 3s;"></div>
<div class="particle" style="left: 50%; animation-delay: 4s;"></div>
<div class="particle" style="left: 60%; animation-delay: 5s;"></div>
<div class="particle" style="left: 70%; animation-delay: 0.5s;"></div>
<div class="particle" style="left: 80%; animation-delay: 1.5s;"></div>
<div class="particle" style="left: 90%; animation-delay: 2.5s;"></div>

<div class="container">
    <div class="message" id="message"></div>

    <div class="form-container">
        <!-- Login Form -->
        <form class="form active" id="loginForm">
            <h2>Welcome Back</h2>
            <div class="form-group">
                <input type="email" id="loginEmail" required>
                <label>Email Address</label>
            </div>
            <div class="form-group">
                <select name="role" id="userRole" required>
                    <option value="" disabled selected hidden>Select role</option>
                    <option value="admin">admin</option>
                    <option value="user">user</option>
                </select>
            </div>
            <div class="form-group">
                <input type="password" id="loginPassword" required>
                <label>Password</label>
            </div>
            <div class="forgot-password">
                <a href="#" onclick="showMessage('Password reset link sent to your email!', 'success')">Forgot Password?</a>
            </div>
            <div class="button-group">
                <button type="submit" class="btn">
                    <span>Sign In</span>
                </button>
            </div>
            <div class="switch-form">
                <a onclick="switchToSignup()">Don't have an account? Sign up</a>
            </div>
        </form>

        <!-- Sign Up Form -->
        <form class="form" id="signupForm">
            <h2>Create Account</h2>
            <div class="form-group">
                <input type="text" id="signupName" required>
                <label>Full Name</label>
            </div>
            <div class="form-group">
                <input type="email" id="signupEmail" required>
                <label>Email Address</label>
            </div>
            <div class="form-group">
                <select name="role" id="signUpRole" required>
                    <option value="" disabled selected hidden>Select role</option>
                    <option value="admin">admin</option>
                    <option value="user">user</option>
                </select>
            </div>
            <div class="form-group">
                <input type="password" id="signupPassword" required>
                <label>Password</label>
            </div>
            <div class="form-group">
                <input type="password" id="confirmPassword" required>
                <label>Confirm Password</label>
            </div>

            <div class="button-group">
                <button type="submit" class="btn">
                    <span>Sign Up</span>
                </button>
            </div>
            <div class="switch-form">
                <a onclick="switchToLogin()">Already have an account? Sign in</a>
            </div>
        </form>
    </div>
</div>
<script src="javasript/LoginPage.js"></script>
</body>
</html>
