<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache"> 
    <meta http-equiv="Cache-Control" content="no-cache"> 
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">
    
    <title>Project Manager | Home</title>
    
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
     <link href="static/css/style.css" rel="stylesheet">
    
    <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
</head>
<body>

	

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="/" class="navbar-brand">Marketplace</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="new-task">Add Project</a></li>
					<li><a href="all-tasks">View Projects</a></li>
				</ul>
			</div>
		</div>
	</div>
	
	<c:choose>
		<c:when test="${mode == 'MODE_HOME'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h2>Welcome to Online Project Marketplace</h2>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_TASKS'}">
			<div class="container text-center" id="tasksDiv">
				<h3>Project Status</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<!--<th>Id</th> -->
								<th>Client Name</th>
								<th>Project Name</th>
								<th>Description</th>
								<th>Budget</th>
								<th>Duration</th>
								<th>Date Created</th>
								<th>Finished</th>
								<th>Update</th>
								<th>Delete</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="task" items="${tasks}">
								<tr>
									<!--<td>${task.id}</td> -->
									<td>${task.clientName}</td>
									<td>${task.name}</td>
									<td>${task.description}</td>
									<td>${task.projectBudget}</td>
									<td>${task.projectDuration}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.dateCreated}"/></td>
									<td>${task.finished}</td>
									<td><a href="update-task?id=${task.id}"><span class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a href="delete-task?id=${task.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE_NEW' || mode == 'MODE_UPDATE'}">
			<div class="container text-center">
				<h3>Add New Project</h3>
				<hr>
				<form class="form-horizontal" method="POST" action="save-task">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
					<input type="hidden" name="id" value="${task.id}"/>
					<div class="form-group">
						<label class="control-label col-md-3">Project Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="name" value="${task.name}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Project Description</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="description" value="${task.description}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Client Name</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="clientName" value="${task.clientName}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Project Duration</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="projectDuration" value="${task.projectDuration}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Project Budget</label>
						<div class="col-md-7">
							<input type="text" class="form-control" name="projectBudget" value="${task.projectBudget}"/>
						</div>				
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Finished</label>
						<div class="col-md-7">
							<input type="radio" class="col-sm-1" name="finished" value="true"/>
							<div class="col-sm-1">Yes</div>
							<input type="radio" class="col-sm-1" name="finished" value="false" checked/>
							<div class="col-sm-1">No</div>
						</div>				
					</div>	

					<div class="form-group">
						
						<input type="submit" class="btn btn-primary" value="Save"/>
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>    
    <script src="static/js/bootstrap.min.js"></script>
</body>
</html>