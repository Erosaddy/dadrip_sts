<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/board.css">
<div class="row">
	<div class="col-lg-12">
		<h1 class="page-header">Tables</h1>
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->
<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-default">
			<div class="panel-heading">
				Joke List Page
				<button id="regBtn" type="button"
					class="btn btn-xs pull-right btn-primary">Post</button>
			</div>

			<div class="panel-body">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<!-- <th>조회수</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="joke">
							<tr>
								<td>${joke.joke_id }</td>
								<td><a class="move" href="${joke.joke_id }">${joke.joke_question }<%-- &nbsp;&nbsp;<b>[${joke.replycnt }]</b> --%></a></td>
								<td>${joke.member_id }</td>
								<td><fmt:formatDate value="${joke.created_on }"
										pattern="yyyy-MM-dd HH:mm" /></td>
								<%-- <td>${joke.viewcnt }</td> --%>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="row">
					<div class="col-lg-12">
						<form id="searchForm" action="${ctx }joke/list" method="get">
							<select name="type">
								<option value=""
									<c:out value="${pageMaker.cri.type == null ? 'selected' : ''}" />>-------</option>
								<option value="T"
									<c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}" />>제목</option>
								<option value="C"
									<c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}" />>내용</option>
								<option value="W"
									<c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}" />>작성자</option>
								<option value="TC"
									<c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}" />>제목
									+ 내용</option>
								<option value="TW"
									<c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}" />>제목
									+ 작성자</option>
								<option value="TCW"
									<c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}" />>제목
									+ 내용 + 작성자</option>
							</select> <input type="text" name="keyword" placeholder="검색어"
								value="${pageMaker.cri.keyword }"> <input type="hidden"
								name="pageNum" value="${pageMaker.cri.pageNum }"> <input
								type="hidden" name="amount" value="${pageMaker.cri.amount }">
							<button class="btn btn-default">Search</button>
						</form>
					</div>
				</div>

				<div class="text-center">
					<ul class="pagination">

						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a
								href="${pageMaker.startPage - 1}"> < </a></li>
						</c:if>

						<c:forEach var="num" begin="${pageMaker.startPage }"
							end="${pageMaker.endPage }">
							<li
								class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : '' }"><a
								href="${num }">${num }</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next }">
							<li class="paginate_button next"><a
								href="${pageMaker.endPage + 1}"> > </a></li>
						</c:if>

					</ul>
				</div>

				<form id="actionForm" action="${ctx }/joke/list" method="get">
					<input type="hidden" name="pageNum"
						value="${pageMaker.cri.pageNum }"> <input type="hidden"
						name="amount" value="${pageMaker.cri.amount }"> <input
						type="hidden" name="type" value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword"
						value="${pageMaker.cri.keyword }">
				</form>

				<!-- 모달 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="submit" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<!-- 실질적으로는 하드코딩이 아니라 jstl 이용해서 뽑아와야 한다 -->
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary">Save Changes</button>
							</div>
						</div>
						<!-- .modal-content -->
					</div>
				</div>
				<!-- .modal fade -->
			</div>
			<!-- /.panel-body -->
		</div>
		<!-- /.panel -->
	</div>
	<!-- /.col-lg-12 -->
</div>
<!-- /.row -->


<script>
	$(document).ready(function() {
		var result = "${result}";
		console.log("result ==============> " + result);
		
		checkModal(result);

		/* 뒤로 가면 다시 모달이 뜨기 때문에 막아버리기 */
		history.replaceState({}, null, null);

		function checkModal(result) {
			if (result == "" || history.state) {
				return;
			}
			if (parseInt(result) > 0) {
				/* var을 받기 때문에 기초형인 int로 바꿔주는 거시다. */
				$(".modal-body").html("게시글 " + parseInt(result) + "번이 등록되었습니다.");
			}
			$("#myModal").modal("show");
		}

		$("#regBtn").on("click", function() {
			self.location = "${ctx}/joke/register";
		});

		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			console.log("click");
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});

		$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='joke_id' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "${ctx}/joke/read");
			actionForm.submit();
		});

		var searchForm = $("#searchForm");
		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected")
					.val()) {
				alert("검색 종류를 선택하세요");

				return false;
			}

			if (!searchForm.find(
					"input[name='keyword']").val()) {
				alert("검색어를 입력하세요");

				return false;
			}

			searchForm.find("input[name='pageNum']")
					.val("1");

			e.preventDefault();
			searchForm.submit();
		});

	});
</script>

<%@include file="../includes/footer.jsp"%>