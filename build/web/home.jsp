<%-- 
    Document   : signin
    Created on : Dec 4, 2015, 10:39:58 AM
    Author     : abdussalam
--%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="java.util.List" %>
<%@ page import="Model.Model" %> 
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="css/style.css">
        <script language="Javascript" src="js/JScriptFile.js"></script>
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
        <link rel="stylesheet" media="all and (max-device-width: 480px) and (-webkit-min-device-pixel-ratio: 2)"    href="css/print.css"/>
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
        <script type="text/javascript" 
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script src="js/jquery.autocomplete.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>


</head>
<body>
    <div class="container" id="main">
        <div class="header">
            <section class="head">   
                <a href="logout"> <button>تسجيل الخروج  </button> </a>
                <%
                    HashMap<String, String> userData = (HashMap<String, String>) session.getAttribute("userData");
                    String msg = "";
                %>
                <t>  <%=userData.get("name")%><i class="fa fa-address-book" style="font-size:30px"></i></t>
                <p> اللــــــجــنة الطـبيـــة </p>
                <div id="search">
                    <form name="vinform" method="POST" action="checkServ">
                        <input type="text" id="t1" name="t1" placeholder="ابحث من هنا.." onkeyup="sendInfo()">
                        <button>بحث</button>
                        <span style="color:red">${message}</span>
                    </form>  
                </div>
            </section> 
            <script>
                $("#t1").autocomplete("getdata.jsp");
            </script>
        </div>
        <ul style="list-style-type:square;padding-right:90%;direction: rtl; background-color: #cccccc;">
            <li><a href="#">؟؟؟؟؟؟؟؟ </a></li>
            <li><a href="#">؟؟؟؟؟؟؟؟ </a></li>
            <li><a href="#"> ؟؟؟؟؟؟؟؟ </a></li>
            <li><a href="#">؟؟؟؟؟؟؟؟ </a></li>
            <li><a href="#">؟؟؟؟؟؟؟؟ </a></li>
        </ul>
        <div style=" background-color: #1b6d85;padding-left:50%;">
            <p style="">
                <b>Phone:</b><span> +201009629466</span><br>
                <b>Email:</b><span> abdussalam@ymmce.com</span>
            </p>
        </div>
    </div>

</body>
</html>