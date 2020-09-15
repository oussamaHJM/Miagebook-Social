<%--
  Created by IntelliJ IDEA.
  User: oussama
  Date: 12/04/2020
  Time: 21:56
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

<body>
<div class="row register-form">
    <div class="col-md-8 offset-md-2">
        <form class="custom-form" action="subscribe" method="post">
            <h1>Register Form</h1>
            <div class="form-row form-group">
                <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Pseudo</label>
                </div>
                <div class="col-sm-6 input-column"><input class="form-control" type="text" name="pseudo"></div>
                <div ><h8 style="color: red">${subscribeException}</h8></div>
            </div>
            <div class="form-row form-group">
                <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Nom</label>
                </div>
                <div class="col-sm-6 input-column"><input class="form-control" type="text" name="nom"></div>
            </div>
            <div class="form-row form-group">
                <div class="col-sm-4 label-column"><label class="col-form-label" for="name-input-field">Prenom</label>
                </div>
                <div class="col-sm-6 input-column"><input class="form-control" type="text" name="prenom"></div>
            </div>
            <div class="form-row form-group">
                <div class="col-sm-4 label-column"><label class="col-form-label" for="email-input-field">Email </label></div>
                <div class="col-sm-6 input-column"><input class="form-control" type="email" name="email"></div>
            </div>
            <div class="form-row form-group">
                <div class="col-sm-4 label-column"><label class="col-form-label" for="pawssword-input-field">Password </label></div>
                <div class="col-sm-6 input-column"><input class="form-control" type="password" name="password"></div>
            </div>
            <button class="btn btn-light submit-button" type="submit" value="subscribe" name="action">Subscribe to the MiageBook</button>
        </form>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>

</html>