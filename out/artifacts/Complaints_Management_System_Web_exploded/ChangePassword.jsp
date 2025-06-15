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
    <link rel="stylesheet" href="css/ChangePassword.css">
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
<script>
    const resetStatus = "<%= request.getParameter("reset") != null ? request.getParameter("reset") : "" %>";
    const errorStatus = "<%= request.getParameter("error") != null ? request.getParameter("error") : "" %>";
</script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="javascript/alerts.js"></script>
</body>
</html>
