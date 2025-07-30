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

@WebServlet("/AttendanceList")
public class AttendanceListServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AttendanceDAO dao = new AttendanceDAO();
		List<Attendance> list = dao.getAllAttendance(); // you may need to write this
		request.setAttribute("attendanceList", list);
		request.getRequestDispatcher("attendanceList.jsp").forward(request, response);
	}
}
