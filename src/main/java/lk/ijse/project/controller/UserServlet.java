package lk.ijse.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.project.model.dao.UserDAO;
import lk.ijse.project.model.Entity.User;

import java.io.IOException;

@WebServlet("/register")
public class UserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");

        System.out.println(name + email + password + role);

        User user = new User(name, email, password, role);
        System.out.println(user);
        UserDAO userDAO = new UserDAO(getServletContext());
        boolean success = userDAO.createUser(user);

        if (success) {
            System.out.println("User successfully saved");
        } else {
            resp.sendRedirect("register.jsp?error=true");
        }
    }

}
