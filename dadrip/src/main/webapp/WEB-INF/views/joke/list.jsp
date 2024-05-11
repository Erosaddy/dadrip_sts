<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<!-- <link rel="stylesheet" href="/resources/css/board.css"> -->
<!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
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
							<th>조회수</th>
							<th>좋아요</th>
							<th>싫어요</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="joke">
							<tr>
								<td>${joke.joke_id }</td>
								<td><a class="move" href="${joke.joke_id }">${joke.joke_question }&nbsp;&nbsp;<b>[${joke.reply_count }]</b></a></td>
								<td>${joke.member_id }</td>
								<td><fmt:formatDate value="${joke.created_on }" pattern="yyyy-MM-dd HH:mm" /></td>
								<td>${joke.view_count }</td>
								<td>
									<div id="likeCountTd">
										${joke.like_count }
									</div>
						        	<ul class="like">
						        	</ul>
							    </td>
								<td>
									<div id="dislikeCountTd">
										${joke.dislike_count }
									</div>
									<ul class="dislike">
						        	</ul>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="row">
					<div class="col-lg-12">
						<form id="searchForm" action="${ctx }/joke/list" method="get">
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
							</select>
								<input type="text" name="keyword" placeholder="검색어" value="${pageMaker.cri.keyword }">
								<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }"> 
								<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
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

				<form id="actionForm" action="${ctx}/joke/list" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
					<input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
					<input type="hidden" name="type" value="${pageMaker.cri.type }">
					<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
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

<script type="text/javascript">
/* window.onload = function() {
	history.pushState(null, null, location.href);
    window.onpopstate = function() {
	alert("sss");
    	
        history.go(1);
	};
};  */

$(document).ready(function() {
	// Select all joke rows
    var jokeRows = $("tr");
	var memberIdValue = $('#SessionMemberId').val();
	console.log("memberIdValue........." + memberIdValue);
	
    jokeRows.each(function(index) {
        // Get the joke_id for the current joke
        var jokeIdValue = $(this).find("td:first").text().trim();
        // Select the like and dislike UL elements within the current row
        var likeUL = $(this).find(".like");
        var dislikeUL = $(this).find(".dislike");
        
        // Log the joke_id for testing
        console.log("joke_id =======> " + jokeIdValue);
        
        // Call showVote function for each joke
        showVote(jokeIdValue, likeUL, dislikeUL);
    });
    
	function showVote(jokeIdValue, likeUL, dislikeUL) {
		if (memberIdValue == null || memberIdValue == "") {
			// 회원가입이 되지 않았을 때. 좋아요 / 싫어요 둘 다 빈 그림 보여주기
			likeStr = "<div><button type=\"button\"><img src=\"/resources/images/emptyLikeBtn.png\" alt=\"empty like button\" style=\"width: 36px; height: 36px;\"></button></div>";
			dislikeStr = "<div><button type=\"button\"><img src=\"/resources/images/emptyDislikeBtn.png\" alt=\"empty dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";
			likeUL.html(likeStr);
			dislikeUL.html(dislikeStr);
		} else {
			voteService.getList(
				{joke_id:jokeIdValue, 
				 member_id:memberIdValue, 
				 contextPath:"${contextPath}"}
				, 
				function(vote_id, vote_type, joke_id) {
					var likeStr="";
					var dislikeStr="";
					/* console.log("returned vote_type from getList =========> " + vote_type); */
					if (vote_type == "1") {
						// 좋아요에 투표되어있다는 의미.
						likeStr = "<div data-joke_id=\"" + joke_id + "\" data-vote_type=\"" + vote_type + "\"><button type=\"button\"><img src=\"/resources/images/filledLikeBtn.png\" alt=\"filled like button\" style=\"width: 36px; height: 36px;\"></button></div>";
						dislikeStr = "<div data-joke_id=\"" + joke_id + "\" data-vote_type=\"" + vote_type + "\"><button type=\"button\"><img src=\"/resources/images/emptyDislikeBtn.png\" alt=\"empty dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";
						
					} else if (vote_type == "2") {
						// 싫어요에 투표되어있다는 의미.
						likeStr = "<div data-joke_id=\"" + joke_id + "\" data-vote_type=\"" + vote_type + "\"><button type=\"button\"><img src=\"/resources/images/emptyLikeBtn.png\" alt=\"empty like button\" style=\"width: 36px; height: 36px;\"></button></div>";
						dislikeStr = "<div data-joke_id=\"" + joke_id + "\" data-vote_type=\"" + vote_type + "\"><button type=\"button\"><img src=\"/resources/images/filledDislikeBtn.png\" alt=\"filled dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";
						
					} else {
						// 좋아요 / 싫어요 모두 선택하지 않았다는 의미.
						// 결과값에서 받아올 수 없으니 별개로 지정
						var jokeId = $('.like').closest('tr').find("td:first").text();
						console.log("jokeId ==========> " + jokeId);
						likeStr = "<div data-joke_id=\"" + jokeId + "\" data-vote_type=\"\"><button type=\"button\"><img src=\"/resources/images/emptyLikeBtn.png\" alt=\"empty like button\" style=\"width: 36px; height: 36px;\"></button></div>";
						dislikeStr = "<div data-joke_id=\"" + jokeId + "\" data-vote_type=\"\"><button type=\"button\"><img src=\"/resources/images/emptyDislikeBtn.png\" alt=\"empty dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";
						
					}
					likeUL.html(likeStr);
					dislikeUL.html(dislikeStr);
				});//end function
		}
	}//end showVote
	
	
	//좋아요 버튼 누르기

	// 넘어가야 하는 정보는 joke_id, vote_type, member_id
    $(document).on("click", ".like div", function(e) {
    	
    	var voteType = $(this).data("vote_type");
    	var jokeIdValue = $(this).closest('tr').find("td:first").text();
   	 	var likeUL = $(this).closest('tr').find(".like");
        var dislikeUL = $(this).closest('tr').find(".dislike");
        
        // 좋아요 혹은 싫어요 클릭시 숫자를 바로 바꿔주는 데 사용할 변수(빠른 반응성을 위해 데이터베이스에서 가져오는 것이 아니라 화면에서 바로 변경)
        var likeCountTd = $(this).closest('tr').find("td:eq(5)").find("#likeCountTd");
        var likeCountValue = parseInt($(this).closest('tr').find("td:eq(5)").find("#likeCountTd").text());
        var dislikeCountTd = $(this).closest('tr').find("td:eq(6)").find("#dislikeCountTd");
        var dislikeCountValue = parseInt($(this).closest('tr').find("td:eq(6)").find("#dislikeCountTd").text());
        	
    	if (voteType == "1") {
		// 1. 좋아요가 이미 눌려있었다면 좋아요 지우기(remove)
    		var vote = {
        			joke_id: jokeIdValue,
        			member_id: memberIdValue,
        			contextPath:"${contextPath}"
        		};
    		
    		voteService.remove(vote, function(result) {
    			console.log(result);
    		});
            
            likeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"\"><button type=\"button\"><img src=\"/resources/images/emptyLikeBtn.png\" alt=\"empty like button\" style=\"width: 36px; height: 36px;\"></button></div>";
			dislikeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"\"><button type=\"button\"><img src=\"/resources/images/emptyDislikeBtn.png\" alt=\"empty dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";

			$(likeUL).html(likeStr);
			$(dislikeUL).html(dislikeStr);
			
			$(likeCountTd).html(likeCountValue - 1);
			
    	} else if (voteType == "2") {
    		// 2. 좋아요가 비어있지만 싫어요는 눌려있다면 vote_type을 2에서 1로 수정(update)
    		
    		var vote = {
    				joke_id: jokeIdValue,
        			member_id: memberIdValue,
        			vote_type: "1",
        			contextPath:"${contextPath}"
        		};
    		
    		voteService.update(vote, function(result) {
    			console.log(result);
    		});
    		
            likeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"1\"><button type=\"button\"><img src=\"/resources/images/filledLikeBtn.png\" alt=\"filled like button\" style=\"width: 36px; height: 36px;\"></button></div>";
			dislikeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"1\"><button type=\"button\"><img src=\"/resources/images/emptyDislikeBtn.png\" alt=\"empty dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";

			$(likeUL).html(likeStr);
			$(dislikeUL).html(dislikeStr);
			
			$(likeCountTd).html(likeCountValue + 1);
			$(dislikeCountTd).html(dislikeCountValue - 1);
			
    	} else {
    		// 3. 좋아요가 비어있고 싫어요도 비어있다면 좋아요 추가(add)
    		console.log("jokeIdValue ===========> " + jokeIdValue);
    		var vote = {
    				// 위에서 사용중인 농담 번호 찾기 로직은 싫어요든 좋아요든 어떤 결과값이 있어야만 번호를 찾아올 수 있다는 한계가 있다.
    				// 설계상의 문제지만 새롭게 만들기엔 시간이 부족하기 때문에 임시방편으로 다른 방법을 사용해 번호를 찾아오도록 했다.
    				joke_id: jokeIdValue,	
        			member_id: memberIdValue,
        			vote_type: "1",
        			contextPath:"${contextPath}"
        		};
    		
    		voteService.add(vote, function(result) {
        		console.log(result);
    		});
    		
    		likeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"1\"><button type=\"button\"><img src=\"/resources/images/filledLikeBtn.png\" alt=\"filled like button\" style=\"width: 36px; height: 36px;\"></button></div>";
			dislikeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"1\"><button type=\"button\"><img src=\"/resources/images/emptyDislikeBtn.png\" alt=\"empty dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";

			$(likeUL).html(likeStr);
			$(dislikeUL).html(dislikeStr);
    		
			$(likeCountTd).html(likeCountValue + 1);
    	}
    	
	});

	
  //싫어요 버튼 누르기

	// 넘어가야 하는 정보는 joke_id, vote_type, member_id
    $(document).on("click", ".dislike div", function(e) {
    	
    	var voteType = $(this).data("vote_type");
    	var jokeIdValue = $(this).closest('tr').find("td:first").text();
   	 	var likeUL = $(this).closest('tr').find(".like");
        var dislikeUL = $(this).closest('tr').find(".dislike");
        
     // 좋아요 혹은 싫어요 클릭시 숫자를 바로 바꿔주는 데 사용할 변수(빠른 반응성을 위해 데이터베이스에서 가져오는 것이 아니라 화면에서 바로 변경)
        var likeCountTd = $(this).closest('tr').find("td:eq(5)").find("#likeCountTd");
        var likeCountValue = parseInt($(this).closest('tr').find("td:eq(5)").find("#likeCountTd").text());
        var dislikeCountTd = $(this).closest('tr').find("td:eq(6)").find("#dislikeCountTd");
        var dislikeCountValue = parseInt($(this).closest('tr').find("td:eq(6)").find("#dislikeCountTd").text());
        
    	if (voteType == "2") {
		// 1. 싫어요가 이미 눌려있었다면 싫어요 지우기(remove)
    		var vote = {
        			joke_id: jokeIdValue,
        			member_id: memberIdValue,
        			contextPath:"${contextPath}"
        		};
    		
    		voteService.remove(vote, function(result) {
    			console.log(result);
    		});
            
            likeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"\"><button type=\"button\"><img src=\"/resources/images/emptyLikeBtn.png\" alt=\"empty like button\" style=\"width: 36px; height: 36px;\"></button></div>";
			dislikeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"\"><button type=\"button\"><img src=\"/resources/images/emptyDislikeBtn.png\" alt=\"empty dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";

			$(likeUL).html(likeStr);
			$(dislikeUL).html(dislikeStr);
			
			$(dislikeCountTd).html(dislikeCountValue - 1);
			
    	} else if (voteType == "1") {
    		// 2. 싫어요가 비어있지만 좋아요는 눌려있다면 vote_type을 1에서 2로 수정(update)
    		
    		var vote = {
    				joke_id: jokeIdValue,
        			member_id: memberIdValue,
        			vote_type: "2",
        			contextPath:"${contextPath}"
        		};
    		
    		voteService.update(vote, function(result) {
    			console.log(result);
    		});
    		
            likeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"2\"><button type=\"button\"><img src=\"/resources/images/emptyLikeBtn.png\" alt=\"empty like button\" style=\"width: 36px; height: 36px;\"></button></div>";
			dislikeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"2\"><button type=\"button\"><img src=\"/resources/images/filledDislikeBtn.png\" alt=\"filled dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";

			$(likeUL).html(likeStr);
			$(dislikeUL).html(dislikeStr);
			
			$(dislikeCountTd).html(dislikeCountValue + 1);
			$(likeCountTd).html(likeCountValue - 1);
            
    	} else {
    		// 3. 좋아요가 비어있고 싫어요도 비어있다면 싫어요 추가(add)
    		console.log("jokeIdValue ===========> " + jokeIdValue);
    		var vote = {
    				// 위에서 사용중인 농담 번호 찾기 로직은 싫어요든 좋아요든 어떤 결과값이 있어야만 번호를 찾아올 수 있다는 한계가 있다.
    				// 설계상의 문제지만 새롭게 만들기엔 시간이 부족하기 때문에 임시방편으로 다른 방법을 사용해 번호를 찾아오도록 했다.
    				joke_id: jokeIdValue,	
        			member_id: memberIdValue,
        			vote_type: "2",
        			contextPath:"${contextPath}"
        		};
    		
    		voteService.add(vote, function(result) {
        		console.log(result);
    		});
    		
    		likeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"2\"><button type=\"button\"><img src=\"/resources/images/emptyLikeBtn.png\" alt=\"empty like button\" style=\"width: 36px; height: 36px;\"></button></div>";
			dislikeStr = "<div data-joke_id=\"" + jokeIdValue + "\" data-vote_type=\"2\"><button type=\"button\"><img src=\"/resources/images/filledDislikeBtn.png\" alt=\"filled dislike button\" style=\"width: 36px; height: 36px;\"></button></div>";

			$(likeUL).html(likeStr);
			$(dislikeUL).html(dislikeStr);
    		
			$(dislikeCountTd).html(dislikeCountValue + 1);
    	}
    	
	});

    /*
    $(".chat").on("click", "li", function(e){
    	var reply = {
    		reply_id : $(this).data("reply_id"),
    		contextPath:"${contextPath}"
    	};

    	voteService.get(reply, function(reply){
    		modalInputReplyText.val(reply.content);
    		modalInputReplier.val(reply.member_id);
    		modalInputReplyDate.val(voteService.displayTime(reply.created_on)).attr("readonly","readonly");
    		modal.data("reply_id", reply.reply_id);
    		
    		modal.find("button[id !='modalCloseBtn']").hide();
    		modalModifyBtn.show();
    		modalRemoveBtn.show();
    		
    		$(".modal").modal("show");
    	});
    });
    
    modalModifyBtn.on("click", function(e){
    	console.log("contextPath : " + "${contextPath}");
    	var reply = {
    			reply_id:modal.data("reply_id"), 
    			content: modalInputReplyText.val(),
    			contextPath:"${contextPath}"
    		};
    	
    	voteService.update(reply, function(result) {
    		alert(result);
    		
     	    modal.modal("hide");
     	    showList(pageNum);
     	});
    });

    modalRemoveBtn.on("click", function (e) {
    	var reply = {
    			rno : modal.data("reply_id"), 
    			contextPath:"${contextPath}"
    		};
    	
    	voteService.remove(reply, function(result) {
    		alert(result);
    		
    		modal.modal("hide");
    		showList(pageNum);
    	});
    }); */
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm"); 
		$("button[data-oper='modify']").on("click", function(e){
	  	operForm.attr("action","${contextPath}/joke/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#joke_id").remove();
		operForm.attr("action","${contextPath}/joke/list")
		operForm.submit();
	});
});
</script>

<script type="text/javascript" src="${contextPath}/resources/js/vote.js"></script>

<%@include file="../includes/footer.jsp"%>