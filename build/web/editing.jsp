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
        <link rel="stylesheet" href="../css/client.css">
        <link rel="stylesheet" media="all and (max-device-width: 480px) and (-webkit-min-device-pixel-ratio: 2)"    href="css/print.css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    </head>
</head>
<body>
    <div id="main">
        <div class="header">
            <section class="client2">   
                <a href="../index.jsp"> <button>تسجيل الخروج  </button> </a>
                <%
                    HashMap<String, String> userData = (HashMap<String, String>) session.getAttribute("userData");
                    application.setAttribute("userData", userData);
                    session.setAttribute("userData", userData);
                    ArrayList<HashMap<String, String>> allData = null;
                    try {
                        allData = (ArrayList<HashMap<String, String>>) session.getAttribute("allData");
                        application.setAttribute("allData", allData);
                        session.setAttribute("allData", allData);
                    } catch (Exception ex) {
                        System.out.println("Map is null null null ");
                    }
                    String clientID = application.getAttribute("clientID").toString();
                    session.setAttribute("clientID", clientID);
                    application.setAttribute("clientID", clientID);
                    System.out.println("client ID = " + clientID);
                %>
                <t>  <%=userData.get("name")%><i class="fa fa-address-book" style="font-size:30px"></i></t>
                <p> اللــــــجــنة الطـبيـــة الــعســكريــة    ـ    مـــصــر </p>
            </section> 
        </div>
        <div  id="nav">
            <div class="navbar-header" id="bor">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#example">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
            </div>
            <div class="collapse navbar-collapse" id="example">
                <ul class="nav navbar-nav">
                    <li class="nav-bar__item"><a class="js-nav-item" href="View/showClientDetails.jsp" >عرض  البيانات  </a></li>
                    <li class="nav-bar__item"><a class="js-nav-item" href="View/report.jsp">التقرير النهائي</a></li>
                    <li class="nav-bar__item"><a class="js-nav-item" href="#" >التقرير الفني</a></li>
                    <li class="nav-bar__item"><a class="js-nav-item" href="View/home.jsp">الصفحة الرئيسية </a></li>	


                </ul>
            </div>
        </div>
        <div class="tab"> 
            Mobile: +201009629466 
            Email : abdussalam@ymmce.com
        </div>


</body>
</html>