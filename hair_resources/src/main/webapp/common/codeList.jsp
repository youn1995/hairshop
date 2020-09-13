<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>codeList</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Features</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Pricing</a>
      </li>
      <li class="nav-item">
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </li>
    </ul>
  </div>
</nav>s
	<div id="codelisttable">
		<h3>코드리스트</h3>
		<table class="table table-bordered table-hover table-sm">
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
			
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td><div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-secondary">수정</button>
						<button type="button" class="btn btn-secondary">삭제</button>
						</div></td>
					</tr>
					<tr>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>4</td>
						<td>5</td>
						<td><div class="btn-group btn-group-sm" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-secondary">수정</button>
						<button type="button" class="btn btn-secondary">삭제</button>
						</div></td>
					</tr>
			</tbody>
		</table>
	</div>
</body>
</html>