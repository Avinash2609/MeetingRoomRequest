
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
      <a class="navbar-brand" href="/">Team11</a>
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



<div class="container">
 ${res}
    <div class="section-title">

                <h4 class="text-center">Your Tracking status is:</h4>
                    <table border="1PX" align="center">
                        <tr>
                            <td>Request id</td>
                            <td>${r.rid}</td>
                        </tr>
                        <tr>
                            <td>Employee id</td>
                            <td>${r.empid}</td>
                        </tr>
                        <tr>
                            <td>Employee email</td>
                            <td>${r.email}</td>
                        </tr>
                        <tr>
                            <td>Name</td>
                            <td>${r.fname} ${r.lname} </td>
                        </tr>
                        <tr>
                            <td>Location</td>
                            <td>${r.location}</td>
                        </tr>
                        <tr>
                            <td>No. of Persons</td>
                            <td>${r.persons}</td>
                        </tr>
                        <tr>
                            <td>Contact Number</td>
                            <td>${r.contact}</td>
                        </tr>
                        <tr>
                            <td>Date of booking</td>
                            <td>${r.dd}/${r.mm}/${r.yy}</td>
                        </tr>
                        <tr>
                            <td>Start Time</td>
                            <td>${r.stimehh}:${r.stimehh}</td>
                        </tr>
                        <tr>
                            <td>End Time</td>
                            <td>${r.etimehh}:${r.etimehh}</td>
                        </tr>

                        <tr>
                            <td>Status of Request</td>
                            <td>${r.status}</td>
                        </tr>
                        <tr>
                            <td>Allotment</td>
                            <td>${r.allotment}</td>
                        </tr>
                        <tr>
                            <td>Room Number alloted</td>
                            <td>${r.allotment}</td>
                        </tr>
                        <tr>
                            <td>Payment status</td>
                            <td>${r.paymentstatus}</td>
                        </tr>

                        <tr>
                            <td>Purpose</td>
                            <td>${r.purpose}</td>
                        </tr>
                        <tr>
                            <td>Food</td>
                            <td>${r.food}</td>
                        </tr>
                        <tr>
                            <td>Cost</td>
                            <td>${r.cost}</td>
                        </tr>
                    </table>
    </div>
</div>
         <div class="container" style="margin-top: 50px;">
       <!-- For a gap maintainence -->
         </div>



<section id="appointment" class="appointment section-bg">
           <div class="container">


             <form action="/login/adminorder/${r.rid}" method="post" role="form" class="php-email-form">
               <div class="form-row">
                 <div class="col-md-4 form-group">
                   <input type="Number" name="cost" class="form-control" id="name" placeholder="Cost" required>
                   <div class="validate"></div>
                 </div>
                 <div class="col-md-4 form-group">
                 <div class="btn-group">
                    <button type="button" class="btn btn-success">Submit form by selecting Status</button>
                    <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                      <span class="sr-only">Toggle Dropdown</span>
                    </button>
                    <div class="dropdown-menu">
                        <button type="submit" class='dropdown-item btn btn-light btn-lg' name="status" value="Rejected" >Rejected</button></li>
                        <button type="submit" class='dropdown-item btn btn-light btn-lg' name="status" value="Approved">Approved</button></li>
                        <button type="submit" class='dropdown-item btn btn-light btn-lg' name="status" value="Pending">Pending</button></li>
                  </div>
                 </div>
               </div>
             </form>
           </div>
         </section>




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