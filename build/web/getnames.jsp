<%-- 
    Document   : jspajax.jsp
    Created on : Oct 20, 2017, 10:35:46 PM
    Author     : ESC
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Model.ConnectionDB"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%> 
<!DOCTYPE html>
<html>

    <body>
        <%

            request.setCharacterEncoding("UTF-8");
            String name = request.getParameter("val");
            if (name == null || name.trim().equals("")) {
                out.print("<div style=\"color:red\">" + " <b dir='rtl'> لايوجد اسم !</b> " + "</div> ");
            } else {
                // out.print(name);
                try {

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        %>  
    </body>
</html>
