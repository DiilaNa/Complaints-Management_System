<%--
  Created by IntelliJ IDEA.
  User: liyan
  Date: 6/13/2025
  Time: 8:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin DashBoard</title>
</head>
<body>
<div class="container">
    <div class="header">
        <div class="header-content">
            <h1>Admin Dashboard</h1>
            <div class="admin-badge">
                <span>👨‍💼</span>
                <span>Administrator</span>
            </div>
        </div>
    </div>
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-number total">247</div>
            <div class="stat-label">Total Complaints</div>
        </div>
        <div class="stat-card">
            <div class="stat-number pending">42</div>
            <div class="stat-label">Pending Review</div>
        </div>
        <div class="stat-card">
            <div class="stat-number resolved">189</div>
            <div class="stat-label">Resolved</div>
        </div>
        <div class="stat-card">
            <div class="stat-number rejected">16</div>
            <div class="stat-label">Rejected</div>
        </div>
    </div>
    <div class="main-content">
        <div class="complaints-section">
            <div class="section-header">
                <h2 class="section-title">Complaint Management</h2>
                <div class="filter-tabs">
                    <div class="tab active" onclick="filterComplaints('all')">All</div>
                    <div class="tab" onclick="filterComplaints('pending')">Pending</div>
                    <div class="tab" onclick="filterComplaints('resolved')">Resolved</div>
                    <div class="tab" onclick="filterComplaints('rejected')">Rejected</div>
                </div>
            </div>

            <div class="table-container">
                <table class="complaints-table" id="complaintsTable">
                    <thead>
                    <tr>
                        <th>User</th>
                        <th>Subject</th>
                        <th>Description</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>
</html>