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

			<div class="panel-heading">${member.member_id}님의 회원 정보</div>
			<!-- /.panel-heading -->
			<div class="panel-body">

				<div class="form-group">
					<label>아이디</label> <div>${member.member_id }</div>
				</div>

				<div class="form-group">
					<label>닉네임</label> <div>${member.nickname }</div>
				</div>

				<div class="form-group">
					<label>이메일</label> <div>${member.email }</div>
				</div>

				<div class="form-group">
					<label>생일</label>
					<c:choose>
						<c:when test="${member.birthday != null}">
							<div id="showBirth">${member.birthday}</div>
						</c:when>
						<c:otherwise>
							<div id="showBirth">미입력</div>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class="form-group">
					<label>성별</label>
					<c:choose>
						<c:when test="${member.sex == 1}">
							<div>남성</div>
						</c:when>
						<c:when test="${member.sex == 2}">
							<div>여성</div>
						</c:when>
						<c:otherwise>
							<div>미입력</div>
						</c:otherwise>
					</c:choose>
				</div>

				<button data-oper="modify" class="btn btn-default">회원 정보 수정</button>

				<form id="operForm" action="${contextPath}/member/modify" method="get">
					<input type="hidden" name="member_id" value="${member.member_id}">
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
	
		function convertToDateFormat(dateString) {
	        // 문자열에서 연, 월, 일을 추출
	        const year = dateString.substring(0, 4);
	        const month = dateString.substring(5, 7);
	        const day = dateString.substring(8, 10);
	
	        // yyyyMMdd 형식으로 변환
	        return year + "년 " + month + "월 " + day + "일";
	    }
	
		$(document).ready(function() {
			
            const dateString = $('#showBirth').html();
            
			if (dateString != '미입력') {
				const formattedDate = convertToDateFormat(dateString);
            	
				if (formattedDate) {
	                $('#showBirth').html(formattedDate);
	            }
			}
			
			// 수정 버튼 클릭시 수정 페이지로 이동
			var operForm = $("#operForm");
			$("button[data-oper='modify']").on("click", function(e) {
				operForm.attr("action", "${contextPath}/member/modify").submit();
			});
		});
	</script>
	
	<script>
	    $(document).ready(function () {
	        // result 변수가 정의되어 있는지 확인
	        var result = '${result}' || '';
	        
	        setTimeout(() => {
	        	if (result === 'success') {
		            alert('회원 정보를 수정했습니다.');
		        }
			}, 100);
	    });
    </script>
	
	<%@include file="../includes/footer.jsp"%>