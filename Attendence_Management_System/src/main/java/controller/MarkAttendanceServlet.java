package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Attendance;
import dao.AttendanceDAO;

import java.io.IOException;
import java.util.Date;

@WebServlet("/MarkAttendance")
public class MarkAttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String status = request.getParameter("status");

        Attendance att = new Attendance();
        att.setStudentId(studentId);
        att.setDate(new Date());
        att.setStatus(status);

        AttendanceDAO dao = new AttendanceDAO();
        boolean marked = dao.markAttendance(att);

        if (marked) {
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("error", "Attendance marking failed.");
            request.getRequestDispatcher("dashboard.jsp").forward(request, response);
        }
    }
}
