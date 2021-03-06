<%--
  Created by IntelliJ IDEA.
  User: oussama
  Date: 17/04/2020
  Time: 20:07
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
<div class="card">
    <div class="card-header">
        <h3>Feed</h3>
    </div>
    <div class="card-body">
        <ul class="list-group">
            <c:forEach items="${status}" var="u">
                <li class="list-group-item" style="margin-bottom:6px;">
                    <h4>${u.title}</h4>
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
                                            <p><a href="#">${u.publisher.pseudo}:</a>
                                                    ${u.text}<br>
                                                <small class="text-muted">${u.publishDate}</small>
                                            </p>
                                            <form action="allComments" method="post">
                                                <input type="number" value="${u.idStatus}" name="idStatus" hidden>
                                                <button value="allComments" name="action" class="btn-primary">Liste des commentaires</button>
                                            </form>
                                            <div class="card text-white bg-primary mb-1">
                                                <form action="addComment" method="post">
                                                    <input hidden type="number" name="idStatus" value="${u.idStatus}">
                                                    <div class="card-header">
                                                            ${pseudo}
                                                        <button type="submit" name="addCommment" value="action"
                                                                class="float-right btn btn-dark"><i
                                                                class="fa fa-comment"></i>Comment
                                                        </button>
                                                    </div>
                                                    <div class="card-body">
                                                        <div class=" card-text form-group">
                                                          <textarea placeholder="Comment" rows="4"
                                                                    class="form-control form-control-lg"
                                                                    style="height: 15vh;" name="text"></textarea>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </li>
            </c:forEach>
        </ul>
        <a class="btn btn-light" style="margin-left:601px;margin-top:-9px;" type="button" href="./addStatus">Add Status</a>
    </div>
</div>
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script src="assets/js/script.min.js"></script>
</body>

</html>
