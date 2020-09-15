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

						$(".btncodeUpdate")
								.click(
										function() {
											var afterText;
											var $tr = $(this).parent().parent()
													.children().eq(4);
											if (cnt1 == 0) {
												cnt1++;
												beforeText1 = $tr.text();
												$tr.empty();
												$tr
														.html('<input type="text" id="codeUp">');
												$tr.children().val(beforeText1);
											} else {
												if ($(this).parent().parent()
														.children().eq(4)
														.children().attr("id") == "codeUp") {
													afterText = $("#codeUp")
															.val();

													$
															.ajax({

																url : "${pageContext.request.contextPath}/categoryMajorUpdate.do", // 클라이언트가 요청을 보낼 서버의 URL 주소

																data : {
																	no : $(this)
																			.parent()
																			.parent()
																			.children()
																			.eq(
																					0)
																			.text(),
																	text : afterText
																}, // HTTP 요청과 함께 서버로 보낼 데이터

																type : "GET", // HTTP 요청 방식(GET, POST)

																success : function(
																		data) {
																	var codeUpParent = $(
																			"#codeUp")
																			.parent();
																	codeUpParent
																			.empty();
																	if (data != 0) {

																		codeUpParent
																				.text(afterText);
																	} else {
																		console
																				.log("실패");
																		codeUpParent
																				.text(beforeText1);
																		beforeText1 = null;
																	}
																}
															});

													cnt1 = 0;
												}
											}

										});

						$(".btncodeDelete")
								.click(
										function() {
											var $tr = $(this).parent().parent();
											$
													.ajax({

														url : "${pageContext.request.contextPath}/categoryMajorDelete.do", // 클라이언트가 요청을 보낼 서버의 URL 주소

														data : {
															no : $(this)
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

						$(".btncateDelete")
								.click(
										function() {
											var $tr = $(this).parent().parent();
											$
													.ajax({
														url : "${pageContext.request.contextPath}/categoryDelete.do", // 클라이언트가 요청을 보낼 서버의 URL 주소

														data : {
															no : $(this)
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
											var cate4 = $(this).parent()
													.parent().children().eq(0)
													.text();
											var cate1 = $(this).parent()
													.parent().children().eq(1)
													.text();
											var cate2 = $(this).parent()
													.parent().children().eq(2)
													.text();
											var cate3 = $(this).parent()
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
							modal : true
						});
	
						$("#updateCate").click(function() {

						});
					});
</script>
</head>
<body>
	<div>
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
						
						<button type="button" class="btn btn-secondary btncateUpdate">수정</button>
							<button type="button" class="btn btn-secondary btncateDelete">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<table id="code" class="display">
			<thead>
				<tr>
					<th>코드번호</th>
					<th>대표코드</th>
					<th>대표코드명</th>
					<th>서브코드</th>
					<th>서브코드명</th>
					<th>수정/삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${codelist}" var="ci">
					<tr>
						<td>${ci.code_no}</td>
						<td>${ci.primary_code}</td>
						<td>${ci.code_name}</td>
						<td>${ci.secondary_code}</td>
						<td>${ci.code_info}</td>
						<td><button class="btncodeUpdate">수정</button>
							<button class="btncodeDelete">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>
	<div>
		<h3>중분류 넣기</h3>
		<form action="${pageContext.request.contextPath}/categoryInsert.do"
			method="get">
			<div>
				<label>카테고리명</label> <input type="text" name="middle_group_category">
			</div>
			<div>
				<label>카테고리설명</label>
				<textarea name="middle_group_info"></textarea>
			</div>
			<div>
				<label>대분류선택</label> <select name="secondary_code">
					<c:forEach items="${clist}" var="cli">
						<option value="${cli.secondary_code}">${cli.code_info}</option>
					</c:forEach>
				</select>
			</div>
			<div>
				<button>등록</button>
			</div>
		</form>
	</div>
	<div>
		<h3>대분류 넣기</h3>
		<form
			action="${pageContext.request.contextPath}/categoryMajorInsert.do"
			method="get">
			<div>
				<label>대분류명</label> <input type="text" name="code_info">
			</div>
			<div>
				<button>등록</button>
			</div>
		</form>
	</div>

	<div id="dialog" title="Update">
		<form action="${pageContext.request.contextPath}/categoryUpdate.do"
			method="get">
			<input type="hidden" id="cate4" name="middle_group_no"> <label>카테고리명</label>
			<input type="text" id="cate1" name="middle_group_category" value="">
			<div>
				<label>카테고리설명</label>
				<textarea id="cate2" name="middle_group_info"></textarea>
			</div>
			<div>
				<label>대분류선택</label> <select id="cate3" name="secondary_code">
					<c:forEach items="${clist}" var="cli">
						<option value="${cli.secondary_code}">${cli.code_info}</option>
					</c:forEach>
				</select>
			</div>
			<button id="updateCate">수정</button>
		</form>
	</div>
</body>
</html>