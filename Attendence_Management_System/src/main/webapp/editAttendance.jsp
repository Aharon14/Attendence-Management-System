<%@ page import="model.Attendance" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Attendance att = (Attendance) request.getAttribute("attendance");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Attendance</title>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <style>
        body {
            background-color: #f9f5f0;
            font-family: 'Segoe UI', sans-serif;
        }

        .container {
            max-width: 600px;
            margin-top: 50px;
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
        }

        h2 {
            text-align: center;
            color: #343a40;
            margin-bottom: 25px;
        }

        label {
            font-weight: 500;
            margin-bottom: 5px;
            color: #495057;
        }

        .form-control,
        .form-select {
            border-radius: 8px;
        }

        .btn-primary {
            background-color: #6c63ff;
            border: none;
            border-radius: 8px;
            width: 100%;
        }

        .btn-primary:hover {
            background-color: #5848e5;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp" />

<div class="container">
    <h2>Edit Attendance</h2>

    <form action="UpdateAttendance" method="post">
        <input type="hidden" name="id" value="<%= att.getId() %>">

        <div class="mb-3">
            <label for="studentId" class="form-label">Student ID</label>
            <input type="number" id="studentId" name="studentId" class="form-control"
                   value="<%= att.getStudentId() %>" required>
        </div>

        <div class="mb-3">
            <label for="date" class="form-label">Date</label>
            <input type="date" id="date" name="date" class="form-control"
                   value="<%= new SimpleDateFormat("yyyy-MM-dd").format(att.getDate()) %>" required>
        </div>

        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select id="status" name="status" class="form-select" required>
                <option value="Present" <%= "Present".equals(att.getStatus()) ? "selected" : "" %>>Present</option>
                <option value="Absent" <%= "Absent".equals(att.getStatus()) ? "selected" : "" %>>Absent</option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">Update Attendance</button>
    </form>
</div>
</body>
</html>
