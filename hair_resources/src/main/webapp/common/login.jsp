<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">HairShop</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active">
				<c:if test="${id == null}">
				<a class="nav-link" href="${pageContext.request.contextPath}/login.do">로그인
						<span class="sr-only">(current)</span>
				</a>
				</c:if>
				<c:if test="${id != null}">
				<a class="nav-link" href="${pageContext.request.contextPath}/logout.do">로그아웃
						<span class="sr-only">(current)</span>
				</a>
				</c:if>
				</li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/codeList.do">코드관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/categoryList.do">자재중분류관리</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">${id}</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
	<br>
	<h3 style="text-align : center">ADMIN 로그인</h3>
	<hr>
		<div class="row">
			<div class="col-sm"></div>
			<div class="col-sm ">
				<div>
				</div>
				<form action="${pageContext.request.contextPath}/login.do" method="post">
					<div class="form-group">
						<label for="exampleInputEmail1">아이디</label> <input
							type="text" class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" name="id"> 
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">비밀번호</label> <input
							type="password" class="form-control" id="exampleInputPassword1" name="pw">
					</div>
					
					<div>
						<button type="submit" class="btn btn-primary">로그인</button>
						
					</div>
				</form>
				
			</div>
			<div class="col-sm"></div>
		</div>
	</div>
</body>
</html>