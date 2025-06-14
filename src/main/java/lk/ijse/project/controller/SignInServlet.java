package lk.ijse.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.project.model.Entity.User;
import lk.ijse.project.model.dao.UserDAO;

import java.io.IOException;

@WebServlet("/signIn")
public class SignInServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        UserDAO userDAO = new UserDAO(getServletContext());
        User user = userDAO.authenticateUser(email, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);

            if ("admin".equals(user.getRole())) {
                resp.sendRedirect("admin-dashboard");

            } else {
                resp.sendRedirect("employee-dashboard");
            }
        } else {
            req.setAttribute("error", "Invalid email or password");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
