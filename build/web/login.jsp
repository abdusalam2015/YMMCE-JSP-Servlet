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

    <body id="body">
        <div id="text" class="byline">
            <h1  calss="star"> <span>اللجنة الطبية </span></h1>
        </div>
        <div id='login-form' class="form" >
            <form  action="signinServlate" method='POST'>
                <input type="text" placeholder="Username" required>
                <input type="email" placeholder="Email" required>
                <input type="password" placeholder="Password" required>
                <input type="password" placeholder="Re Password" required>
                <a href="index.jsp"><input type="button" value="تسجيل" ></a>
            </form>
        </div>
    </body>
</html>