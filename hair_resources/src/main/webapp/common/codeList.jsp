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
	<style>
	 .toggleupdate{
	 	display: none;
	 }
	 #updateslide {
	 	display: none;
	 }
	</style>
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
				var $div = $("<div>").attr("id", "divForSubcode");
				$div.append('<br> <hr>같이 생성할 서브코드를 입력해주세요!');
				$div.append($('<input id="primary_codeInsertInput", name="code_info">'));
				$("#primary_codeInsert").parent().append($div);
				btnPrimaryCodeCnt++;
			} else {
				if($("#primary_codeInsertInput").val() != null
						&& $("#primary_codeInsertInput").val() != ""
						&& $("#primary_codeInsert").val() != null
						&& $("#primary_codeInsert").val() !=""){
					
					$.ajax("${pageContext.request.contextPath}/primaryCodeInsert.do", {
						data : $("#primary_codefrm").serialize(),
						dataType : "json",
						method : "post",
						success : function(data) {
							$("#btnPrimaryCodeAlret").html("");
							if(data.code_no != null && data.code_no != ""){
								$("#primary_codeInsert").val("");
								var trCode = $("<tr>")
								trCode.append($("<td>").text(data.code_no));
								trCode.append($("<td>").text(data.primary_code));
								trCode.append($("<td>").text(data.code_name));
								trCode.append($("<td>").text(data.secondary_code));
								trCode.append($("<td>").text(data.code_info));
								trCode.append($("<td>").html('<div class="btn-group btn-group-sm" role="group" aria-label="Basic example"><button type="button" class="btn btn-secondary btncodeUpdate">수정</button><button type="button" class="btn btn-danger btncodeDelete">삭제</button></div>'));
								$("#codelisttable_tbody").prepend(trCode);
								
								$("#btnPrimaryCodeAlret").html('<div id="PrimaryCodeAlretContent" class="alert alert-success" role="alert"> 주 코드 생성완료 </div>');
								$("#divForSubcode").remove();
								setTimeout(function(){
									$("#btnPrimaryCodeAlret").html("");
								}, 3000);
							} else{
								$("#btnPrimaryCodeAlret").html('<div id="PrimaryCodeAlretContent" class="alert alert-danger" role="alert"> 주 코드 생성실패 </div>');
								$("#divForSubcode").remove();
								setTimeout(function(){
									$("#btnPrimaryCodeAlret").html("");
								}, 3000);
							}
							btnPrimaryCodeCnt = 0;
						}
					});			
				} else {
					$("#PrimaryCodeAlretContent").removeClass("alert alert-warning");
					$("#PrimaryCodeAlretContent").addClass("alert alert-danger");
					$("#PrimaryCodeAlretContent").html("서브코드의 내용을 넣어주세요.");
				}
			}
		});		
		
		$("#btnSecondaryCode").on("click", function(){
			if($("#code_infoForSCfrm").val() != null && $("#code_infoForSCfrm").val() != ""){
			$.ajax("${pageContext.request.contextPath}/secondaryCodeInsert.do", {
				data : $("#secondary_codefrm").serialize(),
				dataType : "json",
				method : "post",
				success : function(data) {
					$("#code_infoForSCfrm").val("");
					if(data.code_no != null || data.code_no != ""){
						$("#secondary_codefrmAlert").html('<div id="PrimaryCodeAlretContent" class="alert alert-success" role="alert"> 서브코드 추가 완료! </div>')
						var trCode = $("<tr>")
						trCode.append($("<td>").text(data.code_no));
						trCode.append($("<td>").text(data.primary_code));
						trCode.append($("<td>").text(data.code_name));
						trCode.append($("<td>").text(data.secondary_code));
						trCode.append($("<td>").text(data.code_info));
						trCode.append($("<td>").html('<div class="btn-group btn-group-sm" role="group" aria-label="Basic example"><button type="button" class="btn btn-secondary btncodeUpdate">수정</button><button type="button" class="btn btn-danger btncodeDelete">삭제</button></div>'));
						$("#codelisttable_tbody").prepend(trCode);
						setTimeout(function(){
							$("#secondary_codefrmAlert").html("");
						}, 5000);
				}
		}});// end of ajax
			} else {
				$("#secondary_codefrmAlert").html('<div id="PrimaryCodeAlretContent" class="alert alert-danger" role="alert"> 서브코드에 값을 입력하세요! </div>')
			}//end of if	
		}); //end of on
		
		$("#codelisttable_tbody").on("click", ".btncodeDelete", function(){
			var $tr = $(this).closest("tr");
				$.ajax({url : "${pageContext.request.contextPath}/categoryMajorDelete.do", // 클라이언트가 요청을 보낼 서버의 URL 주소
						data : {no : $(this).closest("tr").children().eq(0).text()},
								type : "GET", // HTTP 요청 방식(GET, POST)
								success : function(data) {
									if (data != 0) {
										$tr.remove();
									} else {
										alert("실패");
									}
								}
							});
				});
		
		var cntForUpdateBtn = 0;
		var whichUpdateBtn;
		$("#codelisttable_tbody").on("click", ".btncodeUpdate", function(){
			if(cntForUpdateBtn == 0){
				whichUpdateBtn = $(this);
				whichUpdateBtn.next().attr('disabled', true);
				cntForUpdateBtn++;
				var pplist = JSON.parse('${pplist}');
				var $slideSelect = $("<select>");
				 $slideSelect.attr("id", "toggleupdateSelect");
				for(i=0; i< pplist.length; i++){
					if(pplist[i].primary_code == whichUpdateBtn.closest("tr").children().eq(1).text()){
						$slideSelect.append($("<option>").val(pplist[i].primary_code).text(pplist[i].primary_code).attr("selected","selected").data("code_name", pplist[i].code_name));
					} else{
						$slideSelect.append($("<option>").val(pplist[i].primary_code).text(pplist[i].primary_code).data("code_name", pplist[i].code_name));
					}
				}
				
				var $slideDiv = $("<tr>").attr("id", "updateslide")
								.append("<td><div class='toggleupdate'>"+whichUpdateBtn.closest("tr").children().eq(0).text()+"</div></td>")
								.append($("<td>").append($("<div>").attr("class","toggleupdate").append($slideSelect)))
								.append("<td><div class='toggleupdate' id='toggleupdateDivCodeName'>"+whichUpdateBtn.closest("tr").children().eq(2).text()+"</div></td>")
								.append("<td><div class='toggleupdate'>"+whichUpdateBtn.closest("tr").children().eq(3).text()+"</div></td>")
								.append("<td><div class='toggleupdate'><input id='toggleupdateCode_info'></div></td>")
									.append("<td><div class='toggleupdate'><button type='button' id='btnUpdateFin' class='btn btn-sm btn-warning'>&nbsp&nbsp&nbsp 수정 &nbsp&nbsp&nbsp</button></div></td>")
			
								
								.css("background-color", "#FFE3AA");
							
				$(this).closest("tr").after($slideDiv)
				
				$("#updateslide").show("slow");
				whichUpdateBtn.text("취소");
				
				$(".toggleupdate").slideToggle("fast");
			} else {
				if($(this).closest("tr").children().eq(0).text() == whichUpdateBtn.closest("tr").children().eq(0).text()){
					$(".toggleupdate").slideToggle("fast");
					$("#updateslide").hide("slow");
					setTimeout(function(){
						$("#updateslide").remove();
						cntForUpdateBtn = 0;
						whichUpdateBtn.text("수정");
						whichUpdateBtn.next().attr('disabled', false);
						whichUpdateBtn = null;
					}, 1000);
				}
			}
			
			
			
		});
		
		$("#codelisttable_tbody").on("change", "#toggleupdateSelect", function(){
			$("#toggleupdateDivCodeName").text($("#toggleupdateSelect option:selected").data("code_name"));
			
		});
		$("#codelisttable_tbody").on("click", "#btnUpdateFin", function(){
			var $finTr = $(this).closest("tr").children();
			if($("#toggleupdateCode_info").val() != null && $("#toggleupdateCode_info").val() != ""){
			var finUpdate1 = $finTr.eq(0).find("div").text();
			var finUpdate2 = $("#toggleupdateSelect option:selected").val();
			var finUpdate3 = $("#toggleupdateSelect option:selected").data("code_name");
			var finUpdate4 = $finTr.eq(3).find("div").text();
			var finUpdate5 = $("#toggleupdateCode_info").val();
			
			$.ajax({
				url : "${pageContext.request.contextPath}/codeUpdate.do",
				data : {code_no:finUpdate1, primary_code:finUpdate2, code_name:finUpdate3, secondary_code:finUpdate4, code_info:finUpdate5},
				type : "post",
				dataType : "json",
				success : function(data){
					
						console.log(data)
					if(data.code_no != null && data.code_no != ""){
						$("#btnUpdateFin").closest("tr").prev().children().eq(1).text(data.primary_code);
						$("#btnUpdateFin").closest("tr").prev().children().eq(2).text(data.code_name);
						$("#btnUpdateFin").closest("tr").prev().children().eq(3).text(data.secondary_code);
						$("#btnUpdateFin").closest("tr").prev().children().eq(4).text(data.code_info);
						$(".toggleupdate").slideToggle("fast");
						$("#updateslide").hide("slow");
						setTimeout(function(){
							$("#updateslide").remove();
							cntForUpdateBtn = 0;
							whichUpdateBtn.text("수정");
							whichUpdateBtn.next().attr('disabled', false);
							whichUpdateBtn = null;
						}, 1000);
					} else {
						$(".toggleupdate").slideToggle("fast");
						$("#updateslide").hide("slow");
						setTimeout(function(){
							$("#updateslide").remove();
							cntForUpdateBtn = 0;
							whichUpdateBtn.text("수정");
							whichUpdateBtn.next().attr('disabled', false);
							whichUpdateBtn = null;
						}, 1000);
					}
				}
			});
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
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/codeList.do">코드관리</a></li>
				<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/categoryList.do">자재중분류관리</a></li>
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
				
				<tbody id="codelisttable_tbody" class="table table-striped">
					<c:forEach items="${alist}" var="a">
						<tr>
							<td>${a.code_no}</td>
							<td>${a.primary_code }</td>
							<td>${a.code_name}</td>
							<td>${a.secondary_code }</td>
							<td>${a.code_info }</td>
							<td><div class="btn-group btn-group-sm" role="group"
									aria-label="Basic example">
									<button type="button" class="btn btn-secondary btncodeUpdate">수정</button>
									<button type="button" class="btn btn-danger btncodeDelete">삭제</button>
								</div></td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>
	</div>
	<hr>
	<div class="container">
		<h3>주코드 & 서브코드 추가</h3>
		<hr>
		<div class="row">
			<div class="col-sm">
				새로운 주 코드를 생성할껀가요?
				<hr>
				<form id="primary_codefrm">
					<input id="primary_codeInsert" type="text" name="code_name">
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
					<form id="secondary_codefrm">
						<label for="primary_code">어느 주 코드에 넣을껀가요?</label>
						<select  name="primary_code" class="custom-select">
							<c:forEach items="${plist}" var="p">
					<option value="${p.primary_code}, ${p.code_name}" <c:if test="${param.isChoose == p.primary_code}">selected="selected"</c:if>>${p.code_name}</option>
					</c:forEach>
			</select>
			<hr>
						<input id="code_infoForSCfrm" type="text" name="code_info">
						<div class="btn-group btn-group-sm"
									aria-label="Basic example">
									<button id="btnSecondaryCode" type="button" class="btn btn-secondary">추가</button>
								</div>
								<div id="secondary_codefrmAlert"></div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-sm">
					<br>
					<hr>
				</div>
			</div>
			
		</div>
	
</body>
</html>