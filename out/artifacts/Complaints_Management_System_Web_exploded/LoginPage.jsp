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
    <link rel="stylesheet" href="css/LoginPage.css">

</head>
<body>

<div class="container">
    <div class="message" id="message"></div>

    <div class="form-container">
        <!-- Login Form -->
        <form class="form active" id="loginForm" action="signIn" method="post">
            <h2>Welcome Back</h2>
            <div class="form-group">
                <!-- FIXED: Added placeholder attribute for proper label animation -->
                <input type="email" id="loginEmail" name="email" required placeholder=" ">
                <label for="loginEmail">Email Address</label>
            </div>
            <div class="form-group">
                <!-- FIXED: Removed default selected value, added proper structure -->
                <select name="role" id="userRole" required>
                    <option value="" disabled selected></option>
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>
                <label for="userRole">User Role</label>
            </div>
            <div class="form-group">
                <!-- FIXED: Added placeholder attribute -->
                <input type="password" id="loginPassword" name="password" required placeholder=" ">
                <label for="loginPassword">Password</label>
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
                <a href="#" id="switchToSignup">Don't have an account? Sign up</a>
            </div>
        </form>

        <!-- Sign Up Form -->
        <form class="form" id="signupForm" action="register" method="post">
            <h2>Create Account</h2>
            <div class="form-group">
                <!-- FIXED: Added placeholder attribute -->
                <input type="text" id="signupName" name="name" required placeholder=" ">
                <label for="signupName">Full Name</label>
            </div>
            <div class="form-group">
                <!-- FIXED: Added placeholder attribute -->
                <input type="email" id="signupEmail" name="email" required placeholder=" ">
                <label for="signupEmail">Email Address</label>
            </div>
            <div class="form-group">
                <!-- FIXED: Moved label after select, removed default selected value -->
                <select name="role" id="signUpRole" required>
                    <option value="" disabled selected></option>
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>
                <label for="signUpRole">User Role</label>
            </div>
            <div class="form-group">
                <!-- FIXED: Added placeholder attribute -->
                <input type="password" id="signupPassword" name="password" required placeholder=" ">
                <label for="signupPassword">Password</label>
            </div>
            <div class="form-group">
                <!-- FIXED: Added placeholder attribute -->
                <input type="password" id="confirmPassword" name="confirmPassword" required placeholder=" ">
                <label for="confirmPassword">Confirm Password</label>
            </div>

            <div class="button-group">
                <button type="submit" class="btn">
                    <span>Sign Up</span>
                </button>
            </div>
            <div class="switch-form">
                <a href="#" id="switchToLogin">Already have an account? Sign in</a>
            </div>
        </form>
    </div>
</div>

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


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="javascript/LoginPage.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
