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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        UserDAO userDAO = new UserDAO(getServletContext());
        User user = userDAO.getUserIfExists(email, password, role);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userID" , user.getId());
            session.setAttribute("role", role);

            if ("admin".equals(role)) {
                resp.sendRedirect("adminDashboard");
            } else {
                resp.sendRedirect("userDashboard");
            }
        } else {
            resp.sendRedirect("LoginPage.jsp?failed=true");
        }
    }
}
