<%@ page import="model.User" %>
<%@ page session="true" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Attendance System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <style>
        body {
            background: #f6f8fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar {
            background-color: #b4c5e4 !important;
        }

        .navbar-brand, .navbar-text, .nav-link {
            color: #fff !important;
            font-weight: bold;
        }

        .container {
            max-width: 800px;
            margin-top: 60px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #2a4d69;
            margin-bottom: 30px;
            font-size: 28px;
        }

        .btn {
            width: 100%;
            margin-bottom: 15px;
            font-weight: 500;
            padding: 12px;
            border-radius: 12px;
        }

        .btn-success {
            background-color: #a0d995;
            border: none;
        }

        .btn-info {
            background-color: #95dbe1;
            border: none;
        }

        .btn-warning {
            background-color: #ffd59e;
            border: none;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .text-danger {
            font-size: 16px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Attendance System</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <span class="navbar-text me-3">
                        <i class="bi bi-person-circle"></i> Welcome, <%= user.getName().toUpperCase() %>
                    </span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><i class="bi bi-box-arrow-right"></i> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container text-center">
    <h1>Hello, <%= user.getName().toUpperCase() %>!</h1>

    <% if ("teacher".equals(user.getRole())) { %>
        <a href="mark_attendance.jsp" class="btn btn-success">
            <i class="bi bi-check2-square"></i> Mark Attendance
        </a>
        <a href="view_students.jsp" class="btn btn-info">
            <i class="bi bi-people"></i> View Students
        </a>
        <a href="AttendanceList" class="btn btn-warning">
            <i class="bi bi-list-ul"></i> Manage Attendance
        </a>
    <% } else if ("student".equals(user.getRole())) { %>
        <a href="viewAttendance.jsp" class="btn btn-info">
            <i class="bi bi-eye"></i> View My Attendance
        </a>
    <% } else { %>
        <p class="text-danger">Unknown role: <%= user.getRole() %></p>
    <% } %>
</div>

</body>
</html>
