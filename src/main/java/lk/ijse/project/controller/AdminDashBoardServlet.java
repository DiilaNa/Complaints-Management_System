package lk.ijse.project.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lk.ijse.project.model.Entity.AllComplaints;
import lk.ijse.project.model.dao.ComplaintsDAO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;
import java.util.List;
@WebServlet("/adminDashboard")
public class AdminDashBoardServlet extends HttpServlet {

    private  ComplaintsDAO complaintsDAO;

    @Override
    public void init() throws ServletException {
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("ds");
        complaintsDAO = new ComplaintsDAO(ds);

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("role") != null && session.getAttribute("role").equals("admin")) {
            List<AllComplaints> complaintsList = complaintsDAO.getAll();
            request.setAttribute("complaintsList", complaintsList);
            request.getRequestDispatcher("/AdminDashBoard.jsp").forward(request, response);
        } else {
            response.sendRedirect("LoginPage.jsp");
        }
    }
}