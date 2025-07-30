package controller;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.User;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setUsername(username);
        user.setPassword(password);
        user.setRole(role);

        UserDAO dao = new UserDAO();

        if (dao.isEmailOrUsernameExists(email, username)) {
            request.setAttribute("error", "Email or Username already exists!");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        } else {
            boolean success = dao.registerUser(user);
            if (success) {
                response.sendRedirect("login.jsp?msg=Registration successful");
            } else {
                request.setAttribute("error", "Registration failed due to server error.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        }
    }
}
