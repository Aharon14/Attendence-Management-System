<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dao.UserDAO, model.User, java.util.*" %>
<%@ page session="true" %>
<%@ include file="navbar.jsp" %>

<%
    User users = (User) session.getAttribute("user");
    if (users == null || !"teacher".equals(users.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO dao = new UserDAO();
    List<User> students = dao.getAllStudents();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Mark Attendance</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #fdf6f0;
        }
        .container {
            background: #fffaf3;
            max-width: 600px;
            margin: 60px auto;
            padding: 30px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            border-radius: 12px;
        }
        h3 {
            color: #2d2d2d;
            margin-bottom: 20px;
            text-align: center;
        }
        label {
            font-weight: bold;
            color: #4d4d4d;
        }
        .form-select, .btn {
            border-radius: 8px;
        }
        .btn-success {
            background-color: #a8d5ba;
            border: none;
            transition: 0.3s;
        }
        .btn-success:hover {
            background-color: #8ccaa1;
        }
    </style>
</head>
<body>

<div class="container">
    <h3>Mark Attendance</h3>
    <form action="MarkAttendance" method="post">
        <div class="mb-3">
            <label>Student</label>
            <select name="studentId" class="form-select">
                <% for(User s : students) { %>
                    <option value="<%= s.getId() %>"><%= s.getName() %></option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label>Status</label>
            <select name="status" class="form-select">
                <option value="Present">Present</option>
                <option value="Absent">Absent</option>
            </select>
        </div>
        <input type="submit" class="btn btn-success w-100" value="Mark Attendance">
    </form>
</div>

</body>
</html>
