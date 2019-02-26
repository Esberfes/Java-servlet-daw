<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

String password = (String) request.getAttribute("password");
String adress = (String) request.getAttribute("adress");
String city = (String) request.getAttribute("city");
String email = (String) request.getAttribute("email");
String cp = (String) request.getAttribute("cp");
String[] check = (String[]) request.getAttribute("check");

ArrayList<String> attrs = new ArrayList<String>();
if(password != null) attrs.add("Password: " + password);
if(adress != null)attrs.add("Adress: " + adress);
if(city != null) attrs.add("City: " + city);
if(email != null) attrs.add("Email: " + email);
if(cp != null) attrs.add("CP: " + cp);
if(check != null) {
	for(int i = 0; i < check.length; i++) {
		attrs.add("Check: " + check[i]);
	}
}

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
	    	<a class="nav-link active" href="/Ejercicio1/form">Form Exercise</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link" href="/Ejercicio1/login">Login</a>
	  	</li>
	</ul>
	
	<%
	for(String attr : attrs) {
		out.print(attr);
		out.print("<br>");
	}
	%>

	<div class="container mt-3">
		<h1 class="mb-3">Form Exercise</h1>
		<form method="POST" action="${__SELF}" enctype="multipart/form-data">
			<div class="form-row">
			    <div class="form-group col-md-6">
			      <label for="inputEmail4">Email</label>
			      <input name="email" type="email" class="form-control" id="inputEmail4" placeholder="Email">
			    </div>
			    <div class="form-group col-md-6">
			      <label for="inputPassword4">Password</label>
			      <input name="password" type="password" class="form-control" id="inputPassword4" placeholder="Password">
			    </div>
		  	</div>
		  	<div class="form-group">
		    	<label for="inputAddress">Address</label>
		    	<input name="adress" type="text" class="form-control" id="inputAddress" placeholder="1234 Main St">
		  	</div>
		  	<div class="form-row">
			    <div class="form-group col-md-6">
			    	<label for="inputState">State</label>
					<select name="city" id="inputState" class="form-control">
				        <option disabled>Choose...</option>
				        <option>Madrid</option>
				        <option>Barcelona</option>
				        <option>Cadiz</option>
				     </select>
			    </div>
			    <div class="form-group col-md-6">
			    	<label for="inputZip">CP</label>
			      	<input name="cp" type="number" class="form-control" id="inputZip">
			    </div>
		  	</div>
		  	<div class="form-group">
		  		<label for="exampleFormControlFile1">Select a file</label>
    			<input type="file" name="inputFile" class="form-control-file" id="exampleFormControlFile1">
		  	</div>
		  	<div class="form-group">
			    <div class="form-check">
			      	<input name="check[]" value="check1" class="form-check-input" type="checkbox" id="gridCheck">
			      	<label class="form-check-label" for="gridCheck">
			        Check1
			      	</label>
			    </div>
		    	<div class="form-check">
		      		<input name="check[]"  value="check2" class="form-check-input" type="checkbox" id="gridCheck">
		      		<label class="form-check-label" for="gridCheck">
		        	Check2
		      		</label>
		    	</div>
		  	</div>
		  	<button type="submit" class="btn btn-primary">Sign in</button>
		</form>
	</div>
</body>
</html>