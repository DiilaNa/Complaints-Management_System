<%--
  Created by IntelliJ IDEA.
  User: liyan
  Date: 6/13/2025
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin DashBoard</title>
</head>
<body>
<h1>Admin</h1>
</body>
</html>--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="lk.ijse.project.model.Entity.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"ADMIN".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - CMS</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
<div class="header">
    <h1>Complaint Management System</h1>
    <div class="user-info">
        <span>Welcome, <%= user.getName() %> (Admin)</span>
        <a href="logout" class="btn-secondary">Logout</a>
    </div>
</div>

<div class="dashboard-container">
    <div class="dashboard-menu">
        <h2>Admin Dashboard</h2>
        <ul>
            <li><a href="admin?action=view" class="menu-item">Manage All Complaints</a></li>
        </ul>
    </div>

    <div class="dashboard-content">
        <h3>Administrative Actions</h3>
        <div class="action-cards">
            <div class="card">
                <h4>Manage Complaints</h4>
                <p>View, update status, and manage all complaints in the system</p>
                <a href="admin?action=view" class="btn-primary">Manage</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>