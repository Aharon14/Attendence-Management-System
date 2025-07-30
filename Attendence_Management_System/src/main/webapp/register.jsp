<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" import="model.User" %>
<%
    User loggedInUser = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>

    <!-- Bootstrap & Google Fonts -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
        }

        .container {
            max-width: 600px;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
        }

        .form-label {
            font-weight: 500;
        }

        .text-danger {
            font-size: 0.875rem;
            margin-top: 4px;
        }

        .navbar-brand img {
            width: 45px;
            height: 45px;
            border-radius: 8px;
        }

        .nav-link:hover {
            color: #ffc107 !important;
        }

        .welcome-text {
            font-weight: 500;
        }
    </style>

    <script>
        function toggleStudentFields() {
            var role = document.getElementById("role").value;
            var studentFields = document.getElementById("studentFields");
            studentFields.style.display = (role === "student") ? "block" : "none";
        }

        function showError(id, message) {
            document.getElementById(id).textContent = message;
        }

        function clearErrors() {
            const errorFields = ["nameError", "emailError", "usernameError", "passwordError", "roleError", "rollNoError", "classNameError"];
            errorFields.forEach(id => document.getElementById(id).textContent = "");
        }

        function validateForm() {
            clearErrors();

            let isValid = true;

            const name = document.forms["registerForm"]["name"].value.trim();
            const email = document.forms["registerForm"]["email"].value.trim();
            const username = document.forms["registerForm"]["username"].value.trim();
            const password = document.forms["registerForm"]["password"].value;
            const role = document.forms["registerForm"]["role"].value;

            const emailPattern = /^[^@\s]+@[^@\s]+\.[^@\s]+$/;

            if (name === "") {
                showError("nameError", "Name is required.");
                isValid = false;
            }

            if (email === "") {
                showError("emailError", "Email is required.");
                isValid = false;
            } else if (!emailPattern.test(email)) {
                showError("emailError", "Please enter a valid email address.");
                isValid = false;
            }

            if (username === "") {
                showError("usernameError", "Username is required.");
                isValid = false;
            }

            if (password === "") {
                showError("passwordError", "Password is required.");
                isValid = false;
            } else if (password.length < 6) {
                showError("passwordError", "Password must be at least 6 characters.");
                isValid = false;
            }

            if (role === "") {
                showError("roleError", "Please select a role.");
                isValid = false;
            }

            if (role === "student") {
                const rollNo = document.forms["registerForm"]["roll_no"].value.trim();
                const className = document.forms["registerForm"]["class_name"].value.trim();

                if (rollNo === "") {
                    showError("rollNoError", "Roll No is required.");
                    isValid = false;
                }

                if (className === "") {
                    showError("classNameError", "Class Name is required.");
                    isValid = false;
                }
            }

            return isValid;
        }
    </script>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm mb-4">
    <div class="container-fluid">
        <a class="navbar-brand d-flex align-items-center" href="home.jsp">
            <img src="images/check.png" alt="Logo" class="me-2">
            Attendance System
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-center">
                <li class="nav-item">
                    <a class="nav-link" href="index.jsp">Home</a>
                </li>
                <% if (loggedInUser != null) { %>
                <li class="nav-item">
                    <span class="nav-link welcome-text">Welcome, <%= loggedInUser.getName() %></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet">Logout</a>
                </li>
                <% } else { %>
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="register.jsp">Register</a>
                </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Registration Form -->
<div class="container">
    <div class="card p-4">
        <h3 class="mb-4 text-center">User Registration</h3>
        <form name="registerForm" action="RegisterServlet" method="post" onsubmit="return validateForm()">
            <div class="mb-3">
                <label class="form-label">Name:</label>
                <input type="text" name="name" class="form-control" />
                <p id="nameError" class="text-danger"></p>
            </div>
            <div class="mb-3">
                <label class="form-label">Email:</label>
                <input type="email" name="email" class="form-control" />
                <p id="emailError" class="text-danger"></p>
            </div>
            <div class="mb-3">
                <label class="form-label">Username:</label>
                <input type="text" name="username" class="form-control" />
                <p id="usernameError" class="text-danger"></p>
            </div>
            <div class="mb-3">
                <label class="form-label">Password:</label>
                <input type="password" name="password" class="form-control" />
                <p id="passwordError" class="text-danger"></p>
            </div>
            <div class="mb-3">
                <label class="form-label">Role:</label>
                <select name="role" id="role" class="form-select" onchange="toggleStudentFields()">
                    <option value="">Select Role</option>
                    <option value="student">Student</option>
                    <option value="teacher">Teacher</option>
                </select>
                <p id="roleError" class="text-danger"></p>
            </div>

            <div id="studentFields" style="display:none;">
                <div class="mb-3">
                    <label class="form-label">Roll No:</label>
                    <input type="text" name="roll_no" class="form-control" />
                    <p id="rollNoError" class="text-danger"></p>
                </div>
                <div class="mb-3">
                    <label class="form-label">Class Name:</label>
                    <input type="text" name="class_name" class="form-control" />
                    <p id="classNameError" class="text-danger"></p>
                </div>
            </div>

            <div class="d-grid">
                <button type="submit" class="btn btn-primary">Register</button>
            </div>
        </form>

        <% if (request.getAttribute("error") != null) { %>
            <div class="alert alert-danger mt-3"><%= request.getAttribute("error") %></div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
