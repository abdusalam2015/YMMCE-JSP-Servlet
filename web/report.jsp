<%-- 
    Document   : signin
    Created on : Dec 4, 2015, 10:39:58 AM
    Author     : abdussalam
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.Model" %> 
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/report.css">

        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" 
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
    </head>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <div class="client2">

                <%
                    try {
                        HashMap<String, String> userData = (HashMap<String, String>) session.getAttribute("userData");
                        ArrayList<HashMap<String, String>> allData = null;
                        try {
                            allData = (ArrayList<HashMap<String, String>>) session.getAttribute("allData");
                        } catch (Exception ex) {
                            System.out.println("Map is null null null ");
                        }
                %>
                <p> بســـــم اللة الرحمـــن الرحيم </p>
                <div class="logo">
                    <img src="images/yem.jpg" alt="" width="140px" height="80px">
                </div>
            </div>
        </div>
        <div id="info">
            <b>التقرير الفني</b>
            <h1>الاســـم  :<%=allData.get(0).get("client.name")%></h1> 
            <span>تاريخ الوصول :<%=allData.get(0).get("arrivingDate")%></span>
            <p>الاصابه  :<%=allData.get(0).get("medical_report_details")%></p>
        </div>

        <div class="tab"> 

            <table  border="1" style="table-layout: fixed; text-align:center;" >
                <tr style="height: 30px;">

                    <th style="width: 120px;background-color: #8a6d3b;">ملاحضات</th>
                    <th style="background-color: #8a6d3b;">البيـــان</th>
                    <th style="width:120px; background-color: #8a6d3b;">التاريخ </th>
                    <th style="width:30px;background-color: #8a6d3b;">م </th>
                </tr>
                <div style="color:red">${message}</div>
                <%
                    if (allData != null) {
                        for (int i = 0; i < allData.size(); i++) {
                            String medicalAction = allData.get(i).get("medicalAction");
                            String user = allData.get(i).get("user.name");
                            String date = allData.get(i).get("date");
                            String dataID = allData.get(i).get("data.id");
                            String job = allData.get(i).get("job");
                %> 
                <tr style="text-align:center;">
                    <td style="text-align:center; "></td>
                    <td style="word-wrap:break-word;text-align:center;white-space: initial;" ><%=medicalAction%><br> </td>
                    <td style="text-align:center; "><%=date%></td>
                    <td style="background-color: #8a6d3b;text-align:center; "><%=i + 1%></td>
                </tr>
                <%}
                    } else {
                        System.out.println("The map is Empty empty");
                    }
                %> 
            </table>
        </div>
    </div>
    <%} catch (Exception e) {
    %><p> خطأ في الصفحة  </p><%
            }%>
</body>
</html>