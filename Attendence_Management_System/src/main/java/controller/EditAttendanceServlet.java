package controller;

import dao.AttendanceDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Attendance;

import java.io.IOException;

@WebServlet("/EditAttendance")
public class EditAttendanceServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        AttendanceDAO dao = new AttendanceDAO();
        Attendance att = dao.getAttendanceById(id);
        request.setAttribute("attendance", att);
        request.getRequestDispatcher("editAttendance.jsp").forward(request, response);
    }
}