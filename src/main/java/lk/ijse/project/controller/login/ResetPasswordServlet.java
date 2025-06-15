package lk.ijse.project.controller.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.project.model.dao.UserDAO;

import java.io.IOException;
@WebServlet("/resetPassword")
public class ResetPasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String newPassword = req.getParameter("newPassword");
        String confirmPassword = req.getParameter("confirmPassword");

        if (!newPassword.equals(confirmPassword)) {
            resp.sendRedirect("forgot-password.jsp?error=nomatch");
            return;
        }

        try {
            UserDAO userDAO = new UserDAO(getServletContext());
            boolean success = userDAO.resetPassword(email, newPassword);
            if (success) {
                resp.sendRedirect("LoginPage.jsp?reset=success");
            } else {
                resp.sendRedirect("ChangePassword.jsp?error=notfound");
            }
        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("ChangePassword.jsp?error=server");
        }
    }
    }
}
