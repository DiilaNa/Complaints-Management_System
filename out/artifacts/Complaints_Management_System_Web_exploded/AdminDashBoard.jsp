<%@ page import="lk.ijse.project.model.Entity.AllComplaints" %>
<%@ page import="java.util.List" %><%--
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
    <link rel="stylesheet" href="css/AdminDashBoard.css">

</head>
<body>
<div class="container">
    <div class="header">
        <div class="header-content">
            <h1>Admin Dashboard</h1>
            <form  class="admin-badge" action="logout" method="post">
                <button id="signOUT" type="submit" class="sign-out-btn">Sign Out</button>
            </form>
        </div>
    </div>

    <%
        List<AllComplaints> complaints = (List<AllComplaints>) request.getAttribute("complaintsList");

        int total = 0, pending = 0, resolved = 0, rejected = 0;
        for (AllComplaints complaint : complaints) {
            total++;
            String status = complaint.getStatus();
            if ("pending".equalsIgnoreCase(status)) pending++;
            else if ("resolved".equalsIgnoreCase(status)) resolved++;
            else if ("rejected".equalsIgnoreCase(status)) rejected++;
        }
    %>
    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-number total"><%= total %></div>
            <div class="stat-label">Total Complaints</div>
        </div>
        <div class="stat-card">
            <div class="stat-number pending"><%= pending %></div>
            <div class="stat-label">Pending Review</div>
        </div>
        <div class="stat-card">
            <div class="stat-number resolved"><%= resolved %></div>
            <div class="stat-label">Resolved</div>
        </div>
        <div class="stat-card">
            <div class="stat-number rejected"><%= rejected %></div>
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
                    <%
                        for (AllComplaints complaint : complaints) {
                    %>
                    <tr data-id="<%= complaint.getId() %>" data-status="<%= complaint.getStatus() %>">
                        <td><%= complaint.getUserName() %></td>
                        <td><%= complaint.getSubject() %></td>
                        <td><%= complaint.getDescription() %></td>
                        <td><%= complaint.getDate() %></td>
                        <td>
                <span class="status-badge status-<%= complaint.getStatus() %>">
                    <%= complaint.getStatus().substring(0,1).toUpperCase() + complaint.getStatus().substring(1) %>
                </span>
                        </td>
                        <td class="action-buttons">
                            <%
                                String status = complaint.getStatus();
                                if ("pending".equalsIgnoreCase(status)) {
                            %>
                            <button class="action-btn btn-resolve" onclick="updateStatus('<%= complaint.getId() %>', 'resolved')">✅</button>
                            <button class="action-btn btn-reject" onclick="updateStatus('<%= complaint.getId() %>', 'rejected')">❌</button>
                            <%
                            } else {
                            %>
                            <button class="action-btn btn-reopen" onclick="updateStatus('<%= complaint.getId() %>', 'pending')">🔄</button>
                            <%
                                }
                            %>
                            <button class="action-btn btn-delete" onclick="deleteComplaint('<%= complaint.getId() %>')">🗑️</button>
                        </td>
                    </tr>
                    <%
                        }
                    %>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="javascript/AdminDashBoard.js"></script>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</body>
</html>