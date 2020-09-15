<%--
  Created by IntelliJ IDEA.
  User: oussama
  Date: 17/04/2020
  Time: 20:09
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<%
    if (session.getAttribute("user") == null){
        response.sendRedirect("./login");
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
<div class="row">
    <div class="col">
        <div class="container" style="/*width: 60vh;*/">
            <div class="text-center border rounded-0 shadow-sm profile-box"
                 style="/*height: 300px;*/background-color: #ffffff;margin: 5px;">
                <div style="height: 50px;background-image: url(&quot;assets/img/bg-pattern.png&quot;);background-color: rgba(54,162,177,0);"></div>
                <div><img class="rounded-circle" src="assets/img/bg-cta.jpg" width="60px" height="60px"
                          style="background-color: rgb(255,255,255);padding: 2px;"></div>
                <div style="height: 80px;">
                    <h4>${pseudo}</h4>
                    <p style="font-size: 12px;">${nom} ${prenom}</p>
                    <div class="col-md-12 search-table-col">
                        <div class="form-group pull-right col-lg-4"><input type="text" class="search form-control"
                                                                           placeholder="Search by typing here.."></div>
                        <span class="counter pull-right">LIST OF FRIENDS</span>
                        <div class="table-responsive table-bordered table table-hover table-bordered results">
                            <table class="table table-bordered table-hover">
                                <thead class="bill-header cs">
                                <tr>
                                    <th id="trs-hd" class="col-lg-1">PSEUDO</th>
                                    <th id="trs-hd" class="col-lg-2">NOM</th>
                                    <th id="trs-hd" class="col-lg-2">PRENOM</th>
                                    <th id="trs-hd" class="col-lg-2">EMAIL</th>
                                    <th id="trs-hd" class="col-lg-2">ADD/REMOVE</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr class="warning no-result">
                                    <td colspan="12"><i class="fa fa-warning"></i>&nbsp; No Result !!!</td>
                                </tr>
                                <c:forEach items="${friends}" var="u">
                                    <tr>
                                        <td>${u.pseudo}</td>
                                        <td>${u.nom}</td>
                                        <td>${u.prenom}</td>
                                        <td>${u.email}</td>
                                        <td><button class="btn btn-danger" style="margin-left: 5px;" type="submit" onclick="removeFriend('${pseudo}','${u.pseudo}')"><i class="fa fa-trash" style="font-size: 15px;"></i></button></td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    function removeFriend(user, friend) {
        let basel = window.location.href;
        const str = basel.substr(basel.lastIndexOf('/') + 1) + '$';
        basel = basel.replace(new RegExp(str), '');

        var request = new XMLHttpRequest()

        request.open('GET', basel + "api/user/removeFriend/" + user + "/" + friend, true)
        request.onload = function () {
            // Begin accessing JSON data here
            if (request.status >= 200 && request.status < 400) {
                location.reload();
            } else {
                console.log('error')
            }
        }
        request.send()
    }
</script>
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/bootstrap/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.min.js"></script>
<script src="../assets/js/script.min.js"></script>
</body>

</html>