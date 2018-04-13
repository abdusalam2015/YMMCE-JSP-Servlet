/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.ConnectionDB;
import Model.Model;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ESC
 */
@WebServlet(name = "checkServ", urlPatterns = {"/checkServ"})
public class checkServ extends HttpServlet {

    public Model obj = new Model();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        String name = request.getParameter("t1");
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.connect();
        String ob = "";
        HashMap<String, String> userData = (HashMap<String, String>) request.getSession().getAttribute("userData");
        try {
            ob = obj.checkClient(name, con);
        } catch (SQLException ex) {
            request.setAttribute("message", "مشكلة في قاعدة البيانات"); // Will be available as ${message}
            request.getRequestDispatcher("home.jsp").forward(request, response);
        }
        ArrayList<HashMap<String, String>> allData = new ArrayList<>();
        if (ob.equals("false") || name.equals("")) {
            request.setAttribute("message", "الاسم غير موجود في قاعدة البيانات"); // Will be available as ${message}
            request.getRequestDispatcher("home.jsp").forward(request, response);
        } else {
            try {
                allData = obj.getAllData(ob);
            } catch (SQLException ex) {
                request.setAttribute("message", "مشكـلة في الحصول على معلومات "); // Will be available as ${message}
                request.getRequestDispatcher("home.jsp").forward(request, response);
            }
            request.getSession().setAttribute("allData", allData);
            request.getRequestDispatcher("clientPage.jsp").forward(request, response);
        }
    }

    @Override

    public String getServletInfo() {
        return "Short description";
    }
}
