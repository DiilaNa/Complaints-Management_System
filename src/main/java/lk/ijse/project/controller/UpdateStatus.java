package lk.ijse.project.controller;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.project.model.dao.ComplaintsDAO;
import org.apache.commons.dbcp2.BasicDataSource;

import java.io.IOException;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {
    private ComplaintsDAO complaintsDAO;

    @Override
    public void init(){
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("ds");
        complaintsDAO = new ComplaintsDAO(ds);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        String status = request.getParameter("status");

        boolean updated = complaintsDAO.updateStatus(id, status);
        response.setContentType("text/plain");
        response.getWriter().write(updated ? "success" : "fail");
    }
}
