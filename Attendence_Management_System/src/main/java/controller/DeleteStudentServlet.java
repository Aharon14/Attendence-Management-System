package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));

        UserDAO dao = new UserDAO();
        boolean deleted = dao.deleteUserById(id);

        if (deleted) {
            response.sendRedirect("view_students.jsp");
        } else {
            request.setAttribute("error", "Unable to delete student.");
            request.getRequestDispatcher("view_students.jsp").forward(request, response);
        }
    }
}
