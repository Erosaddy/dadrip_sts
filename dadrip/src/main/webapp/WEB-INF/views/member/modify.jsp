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
		<h1 class="page-header">회원 정보 수정</h1>
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
			
				<form action="${contextPath}/member/modify" method="post" role="form">
					<div class="form-group">
						<label>아이디</label> <input class="form-control" name="member_id"
							value="${member.member_id }" readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>닉네임</label> <input class="form-control" name="nickname"
							value="${member.nickname }">
					</div>
					
					<div class="form-group">
						<label>이메일</label> <input class="form-control" name="email"
							value="${member.email }" readonly="readonly">
					</div>
	
					<div class="form-group">
						<label>생일&nbsp;(선택)</label>&nbsp;&nbsp;<span style="color : grey; font-size: 1.2rem;">※생일 정보를 저장하고 싶지 않은 경우 입력창을 비어있는 채로 두십시오.</span>
						<c:choose>
							<c:when test="${member.birthday != null}">
								<input id="showBirth" class="form-control" name="birthday" value="${member.birthday}" placeholder="생년월일 8자리">
							</c:when>
							<c:otherwise>
								<input id="showBirth" class="form-control" name="birthday" value="" placeholder="생년월일 8자리">
							</c:otherwise>
						</c:choose>
					</div>
					
					<div class="form-group">
						<b>성별&nbsp;(선택)</b>
						<c:choose>
							<c:when test="${member.sex == 1}">
		                    	미입력<input type="radio" name="sex" value="" />
		                        남성<input type="radio" name="sex" value="1" checked/>
		                        여성<input type="radio" name="sex" value="2" />
							</c:when>
							<c:when test="${member.sex == 2}">
								미입력<input type="radio" name="sex" value="" />
		                        남성<input type="radio" name="sex" value="1" />
		                        여성<input type="radio" name="sex" value="2" checked/>	
		                    </c:when>
							<c:otherwise>
								미입력<input type="radio" name="sex" value="" checked/>
		                        남성<input type="radio" name="sex" value="1" />
		                        여성<input type="radio" name="sex" value="2" />			
							</c:otherwise>
						</c:choose>
					</div>
					
					<input type="hidden" class="form-control" name="member_pw" value="${member.member_pw }">
					
					<button type="submit" data-oper="modify" class="btn btn-default">정보 수정</button>
					<button type="submit" data-oper="cancel" class="btn btn-default">수정 취소</button>
         			<button type="submit" data-oper="remove" class="btn btn-danger">회원 탈퇴</button>
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
    return year + month + day;
}

$(document).ready(function() {
	
	
	const dateString = $('#showBirth').val();
    
	if (dateString != '미입력') {
		const formattedDate = convertToDateFormat(dateString);
    	
		if (formattedDate) {
            $('#showBirth').val(formattedDate);
        }
	}
	
	var formObj = $("form");
	
	$("button").on("click", function(e) {
		e.preventDefault(); 
		 
		var operation = $(this).data("oper");
		 
		console.log(operation);
		 
		if(operation === "remove") {
			formObj.attr("action", "${contextPath}/member/delete");
			
		} else if (operation === "modify") {
			formObj.attr("action", "${contextPath}/member/modify");
			
		} else if (operation === "cancel") {
			window.history.back();
            return; // 폼 제출을 방지하기 위해 return 추가
		}
		
		formObj.submit();
	});
});
</script>	

	<%@include file="../includes/footer.jsp"%>