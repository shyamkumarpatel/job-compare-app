<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Job Posting</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="h1 m-auto">
            Welcome ${usersName}!
        </div>
        <div class="d-flex">
            <div class="button">
                <a href="/dashboard" class="btn btn-secondary btn-lg m-2">Dashboard</a>
            </div>
            <div class="button">
                <a href="/logout" class="btn btn-secondary btn-lg m-2">Logout</a>
            </div>
        </div>
    </nav>
    <div class="container bg-secondary text-white p-4">
        <h1 class="mb-3" id='info'>Add a job posting.</h1>
        <form:form action='/create' method='post' modelAttribute="newJob" class="mt-4">
            <div class="row">
                <div class="col">
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Title: </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" path="title"/>
                            <p class="text-danger"><form:errors path="title"/></p>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Company: </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" path="companyName"/>
                            <p class="text-danger"><form:errors path="companyName"/></p>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label>Description:</label>
                        <p class="text-danger"><form:errors path="description"/></p>
                        <form:textarea class="form-control mt-2" rows="5" path="description"/>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Location, City: </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" path="locationCity"/>
                            <p class="text-danger"><form:errors path="locationCity"/></p>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Location, State: </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" path="locationState"/>
                            <p class="text-danger"><form:errors path="locationState"/></p>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2 col-form-label">Job Source: </label>
                        <div class="col-sm-10">
                            <form:input type="text" class="form-control" path="jobSource"/>
                            <p class="text-danger"><form:errors path="jobSource"/></p>
                        </div>
                    </div>
                    <div class="mt-5 mb-3 h4">
                        Optional Information below:
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-4 col-form-label">Pay Rate: </label>
                        <div class="col-sm">
                            <form:input type="number" class="form-control" path="pay" min="0" step=".01"/>
							<form:select path="payRate">
								<form:option value="Annually" label="Annually"/>  
								<form:option value="Hourly" label="Hourly"/>
								<form:option value="Monthly" label="Monthly"/>
								<form:option value="Weekly" label="Weekly"/>  
							</form:select>
                            <p class="text-danger"><form:errors path="pay"/></p>
                            <p class="text-danger"><form:errors path="payRate"/></p>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-4 col-form-label">Bonus: </label>
                        <div class="col-sm">
                            <form:input type="number" class="form-control" path="bonus" min="0" step=".01"/>
                            <p class="text-danger"><form:errors path="bonus"/></p>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-4 col-form-label" >Remote Day: </label>
                        <div class="col-sm">
                            <form:input type="number" class="form-control" path="remoteDays" min="0" max="5"/>
                            <p class="text-danger"><form:errors path="remoteDays"/></p>
                            <p>between 0 and 5<br>0 for fully in office<br>5 for fully remote</p>
                        </div>
                    </div>
                </div>
            </div>
            <hr class="mb-4">
            
			<form:hidden path="creator" value="${userId}" />
            <button class="btn btn-primary btn-lg btn-block" type="submit">Submit</button>
        </form:form >
    </div>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>