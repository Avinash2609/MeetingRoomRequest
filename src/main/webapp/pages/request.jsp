
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


       <section id="appointment" class="appointment section-bg">
           <div class="container">

             <div class="section-title">
               <h2>Make a request </h2>
             </div>

             <form action="/login/getrequest" method="post" role="form" class="php-email-form">
               <div class="form-row">
                 <div class="col-md-4 form-group">
                   <input type="text" name="fname" class="form-control" id="name" placeholder="First Name" data-rule="minlen:3" data-msg="Please enter at least 3 chars" required>
                   <div class="validate"></div>
                 </div>
                 <div class="col-md-4 form-group">
                   <input type="text" name="lname" class="form-control" id="name" placeholder="Last Name" data-rule="minlen:3" data-msg="Please enter at least 3 chars" required>
                   <div class="validate"></div>
                 </div>
                 <div class="col-md-4 form-group">
                   <input type="tel" class="form-control" name="contact" id="phone" placeholder="Contact Number" data-rule="minlen:10" data-msg="Please enter at least 10 chars" required>
                   <div class="validate"></div>
                 </div>
               </div>

               <div class="form-row">
               <div class="col-md-4 form-group">
                  <input type="Number" class="form-control" name="empid" id="empid" placeholder="Empoyee ID"  required>
                  <div class="validate"></div>
                </div>
                 <div class="col-md-4 form-group">
                   <label> Select Date: </label>
                   <select name="dd" id="dd" required>
                     <option value="" >Select day</option>
                     <% for (int i =1; i <=31;  i++ ) { %>
                       <option value=<%= i %>><%=i %></option>
                       <% } %>

                   </select>

                   <div class="validate"></div>
                 </div>
                 <div class="col-md-4 form-group">
                   <select name="mm" id="mm" required>

                     <option value="" >Select month</option>
                     <% for ( int i =1; i <=12;  i++ ) { %>
                       <option value=<%= i %>><%=i %></option>
                       <% } %>

                   </select>


                   <div class="validate"></div>
                 </div>
                 <div class="col-md-4 form-group">
                   <select name="yy" id="yy" required>

                     <option value="" >Select year</option>
                     <% for ( int i =2022; i <=2023;  i++ ) { %>
                       <option value=<%= i %>><%=i %></option>
                       <% } %>

                   </select>


                   <div class="validate"></div>
                 </div>
               </div>


               <div class="form-row">
                 <div class="col-md-4 form-group">
                   <label> Select start time:  </label>
                   <select name="stimehh" id="stimehh" required>

                     <option value="" >hh</option>
                     <% for ( int i =1; i <=24;  i++ ) { %>
                       <option value=<%= i %>><%=i %></option>
                       <% } %>

                   </select>

                   <div class="validate"></div>
                 </div>
                 <div class="col-md-4 form-group">
                   <select name="stimemm" id="stimemm" required>

                     <option value="" >Select mm</option>
                     <% for ( int i =0; i <=60;  i++ ) { %>
                       <option value=<%= i %>><%=i %></option>
                       <% } %>

                   </select>
                   <div class="validate"></div>
                 </div>
               </div>

               <div class="form-row">
                 <div class="col-md-4 form-group">
                   <label> Select end time:  </label>
                   <select name="etimehh" id="etimehh" required>

                     <option value="" >hh</option>
                     <% for ( int i =1; i <=24;  i++ ) { %>
                       <option value=<%= i %>><%=i %></option>
                       <% } %>

                   </select>

                   <div class="validate"></div>
                 </div>
                 <div class="col-md-4 form-group">
                   <select name="etimemm" id="etimemm" required>

                     <option value="" >Select mm</option>
                     <% for ( int i =0; i <=60;  i++ ) { %>
                       <option value=<%= i %>> <%=i %> </option>
                       <% } %>

                   </select>
                   <div class="validate"></div>
                 </div>
               </div>


               <div class="form-row">
                   <div class="col-md-4 form-group">
                     <input type="number" name="persons" class="form-control" id="persons" placeholder="Number of persons" data-rule="minlen:1" data-msg="Please enter at least single number" required>
                     <div class="validate"></div>
                   </div>


                 </div>

                 <div class="form-group" style="width:100% ;">
                   <textarea class="form-control" name="food" rows="2" placeholder="If yes then please mention else enter NO" required></textarea>
                   <div class="validate"></div>
                 </div>

                 <div class="form-group" style="width:100% ;">
                   <textarea class="form-control" name="purpose" rows="2" required placeholder="Purpose of booking"></textarea>
                   <div class="validate"></div>
                 </div>

                 <div class="btn-group">
                   <button type="button" class="btn btn-success">Submit form by selecting location</button>
                   <button type="button" class="btn btn-danger dropdown-toggle dropdown-toggle-split" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                     <span class="sr-only">Toggle Dropdown</span>
                   </button>
                   <div class="dropdown-menu">

                       <button type="submit" class='dropdown-item btn btn-light btn-lg' name="location" value="Bangalore" >Bangalore</button></li>
                       <button type="submit" class='dropdown-item btn btn-light btn-lg' name="location" value="Singapore">Singapore</button></li>
                       <button type="submit" class='dropdown-item btn btn-light btn-lg' name="location" value="Montevideo">Montevideo</button></li>
                       <button type="submit" class='dropdown-item btn btn-light btn-lg' name="location" value="Southlake, Tx">Southlake</button></li>

                 </div>

             </form>
             <a class="btn btn-info" href="/">Go back</a>

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
