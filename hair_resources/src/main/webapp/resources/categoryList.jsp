<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>categoryList</title>
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
	integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
	integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
	crossorigin="anonymous"></script>
<script>
	var cnt1 = 0;
	var beforeText1;
	var cnt2 = 0;
	var beforeText2;
	$(document)
			.ready(
					function() {
						var dialog;
						$('#codecategory').DataTable();
						$('#code').DataTable();

						$(".btncateDelete")
								.click(
										function() {
											var $tr = $(this).parent().parent().parent();
											$
													.ajax({
														url : "${pageContext.request.contextPath}/categoryDelete.do", // 클라이언트가 요청을 보낼 서버의 URL 주소

														data : {
															no : $(this)
																	.parent()
																	.parent()
																	.parent()
																	.children()
																	.eq(0)
																	.text()
														}, // HTTP 요청과 함께 서버로 보낼 데이터
														type : "GET", // HTTP 요청 방식(GET, POST)
														success : function(data) {
															if (data != 0) {
																$tr.remove();
															} else {
																console
																		.log("실패");
															}
														}
													});
										});

						$(".btncateUpdate")
								.click(

										function() {
											var cate4 = $(this).parent().parent()
													.parent().children().eq(0)
													.text();
											var cate1 = $(this).parent().parent()
													.parent().children().eq(1)
													.text();
											var cate2 = $(this).parent().parent()
													.parent().children().eq(2)
													.text();
											var cate3 = $(this).parent().parent()
													.parent().children().eq(3)
													.text();
											$("#cate1").val(cate1);
											$("#cate4").val(cate4);
											$("#cate2").text(cate2);
											$("#cate3 option").removeAttr(
													"selected");
											console
													.log($("#cate3").children().length);
											for (var i = 0; i < $("#cate3")
													.children().length; i++) {
												if ($("#cate3").children()
														.eq(i).text() == cate3) {
													console.log(cate3);
													$("#cate3 option").eq(i)
															.attr("selected",
																	"selected");
												}
											}
											dialog.dialog("open");
										});

						dialog = $("#dialog").dialog({
							autoOpen : false,
							height : 400,
							width : 350,
							modal : true,
							draggable: false,
							dialogClass: "dialogcla",
						});
						$(".dialogcla .ui-dialog-titlebar").css("display", "none");
						$(".ui-dialog,.ui-dialog,.ui-widget, .ui-widget-content, .dialogcla, .ui-draggable, .ui-resizable").css("background-color", "white");
						$(".ui-corner-all").css("background-color", "black");
						$("#updateCate").click(function() {

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
		<h3 class="font-weight-bold">미용자재분류리스트</h3>
		<hr>
		<div class="row-100">
		
		<table id="codecategory" class="display">
			<thead>
				<tr>
					<th>번호</th>
					<th>카테고리명</th>
					<th>설명</th>
					<th>대분류명</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mglist}" var="i">
					<tr>
						<td>${i.middle_group_no }</td>
						<td>${i.middle_group_category }</td>
						<td>${i.middle_group_info }</td>
						<td>${i.secondary_code}</td>
						<td>
						<div class="btn-group btn-group-sm" role="group">
						<button type="button" class="btn btn-secondary btncateUpdate">수정</button>
							<button type="button" class="btn btn-danger btncateDelete">삭제</button>
							</div>
							</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<hr>
	<div class="row">
			<div class="col-sm">
		<h4>미용자재분류 추가</h4>
		<hr>
		<form action="${pageContext.request.contextPath}/categoryInsert.do"
			method="get">
			<div class="form-group">
				<label>카테고리명</label> <input class="form-control" type="text" name="middle_group_category" required>
			</div>
			<div class="form-group">
				<label>카테고리 설명</label>
				<textarea class="form-control" name="middle_group_info"></textarea>
			</div>
			<div class="form-group">
				<label>대분류 선택</label> <select class="form-control" name="secondary_code">
					<c:forEach items="${clist}" var="cli">
						<option value="${cli.secondary_code}">${cli.code_info}</option>
					</c:forEach>
				</select>
			</div>
			<div class="btn-group" role="group">
				<button class="btn btn-secondary" type="submit">등록</button>
				<button class="btn btn-secondary" type="reset">취소</button>
			</div>
		</form>
		</div>
		<div class="col-sm">
		</div>
	</div>


	<div id="dialog" title="카테고리 수정" style="border: 1px solid black">
		<div class="container" >
		<form action="${pageContext.request.contextPath}/categoryUpdate.do"
			method="get">
			
			<input type="hidden" id="cate4" name="middle_group_no">
			<div class="form-group">
			<label>카테고리명</label>
			<input class="form-control" type="text" id="cate1" name="middle_group_category" value="" required>
			</div>
			<div class="form-group">
				<label>카테고리설명</label>
				<textarea class="form-control" id="cate2" name="middle_group_info"></textarea>
			</div>
			<div class="form-group">
				<label>대분류선택</label> <select class="form-control" id="cate3" name="secondary_code">
					<c:forEach items="${clist}" var="cli">
						<option value="${cli.secondary_code}">${cli.code_info}</option>
					</c:forEach>
				</select>
			</div>
			<div class="btn-group" role="group">
			<button class="btn btn-secondary" id="updateCate">수정</button>
			<button class="btn btn-secondary">취소</button>
			</div>
		</form>
		</div>
	</div>
	</div>
</body>
</html>