<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reset Password</title>
    <link rel="stylesheet" href="css/ChangePassword.css?v=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>
<div class="container">
    <form action="resetPassword" method="post" id="resetForm">
        <h2>Reset Your Password</h2>

        <div class="form-group">
            <input type="email" name="email" id="email" required placeholder=" ">
            <label>Email Address</label>
        </div>

        <div class="form-group password-group">
            <input type="password" name="newPassword" id="newPassword" required placeholder=" ">
            <label>New Password</label>
            <i class="fa-solid fa-eye toggle-password" data-target="newPassword"></i>
        </div>

        <div class="form-group password-group">
            <input type="password" name="confirmPassword" id="confirmPassword" required placeholder=" ">
            <label>Confirm Password</label>
            <i class="fa-solid fa-eye toggle-password" data-target="confirmPassword"></i>
        </div>

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
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="javascript/Alert.js"></script>
<script src="javascript/toggle-password.js"></script>
</body>
</html>
