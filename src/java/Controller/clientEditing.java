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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(name = "clientEditing", urlPatterns = {"/clientEditing"})
public class clientEditing extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        PrintWriter out = response.getWriter();
        HashMap<String, String> clientData = (HashMap<String, String>) request.getServletContext().getAttribute("clientData");
        if (clientData == null) {
            request.setAttribute("message", "لايوجد أي إجراء طبي "); // Will be available as ${message}
            request.getRequestDispatcher("editing.jsp").forward(request, response);
        }
        HashMap<String, String> editData = new HashMap<>();
        request.setCharacterEncoding("UTF-8");
        System.out.println("BEFORE");
        editData.put("name", request.getParameter("newName"));
        System.out.println("AFTER");
        editData.put("medicalReport", request.getParameter("new_medicalReport"));
        editData.put("arrivingDate", request.getParameter("newArrivingDate"));
        editData.put("medical_report_details", request.getParameter("new_medical_report_details"));
        Model obj = new Model();
        ConnectionDB conDB = new ConnectionDB();
        Connection con = conDB.connect();
        int t = 0;
       
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(clientEditing.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
