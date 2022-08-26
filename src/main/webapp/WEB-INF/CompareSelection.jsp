<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Comapre Selection</title>
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
                <a href="/dashboard" class="btn btn-secondary btn-lg m-2">Dashboard</a>
            </div>
            <div class="button">
                <a href="/logout" class="btn btn-secondary btn-lg m-2">Logout</a>
            </div>
        </div>
    </nav>
    <div class="container mt-3">
        <div class="card m-1">
            <div class="card-header d-flex justify-content-between">
                <h1>${jobSelected.getTitle()}</h1>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-3"><h5 class="card-title">Company: </h5></div>
                    <div class="col"><p class="card-text">${jobSelected.getCompanyName()}</div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Location: </h5></div>
                    <div class="col">${jobSelected.getLocationCity()}, ${jobSelected.getLocationState()}</div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Job Source: </h5></div>
                    <c:choose>
					    <c:when test="${jobSelected.getJobSource().length() <= 75}">
                    		<div class="col"><p class="card-text">${jobSelected.getJobSource()}</div>
					    </c:when>    
					    <c:otherwise>
					    	<c:set var = "subStr" value = "${fn:substring(jobSelected.getJobSource(), 0, 75)}" />
                    		<div class="col"><p class="card-text">${subStr}...</div>
					    </c:otherwise>
					</c:choose>
            	</div>
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Added by: </h5></div>
                    <c:choose>
					    <c:when test="${job.getCreator().getUserName() != null}">
                    		<div class="col"><p class="card-text">${job.getCreator().getUserName()}</div>
					    </c:when>    
					    <c:otherwise>
					        <div class="col">Not Known</div>
					    </c:otherwise>
					</c:choose>
            	</div>
        	</div>
        </div>
    </div>
    <div class="container">
        <h3>Select a job postings from below for comparison: </h3>
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
                        <a href="/compareJob/${jobSelected.getId()}/${job.getId()}" class="btn btn-warning">See comparison with this job posting</a>
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