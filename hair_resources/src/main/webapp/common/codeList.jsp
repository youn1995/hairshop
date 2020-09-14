<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>codeList</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	
<script type="text/javascript">
	var btnPrimaryCodeCnt = 0;
	$(document).ready(function() {
		$("#isChoose").on("change", function(){
			$("#ischoosefrm").submit();
		});
		
		$("#btnPrimaryCode").on("click", function(){
			$("#btnPrimaryCodeAlret").html("");
			$("#btnPrimaryCodeAlret").html('<div id="PrimaryCodeAlretContent" class="alert alert-warning" role="alert"> 코드 단독 생성은 불가합니다. </div>');
			if(btnPrimaryCodeCnt == 0){
				$("#primary_codeInsert").parent().append('<br> <hr>같이 생성할 서브코드를 입력해주세요!');
				$("#primary_codeInsert").parent().append($('<input id="primary_codeInsertInput">'));
				btnPrimaryCodeCnt++;
			} else {
				if($("#primary_codeInsertInput").val() != null
						&& $("#primary_codeInsertInput").val() != ""
						&& $("#primary_codeInsert").val() != null
						&& $("#primary_codeInsert").val() !=""){
					
					$("#btnPrimaryCodeAlret").html("");
					$("primary_codefrm").submit();				
				} else {
					$("#PrimaryCodeAlretContent").removeClass("alert alert-warning");
					$("#PrimaryCodeAlretContent").addClass("alert alert-danger");
					$("#PrimaryCodeAlretContent").html("서브코드의 내용을 넣어주세요.");
				}
			}
		});
	});
</script>
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
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="#">코드관리</a></li>
				<li class="nav-item"><a class="nav-link" href="#">자재중분류관리</a></li>
				<li class="nav-item"><a class="nav-link disabled" href="#"
					tabindex="-1" aria-disabled="true">Disabled</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
	<br>
		<h3 class="font-weight-bold">코드리스트</h3>
		<form id="ischoosefrm" action="${pageContext.request.contextPath}/codeList.do">
			<select id="isChoose" name="isChoose" class="custom-select">
				<option value="all">전체선택</option>
				<c:forEach items="${plist}" var="p">
					<option value="${p.primary_code}" <c:if test="${param.isChoose == p.primary_code}">selected="selected"</c:if>>${p.code_name}</option>
				</c:forEach>
			</select>
		</form>
		<div id="codelisttable">
			<table class="table table-bordered table-hover table-sm text-center">
				<thead class="thead-dark">
					<tr>
						<th scope="row">코드고유번호</th>
						<th scope="row">주코드</th>
						<th scope="row">주코드 설명</th>
						<th scope="row">부코드</th>
						<th scope="row">부코드 설명</th>
						<th scope="row">수정/삭제</th>
					</tr>
				</thead>
				<tbody class="table table-striped">
					<c:forEach items="${alist}" var="a">
						<tr>
							<td>${a.code_no}</td>
							<td>${a.primary_code }</td>
							<td>${a.code_name}</td>
							<td>${a.secondary_code }</td>
							<td>${a.code_info }</td>
							<td><div class="btn-group btn-group-sm" role="group"
									aria-label="Basic example">
									<button type="button" class="btn btn-secondary">수정</button>
									<button type="button" class="btn btn-secondary">삭제</button>
								</div></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<hr>
	<div class="container">
		<h3>코드리s스트</h3>
		<hr>
		<div class="row">
			<div class="col-sm">
				새로운 주 코드를 생성할껀가요?
				<hr>
				<form id="primary_codefrm" action="">
					<input id="primary_codeInsert" type="text" name="primary_code">
					<div class="btn-group btn-group-sm">
						<button type="button" id="btnPrimaryCode" class="btn btn-secondary">생성</button>
					</div>
				</form>
			</div>
				<div class="col-sm" id="btnPrimaryCodeAlret">
				 
				</div>
			
				<div class="col-sm">
					<h5>서브코드를 추가할껀가요?</h5>
					<hr>
					<form action="">
						<lable for="primary_code">어느 주 코드에 넣을껀가요?</lable>
						<select  name="primary_code" class="custom-select">
							<c:forEach items="${plist}" var="p">
					<option value="${p.primary_code}" <c:if test="${param.isChoose == p.primary_code}">selected="selected"</c:if>>${p.code_name}</option>
					</c:forEach>
			</select>
			<hr>
						<input type="hidden" name=""> <input type="text"
							name="code_info">
						<div class="btn-group btn-group-sm"
									aria-label="Basic example">
									<button type="button" class="btn btn-secondary">추가</button>
	
								</div>


					</form>
				</div>
			</div>
		</div>
	
</body>
</html>