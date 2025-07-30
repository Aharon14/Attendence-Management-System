<%@ page import="java.util.*, model.Attendance" %>
<%
    List<Attendance> list = (List<Attendance>) request.getAttribute("attendanceList");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Attendance Records</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #fefefe;
        }
        .container {
            background-color: #f9f5ff;
            border-radius: 15px;
            box-shadow: 0 0 10px rgba(0,0,0,0.05);
            padding: 30px;
            margin-top: 40px;
        }
        h2 {
            color: #6b5b95;
            margin-bottom: 25px;
            text-align: center;
        }
        table {
            background-color: #ffffff;
            border-radius: 10px;
            overflow: hidden;
        }
        th {
            background-color: #e0c3fc;
            color: #3d2c8d;
        }
        td {
            vertical-align: middle;
        }
        a.btn-edit {
            background-color: #b2f7ef;
            color: #00796b;
        }
        a.btn-delete {
            background-color: #ffcdd2;
            color: #c62828;
        }
        .btn i {
            margin-right: 4px;
        }
    </style>
</head>
<body>
    <jsp:include page="navbar.jsp" />

    <div class="container">
        <h2><i class="fa-solid fa-clipboard-check"></i> Manage Attendance Records</h2>

        <% if (list != null && !list.isEmpty()) { %>
            <div class="table-responsive">
                <table class="table table-bordered text-center align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Student ID</th>
                            <th>Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Attendance att : list) { %>
                            <tr>
                                <td><%= att.getId() %></td>
                                <td><%= att.getStudentId() %></td>
                                <td><%= att.getDate() %></td>
                                <td><%= att.getStatus() %></td>
                                <td>
                                    <a href="EditAttendance?id=<%= att.getId() %>" class="btn btn-sm btn-edit">
                                        <i class="fa-solid fa-pen-to-square"></i> Edit
                                    </a>
                                    <a href="DeleteAttendance?id=<%= att.getId() %>" 
                                       class="btn btn-sm btn-delete"
                                       onclick="return confirm('Are you sure to delete this record?');">
                                        <i class="fa-solid fa-trash"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <p class="text-center text-muted">No attendance records found.</p>
        <% } %>
    </div>
</body>
</html>
