package hosppackage;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/as")
public class as extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public as() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests here
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            String roll = request.getParameter("roll");
            String str2 = request.getParameter("str2");

            try {
                Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
                try (Connection c = DriverManager.getConnection("jdbc:odbc:abc", "root", "root")) {
                    String sql = "INSERT INTO student (roll, str2) VALUES (?, ?)";
                    try (PreparedStatement ps = c.prepareStatement(sql)) {
                        ps.setString(1, roll);
                        ps.setString(2, str2);
                        ps.executeUpdate();
                        out.println("Insert Successful");
                    }
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace(out);
                out.println("Insert Failed");
            }
        }
    }
}
