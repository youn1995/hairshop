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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" charset="utf8"
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.js"></script>
<script>
	$(document).ready(function() {
		$('#codecategory').DataTable();
		$('#code').DataTable();
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
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${mglist}" var="i">
					<tr>
						<td>${i.middle_group_no }</td>
						<td>${i.middle_group_category }</td>
						<td>${i.middle_group_info }</td>
						<td>${i.secondary_code}</td>
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
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${codelist}" var="ci">
				<tr>
					<td>${ci.code_no}</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
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
</body>
</html>