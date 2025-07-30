package controller;

import java.io.IOException;
import java.util.List;

import dao.AttendanceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Attendance;

@WebServlet("/ViewAttendance")
public class ViewAttendanceServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int studentId = Integer.parseInt(request.getParameter("studentId"));
		AttendanceDAO dao = new AttendanceDAO();
		List<Attendance> records = dao.getAttendanceByStudentId(studentId);

		request.setAttribute("attendanceList", records);
		request.getRequestDispatcher("viewAttendance.jsp").forward(request, response);
	}
}
