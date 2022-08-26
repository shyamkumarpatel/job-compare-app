<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Job Posting</title>
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
    <div class="container-sm mt-3">
        <div class="card m-1">
            <div class="card-header d-flex justify-content-between">
                <h1>${job.getTitle()}</h1>
                <div class="d-flex">		
		       		<form action="/job/delete/${job.getId()}" method="post">
						<input type="hidden" name="_method" value="delete">
						<button type="submit" class="btn btn-danger btn-lg m-2">Delete</button>
		       		</form>
                    <a href="/compareJob/${job.getId()}" class="btn btn-warning btn-lg m-2">Compare Job</a>
                </div>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-sm-3"><h5 class="card-title">Company: </h5></div>
                    <div class="col"><p class="card-text">${job.getCompanyName()}</div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Description: </h5></div>
                    <div class="col">
                    	<textarea style="height: 250px; width: 750px" readonly>${job.getDescription()}</textarea>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Location: </h5></div>
                    <div class="col">${job.getLocationCity()}, ${job.getLocationState()}</div>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Pay: </h5></div>
                    <c:choose>
					    <c:when test="${job.getPay() != null}">
                    		<div class="col">${job.getPay()} per ${job.getPayRate()}</div>
					    </c:when>    
					    <c:otherwise>
					        <div class="col">Not Known Yet</div>
				   		</c:otherwise>
					</c:choose>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Bonus: </h5></div>
                    <c:choose>
					    <c:when test="${job.getBonus() != null}">
					        <div class="col">${job.getBonus()}</div>
					    </c:when>    
					    <c:otherwise>
					        <div class="col">Not Known Yet</div>
					    </c:otherwise>
					</c:choose>
                </div>
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Remote Day: </h5></div>
                    <c:choose>
					    <c:when test="${job.getRemoteDays() != null}">
					        <div class="col">${job.getRemoteDays()}</div>
					    </c:when>    
					    <c:otherwise>
					        <div class="col">Not Known Yet</div>
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
                <div class="row mt-3">
                    <div class="col-sm-3"><h5 class="card-title">Job Source: </h5></div>
                    <div class="col" style="word-wrap: break-word">${job.getJobSource()}</div>
                </div>
            </div>
        </div>
    </div>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>