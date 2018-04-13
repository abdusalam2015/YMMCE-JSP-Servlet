<%-- 
    Document   : newjsp
    Created on : Oct 18, 2017, 8:56:05 PM
    Author     : ESC
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <title>تسجيل الدخول</title>
        <link rel="stylesheet" href="css/style.css">
        <script language="Javascript" src="js/JScriptFile.js"></script>
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700,400italic,700italic" rel="stylesheet" type="text/css">
        <link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.2.1.min.js"></script>
    </head>
    <body id="body" >
        <div id="text" class="byline">
            <h1  calss="star"> <span>اللجنة الطبية </span></h1>
        </div>
        <div id='login-form' class="form" >
            <form action="registration" method='POST' name="form1">
                <input type="text" dir="rtl" placeholder="الاسم الكامل" name="name" required >
                <input type="text"  dir="rtl" placeholder="اسم المستخدم " name="username"  required>
                <div style="color:red;font-weight: bold;direction: rtl; ">${username}</div>
                <input type="email" dir="rtl" placeholder="الايميل" name="email" required>
                <input type="text" dir="rtl" placeholder="الوضيفة" name="job" required>
                <input type="password" dir="rtl" placeholder="كلمة المرور" name="password1" required>
                <div style="color:red; direction: rtl;font-weight: bold;">${password}</div>
                <input type="password" dir="rtl" placeholder="إعادة كلمة المرور" name="password2" required>
                <div style="color:red; direction: rtl;font-weight: bold;">${password}</div>
                <button type='submit' >تسجـيل</button>
                <div style="color:red ;direction: rtl;font-weight: bold;">${message}</div>
            </form>
        </div>
    </body>
</html>
