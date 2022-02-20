<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- SERVLET FOR RETRIEVE CATEGORY -->
 <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.ConnectionManager"%>
<!-- END SERVLET FOR RETRIEVE CATEGORY -->

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
  	<title>Registration</title>
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  </head>

  <header>
      <center>
        <img alt="" src=logo.png    
           style="height: 100%; width: 198px" >
           <h1> Mom's Baby World </h1>
     <center>
  </header>

  <style> 
  {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
  }

  {
    display: grid;
    height: 100vh;
    width: 100%;
    place-items:center;
    background: #ADD8E6;
  }

  .container
  {
    background: #FFFFFF;
    max-width: 500px;
    width: 100%;
    max-height: 700px;
    height: 100%;
    padding: 25px 35px;
    border-radius: 5px;
    box-shadow: 0 0px 10px rgba(0, 0, 0, 0.15);
  }

  .container form .title
  {
    font: bold;
    font-size: 30px;
    font-weight: 800;
    margin: 0 0 0 0;
    position: left;
  }

  .container form .input-box
  {
    width: 100%;
    height: 45px;
    margin-top: 25px;
    position: left;
  }

  .container form .input-box input
  {
    height: 100%;
    width: 100%;
    outline: none;
    font-size: 16px;
    border: none;
  }

  }

  .container form .input-box input[type="submit"]
  {
    font-size: 17px;
    color: #fff;
    border-radius: 5px;
    cursor: pointer;
    outline: none;
    background: #87CEEB;
    transition: all 0.3s ease;
  }
  </style>
  <body>
    <div class = "container">
   	<form action="AddCustomerController" method="post">
        <div class="user-details">
          <div class="input-box">
             <span class="details">Name</span>
              <input type="text" name="name" autocomplete="off" placeholder="Enter your username" required>
          </div> 
          
          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="email" autocomplete="off" placeholder="Enter your email address" required>
          </div> 
          
          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="number" name="num" autocomplete="off" placeholder="Enter your phone number" required>
          </div> 
          
          <div class="input-box">
            <span class="details">Address</span>
            <input type="text" name="address" autocomplete="off" placeholder="Enter a address" required>
          </div> 
          
          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="pass" autocomplete="off" placeholder="Enter a password" required>
      </div>
     </div>
          <div class="input-box">
			<input type="submit" class="button">
	</div>
      </form>
    </div>
  </body>
</html>