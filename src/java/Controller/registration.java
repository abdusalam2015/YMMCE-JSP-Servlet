package Controller;

import Model.ConnectionDB;
import Model.Model;
import Model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author ESC
 */
@WebServlet(name = "registration", urlPatterns = {"/registration"})
public class registration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        User newUser = new User();
        System.out.println(request.getParameter("name") + " HHH");
        newUser.setName(request.getParameter("name"));
        newUser.setUserName(request.getParameter("username"));
        newUser.setJob(request.getParameter("job"));
        newUser.setEmail(request.getParameter("email"));
        String password = request.getParameter("password1");
        newUser.setPasswrd(password);
        if (!(request.getParameter("password1").equals(request.getParameter("password2")))) {
            request.setAttribute("password", "غير متطابقتين"); // Will be available as ${message}
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        } else if (password.length() < 8) {
            request.setAttribute("password", "كلمة المرور ضعيفة"); // Will be available as ${message}
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
        Model model = new Model();
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.connect();
        try {
            int isthere = model.checkValidation(newUser.getUserName(), con);
            if (isthere == 0) {
                request.setAttribute("username", "اسم المستخدم موجود"); // Will be available as ${message}
                request.getRequestDispatcher("registration.jsp").forward(request, response);
            }
            int isRegister = model.registerationFunciton(newUser, con);
            if (isRegister >= 1) {
                request.setAttribute("done", "تم التسجيل بنجاح"); // Will be available as ${message}
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "فشل في التسجيل"); // Will be available as ${message}
                request.getRequestDispatcher("registration.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            request.setAttribute("message", "وجود حروف غير مقبوله"); // Will be available as ${message}
            request.getRequestDispatcher("registration.jsp").forward(request, response);
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
