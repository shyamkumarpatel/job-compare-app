<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
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
                <a href="/job/new" class="btn btn-secondary btn-lg m-2">Add Job</a>
            </div>
            <div class="button">
                <a href="/logout" class="btn btn-secondary btn-lg m-2">Logout</a>
            </div>
        </div>
    </nav>
    
    <div class="container">
        <h3>Open Jobs Posting(s): </h3>
        <table class="table">
            <thead  class="table-striped">      
                <tr>
                    <th scope="col">Title</th>
                    <th scope="col">Company By</th>
                    <th scope="col">Location</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
			    <c:forEach var="job" items="${jobs}">
				<tr>
                    <th scope="row"><a href="/job/${job.getId()}">${job.getTitle()}</a></th>
                    <td>${job.getCompanyName()}</td>
                    <td>${job.getLocationCity()}, ${job.getLocationState()}</td>
                    <td>
                        <a href="/compareJob/${job.getId()}" class="btn btn-warning">Compare Job</a>
                    </td>
                </tr>
		    	</c:forEach>
            </tbody>
        </table>
    </div>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>