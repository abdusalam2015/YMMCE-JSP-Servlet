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
        <link rel="stylesheet" href="css/client.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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
        <style>
            th{
                font-family: serif;
                font-size: 19px;
            }
        </style>
    </head>
</head>
<body>
    <%

        String clientName = "";
        String arrivingDate = "";
        String medicalReport = "";
        String medicalReport_2 = "";
        String medical_report_details = "";
        String clientStatuse = "";
        String passportNum = "";
        String ticketNum = "";
        String departureDate = "";
        String notes = "";
        String helperName = "";
        String bookingDate = "";
        String mandoop = "";
        String phoneNum = "";
        String address = "";
    %>
    <div id="wrapper">
        <div id="header">
            <div class="client2">
                <a href="logout"> <button>تسجيل الخروج  </button> </a>
                <%
                    try{
                    HashMap<String, String> userData = (HashMap<String, String>) session.getAttribute("userData");
                    ArrayList<HashMap<String, String>> allData = (ArrayList<HashMap<String, String>>) session.getAttribute("allData");
                    session.setAttribute("allData", allData);
                %>
                <t>  <%=userData.get("name")%><i class="fa fa-address-book" style="font-size:30px"></i></t>
                <p> اللــــــجــنة الطـبيـــة </p>
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
                        <a class="js-nav-item" href="#">عرض  البيانات  </a>
                    </li>
                    <li class="nav-bar__item">
                        <a class="js-nav-item" href="report">عرض التقرير  </a>
                    </li>
                    <li class="nav-bar__item">
                        <a class="js-nav-item" href="clientPage">التقرير الفني  </a>
                    </li>
                    <li class="nav-bar__item">
                        <a class="js-nav-item" href="home">الصفحة الرئيسية  </a>
                    </li>
                </ul>
            </div>
        </div> 

        <div class="tab" style="margin-top: 10px;"> 
            <button type="button"  id="myBtn" style="background-color: #00cccc;">تعديل</button>

            <!--need this table in the middle of the page and all the data is near from each other-->
            <table  border="1" style="table-layout: fixed; text-align:center;width: 80%;margin-left: 10%;" >
                <%
                    if (allData != null) {
                        int i = 0;
                        clientName = allData.get(i).get("client.name");
                        arrivingDate = allData.get(i).get("arrivingDate");
                        medicalReport = allData.get(i).get("medicalReport");
                        medicalReport_2 = allData.get(i).get("medicalReport_2");
                        medical_report_details = allData.get(i).get("medical_report_details");
                        clientStatuse = allData.get(i).get("clientStatuse");
                        passportNum = allData.get(i).get("passportNum");
                        ticketNum = allData.get(i).get("ticketNum");
                        departureDate = allData.get(i).get("departureDare");
                        notes = allData.get(i).get("notes");
                        bookingDate = allData.get(i).get("bookingDate");
                        helperName = allData.get(i).get("helperName");
                        mandoop = allData.get(i).get("helperName");
                        address = allData.get(i).get("client.address");
                        phoneNum = allData.get(i).get("phoneNum");
                %> 
                <tr>
                    <th><%=clientName%></th>
                    <th style="width: 180px;">الاســــــــم  </th>
                </tr>
                <tr>
                    <th><%=helperName%></th>
                    <th style="width: 180px;">اسم المرافق  </th>
                </tr>
                <tr>
                    <th><%=mandoop%></th>
                    <th style="width: 180px;">اسم المندوب  </th>
                </tr>
                <tr>
                    <th><%=arrivingDate%></th>
                    <th>تاريخ الوصول  </th>
                </tr>
                <tr>
                    <th style="word-wrap:break-word;text-align:center;white-space: initial;"><%=medicalReport%></th>
                    <th>الإصابةالأساسية   </th>
                </tr>
                <tr>
                    <th style="word-wrap:break-word;text-align:center;white-space: initial;"><%=medicalReport_2%></th>
                    <th>الإصابة الثانوية   </th>
                </tr>
                <tr>
                    <th style="word-wrap:break-word;text-align:center;white-space: initial;"><%=phoneNum%></th>
                    <th>رقم الهاتف   </th>
                </tr>
                <tr>
                    <th style="word-wrap:break-word;text-align:center;white-space: initial;"><%=address%></th>
                    <th>السكن   </th>
                </tr>
                <tr>
                    <th style="word-wrap:break-word;text-align:center;white-space: initial;"><%=medical_report_details%></th>
                    <th>التقرير الطبي   </th>
                </tr>
                <tr>
                    <th style="word-wrap:break-word;text-align:center;white-space: initial;"><%=clientStatuse%></th>
                    <th>حالة الجريح   </th>
                </tr>
                <tr>
                    <th><%=passportNum%></th>
                    <th>رقم الجواز </th>
                </tr>
                <tr>
                    <th><%=ticketNum%></th>
                    <th>رقم التذكرة </th>
                </tr>
                <tr>
                    <th><%=bookingDate%></th>
                    <th>تاريخ الحجز </th>
                </tr>
                <tr>
                    <th><%=departureDate%></th>
                    <th>تاريخ السفر </th>
                </tr>
                <tr>
                    <th><%=notes%></th>
                    <th>ملاحظات </th>
                </tr>
                <%
                    } else {
                        System.out.println("The map is Empty empty");
                    }
                %> 
            </table>
        </div>
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <div class="modal-header">
                    <div class="modal-body">
                        <form method="POST" action="addServ" style="direction: rtl;">
                            <p> <label class="w3-text-brown"><b>الاسم</b></label>
                                <input type="text" name="clientName" required="" value="<%=clientName%>" placeholder="الاسم"></p>
                            <p> <label class="w3-text-brown"><b>اسم المرافق</b></label>
                                <input type="text" name="helperName" required="" value="<%=helperName%>" placeholder="اسم المرافق"></p>
                            <p> <label class="w3-text-brown"><b>اسم المندوب</b></label>
                                <input type="text" name="mandoop" required="" value="<%=mandoop%>" placeholder="اسم المندوب"></p>
                            <p> <label class="w3-text-brown"><b>تاريخ  الوصول</b></label>
                                <input type="text" name="arrivingDate" required="" value="<%=arrivingDate%>" placeholder="تاريخ الوصول"> </p>
                            <p> <label class="w3-text-brown"><b>الإصابة الأساسية</b></label>
                                <input type="text" name="medicalReport" required="" value="<%=medicalReport%>" placeholder="التقرير الطبي"></p>
                            <p> <label class="w3-text-brown"><b>رقم الهاتف </b></label>
                                <input type="text" name="phoneNum" required="" value="<%=phoneNum%>" placeholder="حالة الجريح"></p>
                            <p> <label class="w3-text-brown"><b>العنوان </b></label>
                                <input type="text" name="address" required="" value="<%=address%>" placeholder="حالة الجريح"></p>
                            <p> <label class="w3-text-brown"><b>الإصابة الثانوية</b></label>
                                <textarea name="medicalReport__2" required="" value="<%=notes%>" placeholder="الإصابة الثانوية"><%=medicalReport_2%> </textarea></p>
                            <p> <label class="w3-text-brown"><b>التقرير الطبي</b></label>
                                <textarea name="medical_report_details" required="" placeholder="التقرير الطبي التفصيلي"><%=medical_report_details%> </textarea></p>
                            <p> <label class="w3-text-brown"><b>حالة الجريح </b></label>
                                <input type="text" name="clientStatuse" required="" value="<%=clientStatuse%>" placeholder="حالة الجريح"></p>
                            <p> <label class="w3-text-brown"><b>رقم الجواز</b></label>
                                <input type="text" name="passportNum" required="" value="<%=passportNum%>" placeholder="رقم الجواز"></p>
                            <p> <label class="w3-text-brown"><b>رقم التذكرة</b></label>
                                <input type="text" name="ticketNum" required="" value="<%=ticketNum%>" placeholder="رقم التذكرة"></p>
                            <p> <label class="w3-text-brown"><b>تاريخ الحجز</b></label>
                                <input type="text" name="departureDate" required="" value="<%=bookingDate%>" placeholder="تاريخ الحجز"></p>
                            <p> <label class="w3-text-brown"><b>تاريخ السفر</b></label>
                                <input type="text" name="departureDate" required="" value="<%=departureDate%>" placeholder="تاريخ السفر"></p>
                            <p> <label class="w3-text-brown"><b>ملاحظات</b></label>
                                <textarea name="notes" required="" value="" placeholder="ملاحضات"> <%=notes%></textarea></p>
                            <input name="submit" type="submit" value="تعــديــل">
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
        <div id="footer">
            <p>
                <b>Phone:</b><span> +201009629466</span><br>
                <b>Email:</b><span> abdussalam@ymmce.com</span>
            </p>
        </div>
    </div>
            <%} catch (Exception e) {
        %><p> خطأ في الصفحة  </p><%
    }%>                  
</body>
</html>