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
@WebServlet(name = "delete", urlPatterns = {"/delete"})
public class delete extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

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
        PrintWriter writer = response.getWriter();
        PrintWriter out = response.getWriter();
       // HttpSession session = request.getSession(true);
        request.setCharacterEncoding("UTF-8");
        String dataID = request.getParameter("dataID");
        String adderID = request.getParameter("adderID");
        HashMap<String, String> userData = (HashMap<String, String>) request.getSession().getAttribute("userData");
        ArrayList<HashMap<String, String>> allData = (ArrayList<HashMap<String, String>>) request.getSession().getAttribute("allData");
        String userID = userData.get("id");
        String clientID = allData.get(0).get("client.id");
        Model model = new Model();
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.connect();
        int isDeleted = 0;
        if (!(userID.equals(adderID))) {
            request.setAttribute("deleteRights", "نأسف لعدم وجود صلاحية  لحذف هذا العنصر "); // Will be available as ${message}
            request.getRequestDispatcher("clientPage.jsp").forward(request, response);
        } else {
            try {
                isDeleted = model.delete(con, dataID);
            } catch (SQLException ex) {
                request.setAttribute("message", "توجد مشكلة في الحذف "); // Will be available as ${message}
                request.getRequestDispatcher("clientPage.jsp").forward(request, response);
            }
            Model obj = new Model();
            try {
                if (allData != null) {
                    allData = obj.getAllData(clientID);
                } else {
                    request.setAttribute("message", "لاتوجد بيانات "); // Will be available as ${message}
                    request.getRequestDispatcher("clientPage.jsp").forward(request, response);
                }
            } catch (SQLException ex) {
                request.setAttribute("message", "لاتوجد بيانات "); // Will be available as ${message}
                request.getRequestDispatcher("clientPage.jsp").forward(request, response);
            }
            if (isDeleted >= 1) {
                request.setAttribute("delete", "تم حذف العنصر بنجاح"); // Will be available as ${message}
                request.getSession().setAttribute("allData", allData);
                request.getRequestDispatcher("clientPage.jsp").forward(request, response);
            } else {
                request.setAttribute("message", "هناك خطأ ما"); // Will be available as ${message}
                request.getRequestDispatcher("clientPage.jsp").forward(request, response);
            }
        }
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
