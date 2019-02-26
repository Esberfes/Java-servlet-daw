<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="utf-8"%>
<%
String[][] serverVariables = null;
if(request.getAttribute("serverVariables") != null) {
	serverVariables = (String[][]) request.getAttribute("serverVariables");
}
 %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<title>Server Variables</title>
	
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</head>
<body>

	<ul class="nav nav-tabs">
	  	<li class="nav-item">
	    	<a class="nav-link active" href="/Ejercicio1/">Server Variables</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link" href="/Ejercicio1/form">Form Exercise</a>
	  	</li>
	  	<li class="nav-item">
	    	<a class="nav-link" href="/Ejercicio1/login">Login</a>
	  	</li>
	</ul>
	
	<div class="container mt-3">
		<h1 class="mb-3">Server Variables</h1>
		<ul class="list-group">
			<%
				if(serverVariables != null) {
					
					for(int i = 0; i < serverVariables.length; i++){
						
						String[] variable = serverVariables[i];
						out.print("<li class='list-group-item'>" + variable[0] + " >>>> " + variable[1] + "</li>");

					}
				}
			%>
		</ul>
	</div>
</body>
</html>