<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login and Registration</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container m-3">
		<div class="card">
		  <div class="card-header">
		    <h1>Job Compare App</h1>
		  </div>
		</div>
	</div>
	<div class="container-fluid d-flex m-3">
		<div class="card m-1">
		  <div class="card-header">
		    Register
		  </div>
		  <div class="card-body">
			  <form:form action="/register" method="post" modelAttribute="newUser">
				<div class="form-group">
					<label>Name:</label>
					<form:input path="userName" class="form-control" />
					<form:errors path="userName" class="text-danger" />
				</div>
				<div class="form-group mt-1">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>
				<div class="form-group mt-1">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>
				<div class="form-group mt-1">
					<label>Confirm Password:</label>
					<form:password path="confirm" class="form-control" />
					<form:errors path="confirm" class="text-danger" />
				</div>
				<input type="submit" value="Register" class="btn btn-primary mt-3" />
			</form:form>
		  </div>
		</div>
		
		<div class="card m-1">
		  <div class="card-header">
		    Login
		  </div>
		  <div class="card-body">
		  	<form:form action="/login" method="post" modelAttribute="newLogin">
				<div class="form-group">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>
				<div class="form-group mt-1">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>
				<input type="submit" value="Login" class="btn btn-success mt-3" />
			</form:form>
		  </div>
		</div>
	</div>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>