package controller;

import dao.AttendanceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Attendance;

import java.io.IOException;
import java.sql.Date;

@WebServlet("/UpdateAttendance")
public class UpdateAttendanceServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String date = request.getParameter("date");
        String status = request.getParameter("status");

        Attendance att = new Attendance();
        att.setId(id);
        att.setStudentId(studentId);
        att.setDate(Date.valueOf(date));
        att.setStatus(status);

        AttendanceDAO dao = new AttendanceDAO();
        dao.updateAttendance(att);
        response.sendRedirect("AttendanceList");
    }
}

