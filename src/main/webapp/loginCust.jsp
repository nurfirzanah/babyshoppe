<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html> 
<head>
		<meta charset="UTF-8">
		<title> Login Form </title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
	</head>

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
		max-width: 350px;
		width: 100%;
		padding: 25px 30px;
		border-radius: 5px;
		box-shadow: 0 0px 10px rgba(0, 0, 0, 0.15);
	}

	.container form .title
	{
		font-size: 30px;
		font-weight: 600;
		margin: 20px 0 10px 0;
		position: relative;
	}

	.container form .input-box
	{
		width: 100%;
		height: 45px;
		margin-top: 25px;
		position: relative;
	}

	.container form .input-box input
	{
		height: 100%;
		width: 100%;
		outline: none;
		font-size: 16px;
		border: none;
	}

	.container form .underline::before
	{
		position: absolute;
		content: '';
		height: 2px;
		width: 100%;
		background: #87CEEB;
		left: 0;
		bottom: 0;
	}

	.container form .underline::after
	{
		position: absolute;
		content: '';
		height: 2px;
		width: 100%;
		left: 0;
		bottom: 0;
		background: #87CEEB;
		transform: scaleX(0);
		transform-origin: left;
		transition: all 0.3s ease;
	}

	.container form .input-box input:focus ~ .underline:after,
	.container form .input-box input:valid ~ .underline:after
	{
		transform: scaleX(1);
		transform-origin: left;
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
.btn-group .button {
  background-color:  #87CEEB; /* Green */
  border: 1px solid black ;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
  float: left;
}

.btn-group .button:not(:last-child) {
  border-right: none; /* Prevent double borders */
}

.btn-group .button:hover {
  background-color: #3e8e41;
}

	</style>
<body>
	<p><center>
	    <img alt="" src=logo.png		
	         style="height: 100%; width: 198px" >
	<center>
	</p>

	<h1><center>Mom's Baby World<center></h1>

	
		<div class="container">
		<div class="btn-group">
			<a class="button" href="login.jsp" style=" background-color:White ; color:black;">ADMIN</a>
			<a class="button" href="loginCust.jsp" style="background-color:#87CEEB; color:black;">CUSTOMER</a>
		</div>
			<form action="loginemp" method="post">
				<div class="title">Login</div>
				<div class="input-box">
					<input type="email" placeholder="Enter Your Email" name = "email" required>
					<div class="underline"></div>
				</div>
				<div class="input-box">
					<input type="password" placeholder="Enter Your Password" name = "password"required>
					<div class="underline"></div>
				</div>
				<div class="input-box">
					<input type="submit" class="button">
				</div>
				<p>Don't have an account? <a href="registration.jsp">Register here.</a></p>
			</form>
		</div>

	</body>
</html>