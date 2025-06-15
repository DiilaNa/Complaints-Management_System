package lk.ijse.project.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lk.ijse.project.model.Entity.Complaints;
import lk.ijse.project.model.dao.ComplaintsDAO;
import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
@WebServlet("/getAllComplaints")
public class AdminDashBoardServlet extends HttpServlet {

    private  ComplaintsDAO complaintsDAO;

    @Override
    public void init() throws ServletException {
        BasicDataSource ds = (BasicDataSource) getServletContext().getAttribute("ds");
        complaintsDAO = new ComplaintsDAO(ds);

    }

    @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
            response.setContentType("application/json");
            List<Complaints> complaints = complaintsDAO.getAll();
            ObjectMapper mapper = new ObjectMapper();
            String json = mapper.writeValueAsString(complaints);

            PrintWriter out = response.getWriter();
            out.print(json);
            out.flush();
        }

}