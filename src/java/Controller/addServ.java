package Controller;

import Model.ConnectionDB;
import Model.Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name = "addServ", urlPatterns = {"/addServ"})
public class addServ extends HttpServlet {

    Model obj = new Model();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        try (PrintWriter out = response.getWriter()) {

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/xml");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter writer = response.getWriter();
        PrintWriter out = response.getWriter();
        String date = request.getParameter("date");
        String medicalAction = request.getParameter("desc");
        request.getSession().setAttribute("curInsert",  date+medicalAction);
        HashMap<String, String> userData = (HashMap<String, String>) request.getSession().getAttribute("userData");
        ArrayList<HashMap<String, String>> allData = (ArrayList<HashMap<String, String>>) request.getSession().getAttribute("allData");
        String clientID = allData.get(0).get("client.id");
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.connect();
        int t = 0;
        System.out.println("curSes:-" +request.getSession().getAttribute("curInsert")+" : "+request.getSession().getAttribute("lastInsert"));
        try {
            if (!(request.getSession().getAttribute("curInsert").equals(request.getSession().getAttribute("lastInsert")))) {
                t = obj.addClient(con, userData.get("id"), medicalAction, date, clientID);
                request.getSession().setAttribute("lastInsert",  date+medicalAction);
                date = "";
                medicalAction = "";
                con.close();
                Model obj = new Model();
                try {
                    allData = obj.getAllData(clientID);
                } catch (SQLException ex) {
                    request.setAttribute("message", "لاتوجد بيانات ");
                    request.getRequestDispatcher("clientPage.jsp").forward(request, response);
                }
                if (t >= 0) {
                    request.getSession().setAttribute("allData", allData);
                    String ad = medicalAction + " تمت الإضافة بنجاح";
                    request.setAttribute("added", ad);
                    request.getRequestDispatcher("clientPage.jsp").forward(request, response);
                } else {
                    request.setAttribute("message", "هناك خطأ في قاعدة البيانات"); // Will be available as ${message}
                    request.getRequestDispatcher("clientPage.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("message", ""); // Will be available as ${message}
                request.getRequestDispatcher("clientPage.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            request.setAttribute("message", "فشل في الإضافة ");
            request.getRequestDispatcher("clientPage.jsp").forward(request, response);
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        chain.doFilter(request, response);
    }
}
