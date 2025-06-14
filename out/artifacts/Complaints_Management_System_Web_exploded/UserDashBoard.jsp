<%--
  Created by IntelliJ IDEA.
  User: liyan
  Date: 6/14/2025
  Time: 9:57 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <div class="stats">
        <div class="stat">
            <span id="totalComplaints">0</span>
            Total Complaints
        </div>
        <div class="stat">
            <span id="pendingComplaints">0</span>
            Pending
        </div>
    </div>

    <button class="add-btn" onclick="document.getElementById('complaintModal').style.display='flex'">
        + Add Complaint
    </button>

    <table>
        <thead>
        <tr>
            <th>#</th>
            <th>Topic</th>
            <th>Description</th>
            <th>Date</th>
            <th>Status</th>
        </tr>
        </thead>
        <tbody id="complaintTable">

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
