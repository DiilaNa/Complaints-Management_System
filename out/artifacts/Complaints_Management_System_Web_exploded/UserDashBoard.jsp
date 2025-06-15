<%@ page import="lk.ijse.project.model.Entity.Complaints" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: liyan
  Date: 6/14/2025
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--tags--%>
<html>
<head>
    <title>User</title>
    <link rel="stylesheet" href="css/UserDashBoard.css">
</head>
<body>
<div class="dashboard-container">
    <div class="dashboard-header">
        <h2>User Dashboard</h2>
        <form action="logout" method="post">
            <button class="sign-out-btn" type="submit">Sign Out</button>
        </form>
    </div>

    <%
        List<Complaints> complaints = (List<Complaints>) request.getAttribute("complaintsList");
        int total = 0 , pending = 0;
        for (Complaints complaints1 : complaints){
            total++;
            String status = complaints1.getStatus();
            if ("total".equalsIgnoreCase(status)) total++;
            else if ("pending".equalsIgnoreCase(status)) pending++;
        }
    %>

    <div class="stats">
        <div class="stat">
            <span id="totalComplaints total"><%= total %></span>
            Total Complaints
        </div>
        <div class="stat">
            <span id="pendingComplaints pending"><%= pending %></span>
            Pending
        </div>
    </div>

    <button class="add-btn" onclick="document.getElementById('complaintModal').style.display='flex'">
        + Add Complaint
    </button>

    <table>
        <thead>
        <tr>
            <th>Topic</th>
            <th>Description</th>
            <th>Date</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Complaints> list = (List<Complaints>) request.getAttribute("complaintsList");
            if (list != null && !list.isEmpty()) {
                for (Complaints c : list) {
        %>
        <tr>
            <td><%= c.getSubject() %></td>
            <td><%= c.getDescription() %></td>
            <td><%= c.getDate() %></td>
            <td><%= c.getStatus() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="4">No complaints found.</td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>

<!-- Modal -->
<div class="modal" id="complaintModal">
    <div class="modal-content">
        <h3>Add New Complaint</h3>
        <form method="post" action="userDashboard">
            <input type="text" name="subject" placeholder="Subject" required>
            <textarea name="description" placeholder="Describe your complaint" required></textarea>
            <div class="modal-footer">
                <button type="button" class="btn-secondary" onclick="document.getElementById('complaintModal').style.display='none'">Cancel</button>
                <button type="submit" class="btn-primary">Add</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
