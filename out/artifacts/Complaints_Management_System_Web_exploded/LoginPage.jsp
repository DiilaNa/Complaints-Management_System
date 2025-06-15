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
    <link rel="stylesheet" href="css/LoginPage.css?v=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>

<div class="container">
    <div class="message" id="message"></div>

    <div class="form-container">
        <!-- Login Form -->
        <form class="form active" id="loginForm" action="signIn" method="post">
            <h2>Welcome Back</h2>
            <div class="form-group">
                <input type="email" id="loginEmail" name="email" required placeholder=" ">
                <label for="loginEmail">Email Address</label>
            </div>
            <div class="form-group">
                <select name="role" id="userRole" required>
                    <option value="" disabled selected></option>
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>
                <label for="userRole">User Role</label>
            </div>
            <div class="form-group password-group" id="pg">
                <input type="password" id="loginPassword" name="password" required placeholder=" ">
                <label for="loginPassword">Password</label>
                <span id="tp" class="toggle-password fa fa-eye" toggle="#loginPassword"></span>
            </div>
            <div class="forgot-password">
                <a href="ChangePassword.jsp" >Forgot Password?</a>
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
                <input type="text" id="signupName" name="name" required placeholder=" ">
                <label for="signupName">Full Name</label>
            </div>
            <div class="form-group">
                <input type="email" id="signupEmail" name="email" required placeholder=" ">
                <label for="signupEmail">Email Address</label>
            </div>
            <div class="form-group">
                <select name="role" id="signUpRole" required>
                    <option value="" disabled selected></option>
                    <option value="admin">Admin</option>
                    <option value="user">User</option>
                </select>
                <label for="signUpRole">User Role</label>
            </div>
            <div class="form-group password-group">
                <input type="password" id="signupPassword" name="password" required placeholder=" ">
                <label for="signupPassword">Password</label>
                <span class="toggle-password fa fa-eye" toggle="#signupPassword"></span>
            </div>

            <div class="form-group password-group">
                <input type="password" id="confirmPassword" name="password" required placeholder=" ">
                <label for="confirmPassword">Password</label>
                <span class="toggle-password fa fa-eye" toggle="#confirmPassword"></span>
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
<script src="javascript/LoginPage.js?v=1"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>
