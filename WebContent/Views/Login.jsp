<%@page import="java.util.ArrayList"%>
<%@page import="app.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String email = (String) request.getAttribute("email");
String password = (String) request.getAttribute("password");
boolean canLogin = false;

if(request.getAttribute("canLogin") != null) canLogin = Boolean.parseBoolean( (String) request.getAttribute("canLogin"));
if(canLogin) response.setIntHeader("Refresh", 1);

User user = null;
for( Cookie c : request.getCookies() ) {
	if(c.getName().equals("user")) user = app.User.deserialize(c.getValue());
}
if(user != null) out.print(user.serialize());
out.print("<br> Test session:");
out.print( request.getSession().getAttribute("test") + "<br>");
;
%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<title>Form Exercise</title>
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<body>

	<ul class="nav nav-tabs">
	  	<li class="nav-item">
	    	<a class="nav-link" href="/Ejercicio1/">Server Variables</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link" href="/Ejercicio1/form">Form Exercise</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link active" href="/Ejercicio1/login">Login</a>
	  	</li>
	</ul>

	<div class="container mt-3">
		<h1 class="mb-3">Login</h1>
		<form method="POST" action="${__SELF}" enctype="multipart/form-data">
			<% if(user == null) { %>
			<div class="form-group">
				<label for="exampleInputEmail1">Email address</label>
				<input value="casas222@gmail.com" name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
				<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
			</div>
			<div class="form-group">
				<label for="exampleInputPassword1">Password</label>
				<input value="1234" name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
			</div>
			<div class="form-group form-check">
				<input name="accept" type="checkbox" required class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me out to accept conditions</label>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
			<% } else { %>
			<button type="submit" name="logout" class="btn btn-primary">Logout</button>
			<% } %>
		</form>
	</div>
</body>
</html>