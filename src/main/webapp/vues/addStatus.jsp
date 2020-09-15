<%--
  Created by IntelliJ IDEA.
  User: oussama
  Date: 17/04/2020
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<%
    if (session.getAttribute("user") == null){
        response.sendRedirect("/login");
    }
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>MiageBook</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=ABeeZee">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Catamaran:100,200,300,400,500,600,700,800,900">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Muli">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Playfair+Display:400,700">
    <link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/ionicons.min.css">
    <link rel="stylesheet" href="assets/css/styles.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.min.css">
</head>

<body>
<nav class="navbar navbar-light navbar-expand-md navigation-clean-button">
    <div class="container"><a class="navbar-brand" href="#">MIAGEBOOK</a>
        <button data-toggle="collapse" class="navbar-toggler" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span
                class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse"
             id="navcol-1">
            <ul class="nav navbar-nav mr-auto">
                <li class="nav-item" role="presentation"><a class="nav-link" href="./listUsers">Users List</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="./feed">Feed</a></li>
                <li class="nav-item" role="presentation"><a class="nav-link" href="./recentStatus">Recent Status</a></li>
            </ul>
            <span class="navbar-text actions"> <a class="login" href="./profile">My profile</a>
                <a class="btn btn-light action-button" role="button" href="./logout">Logout</a>
            </span>
        </div>
    </div>
</nav>
<div class="contact-clean">
    <form action="addStatus" method="post">
        <h2 class="text-center">Ajouter une Status</h2>
        <div class="form-group"><input class="form-control" type="text" name="title" placeholder="Status Title"></div>
        <div class="form-group"><textarea class="form-control" name="text" placeholder="Status Text" rows="14"></textarea></div>
        <div class="form-group"><button class="btn btn-primary" type="submit" value="addStatus" name="action">Publish</button></div>
    </form>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script src="assets/js/script.min.js"></script>
</body>

</html>