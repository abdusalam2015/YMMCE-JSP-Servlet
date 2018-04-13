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
            System.out.println("GG:" + name);
            if (name == null || name.trim().equals("")) {
                out.print("<div style=\"color:red\">" + " <b dir='rtl'> لايوجد اسم !</b> " + "</div> ");
            } else {
                try {
                    ConnectionDB conDB = new ConnectionDB();
                    Connection con = conDB.connect();
                    PreparedStatement ps = con.prepareStatement("select * from client where name='" + name + "'");
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        out.print("<table border=\"1\" dir=\"rtl\">\n"
                                + "                <tr>\n"
                                + "                    <th>اسم الجريح : " + name + " </th>\n"
                                + "                    \n"
                                + "                    <th>تاريخ الوصول:" + rs.getString("arriving date") + " </th>\n"
                                + "                    \n"
                                + "                </tr>\n"
                                + "                <tr>\n"
                                + "                 <td colspan=\"2\">" + rs.getString("report") + "</td>\n"
                                + "                 </tr>\n"
                                + "            </table>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        %>  
    </body>
</html>
