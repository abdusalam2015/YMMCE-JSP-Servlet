<%-- 
    Document   : getdata
    Created on : Oct 21, 2017, 3:05:19 AM
    Author     : ESC
--%>
<%@page import="java.io.PrintWriter"%>
<%@page import="Model.Model"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<html>
    <body>
        <%
            Model db = new Model();
            request.setCharacterEncoding("UTF-8");
            String query = request.getParameter("q");
            List<String> names = db.getData(query);
            Iterator<String> iterator = names.iterator();
            while (iterator.hasNext()) {
                String name = (String) iterator.next();
                out.println(name);
            }
        %>
    </body>
</html>
