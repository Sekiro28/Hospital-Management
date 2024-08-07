package hosppackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/NurseProfileServlet")
public class NurseProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("Button1");
            String nurseId = request.getParameter("t1");
            String nurseName = request.getParameter("t2");
            String nurseEdu = request.getParameter("t3");
            String dob = request.getParameter("t4");
            String salary = request.getParameter("t5");
            String fatherName = request.getParameter("t6");
            String deptId = request.getParameter("t7");

            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                try (Connection c = DriverManager.getConnection("jdbc:odbc:abc", "root", "data")) {
                    switch (action) {
                        case "ADD NURSE PROFILE":
                            addNurseProfile(c, nurseId, nurseName, nurseEdu, dob, salary, fatherName, deptId, out);
                            break;
                        case "SEARCH NURSE PROFILE":
                            searchNurseProfile(c, nurseId, request, response);
                            break;
                        case "DELETE NURSE PROFILE":
                            deleteNurseProfile(c, nurseId, out);
                            break;
                        case "EDIT NURSE PROFILE":
                            editNurseProfile(c, nurseId, nurseName, nurseEdu, dob, salary, fatherName, deptId, out);
                            break;
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(out);
                out.println("Operation failed: " + e.getMessage());
            }
        }
    }

    private void addNurseProfile(Connection c, String nurseId, String nurseName, String nurseEdu, String dob, String salary, String fatherName, String deptId, PrintWriter out) throws SQLException {
        if (nurseId.isEmpty() || nurseName.isEmpty() || nurseEdu.isEmpty() || dob.isEmpty() || salary.isEmpty() || fatherName.isEmpty() || deptId.isEmpty()) {
            out.println("<script>alert('ENTER COMPLETE DETAILS..!!!');</script>");
            return;
        }

        String sql = "INSERT INTO nurse VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, nurseId);
            ps.setString(2, nurseName);
            ps.setString(3, nurseEdu);
            ps.setString(4, dob);
            ps.setString(5, salary);
            ps.setString(6, fatherName);
            ps.setString(7, deptId);
            ps.executeUpdate();
            out.println("<script>alert('INSERT SUCCESSFUL');</script>");
        }
    }

    private void searchNurseProfile(Connection c, String nurseId, HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        if (nurseId.isEmpty()) {
            request.setAttribute("error", "ENTER NURSE ID TO SEARCH..!!!");
            request.getRequestDispatcher("nurseProfile.jsp").forward(request, response);
            return;
        }

        String sql = "SELECT * FROM nurse WHERE nur_id = ?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, nurseId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                request.setAttribute("nurseId", rs.getString(1));
                request.setAttribute("nurseName", rs.getString(2));
                request.setAttribute("nurseEdu", rs.getString(3));
                request.setAttribute("dob", rs.getString(4));
                request.setAttribute("salary", rs.getString(5));
                request.setAttribute("fatherName", rs.getString(6));
                request.setAttribute("deptId", rs.getString(7));
                request.getRequestDispatcher("nurseProfile.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "NURSE ID " + nurseId + " does not exist in database..!!!");
                request.getRequestDispatcher("nurseProfile.jsp").forward(request, response);
            }
        }
    }

    private void deleteNurseProfile(Connection c, String nurseId, PrintWriter out) throws SQLException {
        if (nurseId.isEmpty()) {
            out.println("<script>alert('ENTER NURSE'S ID TO DELETE..!!!');</script>");
            return;
        }

        String sql = "DELETE FROM nurse WHERE nur_id = ?";
        try (PreparedStatement ps = c.prepareStatement(sql)) {
            ps.setString(1, nurseId);
            int rows = ps.executeUpdate();
            if (rows > 0) {
                out.println("<script>alert('PROFILE OF NURSE WITH ID " + nurseId + " DELETED');</script>");
            } else {
                out.println("<script>alert('INVALID NURSE ID " + nurseId + "..!!!');</script>");
            }
        }
    }

    private void editNurseProfile(Connection c, String nurseId, String nurseName, String nurseEdu, String dob, String salary, String fatherName, String deptId, PrintWriter out) throws SQLException {
        if (nurseId.isEmpty()) {
            out.println("<script>alert('ENTER NURSE'S ID TO EDIT..!!!');</script>");
            return;
        }

        String deleteSql = "DELETE FROM nurse WHERE nur_id = ?";
        try (PreparedStatement psDelete = c.prepareStatement(deleteSql)) {
            psDelete.setString(1, nurseId);
            int rows = psDelete.executeUpdate();
            if (rows > 0) {
                String insertSql = "INSERT INTO nurse VALUES (?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement psInsert = c.prepareStatement(insertSql)) {
                    psInsert.setString(1, nurseId);
                    psInsert.setString(2, nurseName);
                    psInsert.setString(3, nurseEdu);
                    psInsert.setString(4, dob);
                    psInsert.setString(5, salary);
                    psInsert.setString(6, fatherName);
                    psInsert.setString(7, deptId);
                    psInsert.executeUpdate();
                    out.println("<script>alert('PROFILE OF NURSE WITH ID " + nurseId + " EDITED');</script>");
                }
            } else {
                out.println("<script>alert('INVALID NURSE ID " + nurseId + "..!!!');</script>");
            }
        }
    }
}

