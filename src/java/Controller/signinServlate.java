package Controller;

import Model.ConnectionDB;
import Model.Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = {"/signinServlate"})
public class signinServlate extends HttpServlet {

    public Model obj = new Model();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String uname = request.getParameter("username");
        String pass = request.getParameter("password");
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.connect();
        HashMap<String, String> userData = new HashMap<>();
        try {
            userData = obj.isValid(uname, pass, con);
        } catch (SQLException ex) {
            request.setAttribute("message", "الاسم او كلمة المرور غير صحيحة"); // Will be available as ${message}
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
        if (userData != null) {
            if (userData.get("user_name").equals(uname) && userData.get("password").equals(pass)) {
                HttpSession session = request.getSession();
                session.setAttribute("userData", userData);
                 request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "الاسم او كلمة المرور غير صحيحة"); // Will be available as ${message}
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("message", "الاسم او كلمة المرور غير صحيحة"); // Will be available as ${message}
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
