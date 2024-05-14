<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<c:set var="contextPath"
	value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }"
	scope="application" />
<style>
.uploadResult {
	width: 100%;
	background-color: gray;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
	align-content: center;
	text-align: center;
}

.uploadResult ul li img {
	width: 100px;
}

.uploadResult ul li span {
	color: white;
}

.bigPictureWrapper {
	position: absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height: 100%;
	background-color: gray;
	z-index: 1000;
	background: rgba(255, 255, 255, 0.5);
}

.bigPicture {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
}

.bigPicture img {
	width: 600px;
}
</style>
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Mypage</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">

			<div class="panel-heading">${memberInfo.member_id}님의 회원 정보</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					<label>아이디</label> <input class="form-control" name="member_id"
						value="${memberInfo.member_id }" readonly="readonly">
				</div>

				<div class="form-group">
					<label>닉네임</label> <input class="form-control" name="nickname"
						value="${memberInfo.nickname }" readonly="readonly">
				</div>

				<div class="form-group">
					<label>이메일</label> <input class="form-control" name="email"
						value="${memberInfo.email }" readonly="readonly">
				</div>

				<div class="form-group">
					<label>생일</label>
					<c:choose>
						<c:when test="${memberInfo.birthday != null}">
							<fmt:formatDate value="${memberInfo.birthday}" pattern="yyyy/MM/dd" var="formattedDate"/>
							<input class="form-control" name="email" value="${formattedDate}" readonly="readonly">
						</c:when>
						<c:otherwise>
							<input class="form-control" name="email" value="미입력" readonly="readonly">
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="form-group">
					<label>성별</label>
					<c:choose>
						<c:when test="${memberInfo.sex == 1}">
							<input class="form-control" name="sex" value="남성" readonly="readonly">
						</c:when>
						<c:when test="${memberInfo.sex == 2}">
							<input class="form-control" name="sex" value="여성" readonly="readonly">
						</c:when>
						<c:otherwise>
							<input class="form-control" name="sex" value="미입력" readonly="readonly">
						</c:otherwise>
					</c:choose>
				</div>

				<button data-oper="modify" class="btn btn-default">Modify</button>
				<button data-oper="list" class="btn btn-info">List</button>

				<form id="operForm" action="${contextPath}/joke/modify" method="get">
					<input type="hidden" id="joke_id" name="joke_id" value="${joke.joke_id}"> 
					<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}"> 
					<input type="hidden" id="amount" name="amount" value="${cri.amount}">
					<input type="hidden" name="type" value="${cri.type}"> 
					<input type="hidden" name="keyword" value="${cri.keyword}">
				</form>
			</div>
			<!--  end panel-body -->

		</div>
		<!--  end panel-body -->
	</div>
	<!-- end panel -->
</div>
<!-- /.row -->

<div class='bigPictureWrapper'>
	<div class='bigPicture'></div>
</div>

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<!--  end panel-heading -->
		</div>
		<!-- end panel -->
	</div>
	<!-- /.row -->

	<script type="text/javascript">
		$(document).ready(function() {
			var operForm = $("#operForm");
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "${contextPath}/joke/modify").submit();
			});

			$("button[data-oper='list']").on("click", function(e) {
				operForm.find("#joke_id").remove();
				operForm.attr("action", "${contextPath}/joke/list")
				operForm.submit();
			});
		});
	</script>

	<%@include file="../includes/footer.jsp"%>