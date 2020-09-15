<%--
  Created by IntelliJ IDEA.
  User: oussama
  Date: 17/04/2020
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

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

<body style="min-height: 100vh;">
<div class="login-dark" style="height: 100vh;">
    <form action="login" method="post">
        <h2 class="sr-only">Login Form</h2>
        <div class="illustration"><i class="icon ion-ios-locked-outline"></i></div>
        <div class="form-group"><input class="form-control" type="text" name="pseudo" placeholder="Pseudo"></div>
        <div class="form-group"><input class="form-control" type="password" name="password" placeholder="Password"></div>
        <div class="form-group"><div ><h8 style="color: red;text-align: center">${loginException}</h8></div></div>
        <div class="form-group">
                <button class="btn btn-primary btn-block" type="submit" value="login" name="action">Log In</button>
        </div>
        <a class="forgot" href="./subscribe" STYLE="color: #56c6c6">Voulez vous creer un compte ?</a></form>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script src="/assets/js/script.min.js"></script>
</body>

</html>
