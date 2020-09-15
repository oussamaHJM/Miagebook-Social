<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: oussama
  Date: 22/04/2020
  Time: 01:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<div class="card">
    <div class="card-header">
        <h3>Feed</h3>
    </div>
    <div class="card-body">
        <ul class="list-group">
                <li class="list-group-item" style="margin-bottom:6px;">
                    <h4>${status.title}</h4>
                    <div class="media">
                        <div></div>
                        <div class="media-body">
                            <div class="media" style="overflow:visible;">
                                <div><img class="mr-3" style="width: 25px; height:25px;"
                                          src="assets/img/user-photo4.jpg">
                                </div>
                                <div class="media-body" style="overflow:visible;">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p><a href="#">${status.publisher.pseudo}:</a>
                                                    ${status.text}<br>
                                                <small class="text-muted">${status.publishDate}</small>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            <li class="list-group-item" style="margin-bottom:6px;">
                <div class="card">
                    <div class="card-header">
                        <h3>Comments</h3>
                    </div>
                    <div class="card-body">
                        <ul class="list-group">
                            <c:forEach items="${comments}" var="u">
                                <li class="list-group-item" style="margin-bottom:6px;">
                                    <div class="media">
                                        <div class="media-body">
                                            <div class="media" style="overflow:visible;">
                                                <div><img class="mr-3" style="width: 25px; height:25px;"
                                                          src="assets/img/user-photo4.jpg">
                                                </div>
                                                <div class="media-body" style="overflow:visible;">
                                                    <div class="row">
                                                        <div class="col-md-12">
                                                            <p><a href="#">${u.writer.pseudo}:</a>
                                                                    ${u.text}<br>
                                                                <small class="text-muted">${u.publishDate}</small>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </li>

        </ul>
        <a class="btn btn-light" style="margin-left:601px;margin-top:-9px;" type="button" href="./addStatus">Add Status</a>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>s
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script src="assets/js/script.min.js"></script>
</body>

</html>
