<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, model.User, model.Attendance, dao.AttendanceDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"student".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    AttendanceDAO dao = new AttendanceDAO();
    List<Attendance> attendanceList = dao.getAttendanceByStudentId(user.getId());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Attendance</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #fdf6f0;
            font-family: 'Segoe UI', sans-serif;
        }

        h3 {
            color: #4b6584;
            text-align: center;
            margin-bottom: 30px;
        }

        .container {
            background-color: #fff9f2;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0px 8px 16px rgba(0,0,0,0.05);
            margin-top: 40px;
        }

        table {
            border-radius: 8px;
            overflow: hidden;
        }

        th {
            background-color: #ffc2d1 !important;
            color: #3d3d3d;
        }

        td {
            background-color: #fff5f8;
        }

        .table th, .table td {
            vertical-align: middle;
            text-align: center;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container mt-5">
    <h3>Your Attendance Records</h3>
    <table class="table table-bordered table-striped mt-4">
        <thead>
            <tr>
                <th>Date</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
        <% for (Attendance a : attendanceList) { %>
            <tr>
                <td><%= a.getDate() %></td>
                <td>
                    <% if ("Present".equalsIgnoreCase(a.getStatus())) { %>
                        <span class="badge bg-success">Present</span>
                    <% } else { %>
                        <span class="badge bg-danger">Absent</span>
                    <% } %>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>
</body>
</html>
