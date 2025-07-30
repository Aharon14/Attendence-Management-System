<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, model.User, dao.UserDAO" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null || !"teacher".equals(user.getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }

    UserDAO dao = new UserDAO();
    List<User> students = dao.getAllStudents();
%>

<!DOCTYPE html>
<html>
<head>
    <title>All Students</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f3f7f0;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 850px;
            margin: 60px auto;
            background-color: #ffffff;
            padding: 35px;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
        }

        h3 {
            color: #2e2e2e;
            text-align: center;
            margin-bottom: 30px;
            font-size: 24px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            background-color: #fcfcfc;
        }

        th, td {
            padding: 15px 12px;
            text-align: center;
            font-size: 16px;
        }

        th {
            background-color: #dcedc8; /* pastel green */
            color: #2d2d2d;
        }

        tr:nth-child(even) {
            background-color: #f1f8e9;
        }

        tr:hover {
            background-color: #e6f4ea;
        }

        .btn-danger {
            background-color: #f48fb1; /* pastel pink */
            border: none;
            padding: 8px 16px;
            border-radius: 8px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn-danger:hover {
            background-color: #f06292;
        }
    </style>
</head>
<body>
<%@ include file="navbar.jsp" %>

<div class="container">
    <h3>All Registered Students</h3>
    <table>
        <thead>
            <tr>
                <th style="width: 20%;">ID</th>
                <th style="width: 50%;">Name</th>
                <th style="width: 30%;">Action</th>
            </tr>
        </thead>
        <tbody>
        <% for (User u : students) { %>
            <tr>
                <td><%= u.getId() %></td>
                <td><%= u.getName() %></td>
                <td>
                    <a href="DeleteStudent?id=<%= u.getId() %>" 
                       class="btn-danger" 
                       onclick="return confirm('Are you sure you want to delete this student?')">Delete</a>
                </td>
            </tr>
        <% } %>
        </tbody>
    </table>
</div>

</body>
</html>
