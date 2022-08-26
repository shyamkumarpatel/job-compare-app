<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Comparison</title>
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
    <div class="container-fluid bg-transparent text-dark">
    	<div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h3>Title:</h3>
  			</div>
  			<div class="col-5 ">
  				<h4>${job.getTitle()}</h4>
  			</div>
  			<div class="col-5">
  				<h4>${job2.getTitle()}</h4>
  			</div>
 		</div>
    	<div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h4>Company:</h4>
  			</div>
  			<div class="col-5 ">
  				<h5>${job.getCompanyName()}</h5>
  			</div>
  			<div class="col-5 ">
  				<h5>${job2.getCompanyName()}</h5>
  			</div>
 		</div> 		
    	<div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h4>Description:</h4>
  			</div>
  			<div class="col-5 ">
  				<textarea style="height: 250px; width: 750px" readonly>${job.getDescription()}</textarea>
  			</div>
  			<div class="col-5 ">
  				<textarea style="height: 250px; width: 750px" readonly>${job2.getDescription()}</textarea>
  			</div>
 		</div>		
    	<div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h4>Location:</h4>
  			</div>
  			<div class="col-5 ">
  				${job.getLocationCity()}, ${job.getLocationState()}
  			</div>
  			<div class="col-5 ">
  				${job2.getLocationCity()}, ${job2.getLocationState()}
  			</div>
 		</div>		
    	<div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h4>Pay:</h4>
  			</div>
  			<div class="col-5 ">
	              <c:choose>
				    <c:when test="${job.getPay() != null}">
	                  		${job.getPay()} per ${job.getPayRate()}
				    </c:when>    
				    <c:otherwise>
				        Not Known Yet
			   		</c:otherwise>
				</c:choose>
  			</div>
  			<div class="col-5 ">
	              <c:choose>
				    <c:when test="${job2.getPay() != null}">
	                  	${job2.getPay()} per ${job2.getPayRate()}
				    </c:when>    
				    <c:otherwise>
				        Not Known Yet
			   		</c:otherwise>
				</c:choose>
  			</div>
 		</div>
 				
    	<div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h4>Bonus:</h4>
  			</div>
  			<div class="col-5 ">
                    <c:choose>
					    <c:when test="${job.getBonus() != null}">
					        ${job.getBonus()}
					    </c:when>    
					    <c:otherwise>
					        Not Known Yet
					    </c:otherwise>
					</c:choose>
  			</div>
  			<div class="col-5 ">
                    <c:choose>
					    <c:when test="${job2.getBonus() != null}">
					        <div class="col">${job2.getBonus()}</div>
					    </c:when>    
					    <c:otherwise>
					        <div class="col">Not Known Yet</div>
					    </c:otherwise>
					</c:choose>
  			</div>
 		</div>
		<div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h4>Remote Day:</h4>
  			</div>
  			<div class="col-5 ">
                    <c:choose>
					    <c:when test="${job.getRemoteDays() != null}">
					        ${job.getRemoteDays()}
					    </c:when>    
					    <c:otherwise>
					        Not Known Yet
					    </c:otherwise>
					</c:choose>
  			</div>
  			<div class="col-5 ">
                    <c:choose>
					    <c:when test="${job2.getRemoteDays() != null}">
					        <div class="col">${job2.getRemoteDays()}</div>
					    </c:when>    
					    <c:otherwise>
					        <div class="col">Not Known Yet</div>
					    </c:otherwise>
					</c:choose>
  			</div>
 		</div>
 		
		<div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h4>Added by:</h4>
  			</div>
  			<div class="col-5 ">
                    <c:choose>
					    <c:when test="${job.getCreator().getUserName() != null}">
					        ${job.getCreator().getUserName()}
					    </c:when>    
					    <c:otherwise>
					        Not Known Yet
					    </c:otherwise>
					</c:choose>
  			</div>
  			<div class="col-5 ">
                    <c:choose>
					    <c:when test="${job2.getCreator().getUserName() != null}">
					        <div class="col">${job2.getCreator().getUserName()}</div>
					    </c:when>    
					    <c:otherwise>
					        <div class="col">Not Known Yet</div>
					    </c:otherwise>
					</c:choose>
  			</div>
 		</div>
 		    <div class="row mt-3 border-bottom">
    		<div class="col text-center">
    			<h4>Job Source:</h4>
  			</div>
  			<div class="col-5" style="word-wrap: break-word">
  				${job.getJobSource()}
  			</div>
  			<div class="col-5" style="word-wrap: break-word">
  				${job2.getJobSource()}
  			</div>
 		</div> 
 		
    </div>
	<!-- For any Bootstrap that uses JS or jQuery-->
	<script src="/webjars/jquery/jquery.min.js"></script>
	<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>