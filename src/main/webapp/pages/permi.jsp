
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Team11</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    </head>
<body>
   <div style="margin-bottom: 100px;">
    <nav class="navbar fixed-top navbar-expand-lg navbar-light bg-light">
      <a class="navbar-brand" href="/campgrounds">Team11</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse justify-content-sm-end " id="navbarSupportedContent">
        <ul class="navbar-nav">
        <li class="nav-item">
                      <a class="nav-link" href="#">Signed In As ${mailid} </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exit">Logout</a>
        </li>


        </ul>
      </div>
    </nav>
   </div>

   <div class="container">

   </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
    <div class="container"  style="text-align:center">
                <form action="/login/getadminloc" method="post" role="form" class="php-email-form">
                    <div class="btn-group">
                           <button type="button" class="btn btn-success">Change  location</button>
                           <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                             <span class="sr-only">Toggle Dropdown</span>
                           </button>
                           <div class="dropdown-menu">

                               <button type="submit" class='dropdown-item btn btn-light btn-lg' name="location" value="Bangalore" >Bangalore</button></li>
                               <button type="submit" class='dropdown-item btn btn-light btn-lg' name="location" value="Singapore">Singapore</button></li>
                               <button type="submit" class='dropdown-item btn btn-light btn-lg' name="location" value="Montevideo">Montevideo</button></li>
                               <button type="submit" class='dropdown-item btn btn-light btn-lg' name="location" value="Southlake, Tx">Southlake</button></li>

                           </div>
                     </div>

                    </form>
            </div>

   <div class="section-title">
      <h2>Pending requests </h2>
    </div>
    <div class="table-responsive" style="width: 98%;margin-left: 10px;">

                    <table class="table table-hover">

                    <thead>
                        <tr>
                            <th> Date </th>
                            <th> Start Time </th>
                            <th> End Time </th>
                            <th> Permissions </th>
                        </tr>
                    </thead>
                    <tbody>
                                <c:forEach var="req" items="${res}">
                                         <tr>
                                            <td>${req.dd}/${req.mm}/${req.yy}</td>
                                            <td> ${req.stimehh}:${req.stimemm}  </td>
                                            <td> ${req.etimehh}:${req.etimemm}  </td>
                                            <td><a href="/login/info/${req.rid}"><button class="btn btn-success">More Info</button></a></td>
                                        </tr>
                        		</c:forEach>

                    </tbody>
                    </table>
            </div>
<div class="section-title" style="margin-top: 50px;">
      <h2>Approved requests </h2>
    </div>
    <div class="table-responsive" style="width: 98%;margin-left: 10px;">

                    <table class="table table-hover">

                    <thead>
                        <tr>
                            <th> Date </th>
                            <th> Start Time </th>
                            <th> End Time </th>
                            <th> Permissions </th>
                        </tr>
                    </thead>
                    <tbody>
                                <c:forEach var="req" items="${res1}">
                                         <tr>
                                            <td>${req.dd}/${req.mm}/${req.yy}</td>
                                            <td> ${req.stimehh}:${req.stimemm}  </td>
                                            <td> ${req.etimehh}:${req.etimemm}  </td>
                                            <td><a href="/login/info/${req.rid}"><button class="btn btn-success">More Info</button></a></td>
                                        </tr>
                        		</c:forEach>

                    </tbody>
                    </table>
            </div>





    <div class="container" style="margin-top: 210px;">
           <!-- For a gap maintainence -->
             </div>

    <div >
    <p class="container jumbotron">Trademark Team11 2022</br>
        Contact: 9050995986</br>
        MailId: reachjindalhere@gmail.com</p>

    <div>

</body>
</html>