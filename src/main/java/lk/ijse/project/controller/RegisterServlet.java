package lk.ijse.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.project.model.dao.UserDAO;
import lk.ijse.project.model.Entity.User;

import java.io.IOException;
import java.util.UUID;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");
        String id = UUID.randomUUID().toString();

        User user = new User(id,name, email, password, role);

        UserDAO userDAO = new UserDAO(getServletContext());
        boolean success = userDAO.createUser(user);

        if (success) {
            resp.sendRedirect("LoginPage.jsp?register=success");
            System.out.println("Registered Successfully");
        } else {
            resp.sendRedirect("LoginPage.jsp?error=true");
        }
    }
}
