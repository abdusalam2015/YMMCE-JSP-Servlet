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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/client.css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script type="text/javascript" 
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
    </head>
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <div class="client2">

                <a href="logout"> <button>تسجيل الخروج  </button> </a>
                <%
                    try {
                        HashMap<String, String> userData = (HashMap<String, String>) session.getAttribute("userData");
                        ArrayList<HashMap<String, String>> allData = (ArrayList<HashMap<String, String>>) session.getAttribute("allData");
                        String clientID = allData.get(0).get("client.id");
                        String userID = userData.get("id");

                %>
                <t>  <%=userData.get("name")%><i class="fa fa-address-book" style="font-size:30px"></i></t>
                <p> اللــــــجــنة  الطبيـــــة       </p>
                <% if (allData != null) {
                        if (allData.size() != 0) {
                %>
                <h1>:الاســــم  </h1><h1><%=allData.get(0).get("client.name")%></h1>
                <%}
                    }

                %> 

            </div>
        </div>

        <div  id="nav" class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#example" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div id="example" class="collapse navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="nav-bar__item">                          
                        <a class="js-nav-item" href="showClientDetails">عرض  البيانات  </a>
                    </li>
                    <li class="nav-bar__item">
                        <a class="js-nav-item" href="report">عرض التقرير  </a>
                    </li>
                    <li class="nav-bar__item">

                        <a class="js-nav-item">التقرير الفني  </a>

                    </li>
                    <li class="nav-bar__item">
                        <a class="js-nav-item" href="home">الصفحة الرئيسية  </a>
                    </li>
                </ul>
            </div>
        </div> 
        <div class="tab"> 
            <button type="button"  id="myBtn" style="background-color: #00cccc;">اضافة</button>
            <table  border="1" style="table-layout: fixed; text-align:center;" >
                <tr style="height: 30px;">
                    <th style="width: 70px;background-color: #8a6d3b;"></th>
                    <th style="width: 120px;background-color: #8a6d3b;">المندوب</th>
                    <th style="background-color: #8a6d3b;">البيـــان</th>
                    <th style="width:120px; background-color: #8a6d3b;">التاريخ </th>
                    <th style="width:30px;background-color: #8a6d3b;">م </th>
                </tr>
                <div style="color:red;">${message}</div>
                <div style="color:#5cb85c;">${added}</div>
                <div style="color: #255625;">${delete}</div>
                <div style="color: red;">${deleteRights}</div>
                <%                    if (allData != null) {
                        for (int i = 0; i < allData.size(); i++) {
                            String medicalAction = allData.get(i).get("medicalAction");
                            String user = allData.get(i).get("user.name");
                            String date = allData.get(i).get("date");
                            String dataID = allData.get(i).get("data.id");
                            String job = allData.get(i).get("job");
                            String adderID = allData.get(i).get("user.id");
                %> 
                <tr style="text-align:center;">
                    <td style="background-color: #8a6d3b;text-align:center;">
                        <form action="delete" method="POST">
                            <input type="text" hidden="" name="dataID" value="<%=dataID%>"/> 
                            <input type="text" hidden="" name="adderID" value="<%=adderID%>"/> 
                            <button>حذف</button>
                        </form>
                    </td>
                    <td style="text-align:center;font-size: 10px; "><%=user%> - <%=job%></td>
                    <td style="word-wrap:break-word;text-align:center;white-space: initial;" ><%=medicalAction%><br> </td>
                    <td style="text-align:center;"><%=date%></td>
                    <td style="background-color: #8a6d3b;text-align:center; "><%=i + 1%></td>
                </tr>
                <%}
                    } else {
                        System.out.println("The map is Empty empty");
                    }

                %> 
            </table>
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog">
                    <!-- Modal content-->
                    <div class="modal-header">
                        <div class="modal-body">
                            <form method="POST" action="addServ" >
                                <input type="text" name="check" hidden="" value="yes">
                                <input type="date" name="date" required="">
                                <textarea name="desc" required=""></textarea>
                                <%session.removeAttribute("recordInsertedSuccessfully");%>
                                <input name="submit" type="submit" value="إضافة">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                $(document).ready(function() {
                    $("#myBtn").click(function() {
                        $("#myModal").modal();
                    });
                });
            </script>
        </div>

        <div id="footer">
            <p>
                <b>Phone:</b><span>+201009629466</span><br>
                <b>Email:</b><span> abdussalam@ymmce.com</span>
            </p>
        </div>
    </div>

    <%} catch (Exception e) {
    %><p> خطأ في الصفحة  </p><%
        }%>
</body>
</html>