package lk.ijse.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.project.model.Entity.Complaints;
import lk.ijse.project.model.dao.ComplaintsDAO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.util.List;

@WebServlet("/userDashboard")
public class UserDashBoardServlet extends HttpServlet {
    private ComplaintsDAO complaintsDAO;
    @Override
    public void init() throws ServletException {
        BasicDataSource dataSource = (BasicDataSource) getServletContext().getAttribute("ds");
        complaintsDAO = new ComplaintsDAO(dataSource);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String subject = req.getParameter("subject");
        String description = req.getParameter("description");
        HttpSession session = req.getSession(false);
        String userId = (String) session.getAttribute("userID");

        if (subject == null || subject.isBlank() || userId == null) {
            req.setAttribute("error", "Subject or User ID is missing.");
            req.getRequestDispatcher("/complaint-form.jsp").forward(req, resp);
            return;
        }

        Complaints complaint = new Complaints();
        complaint.setSubject(subject);
        complaint.setDescription(description);
        complaint.setUserId(userId);

        boolean result = complaintsDAO.addComplaint(complaint);
        if (result) {
            resp.sendRedirect("userDashboard");
        } else {
            req.setAttribute("error", "Failed to submit complaint. Try again.");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session != null && session.getAttribute("userID") != null) {
            String userId = (String) session.getAttribute("userID");
            List<Complaints> complaintsList = complaintsDAO.getComplaintsByUserId(userId);
            req.setAttribute("complaintsList", complaintsList);
            req.getRequestDispatcher("/UserDashBoard.jsp").forward(req, resp);
        } else {
            resp.sendRedirect("loginPage.jsp");
        }
    }
}
