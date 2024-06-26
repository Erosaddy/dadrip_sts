<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@include file="../includes/header.jsp"%>
<link rel="stylesheet" href="/resources/css/jokeMain.css">
<style>
	tr {
		display: flex;
	}
	
	#likeCountTd, #dislikeCountTd {
		display: inline;
	}
	
	.py-5 {
		padding-top: 5px;
		padding-bottom: 5px;
	}
	
	.font-14 {
		font-size: 14px;
	}
	
	#eachJoke {
		display: flex;
		justify-content: space-between;
	}
	
	#likeCountTd,
	#dislikeCountTd{
		opacity: .3;
	}
</style>    
    <main>
        <div id="container" class="mx-auto">
            <div class="bestBox">
                <div id="box-header">
                    <a href="${ctx}/joke/listBest?timeScope=day"><h3>오늘의 베스트</h3></a><a href="${ctx}/joke/listBest?timeScope=day"><p>더보기</p></a>
                </div>
                <hr>
                <c:forEach items="${listDay }" var="joke">
	                <div id="eachJoke" class="py-5 font-14">
						<tr>
							<span>
								<td><a class="move" href="${joke.joke_id }">${joke.joke_question }&nbsp;&nbsp;<b>[${joke.reply_count }]</b></a></td>
							</span>
							<span>
								<td>
									<div id="likeCountTd">
										<img src="/resources/images/filledLikeBtn.png" alt="filled like button" style="width: 15px; height: 15px;">
										${joke.like_count }
									</div>
							    </td>
								<td>
									<div id="dislikeCountTd">
										<img src="/resources/images/filledDislikeBtn.png" alt="filled dislike button" style="width: 15px; height: 15px;">
										${joke.dislike_count }
									</div>
								</td>
							</span>
						</tr>
					</div>
					<hr>
				</c:forEach>
                
            </div>

            <div class="bestBox">
                <div id="box-header">
                    <a href="${ctx}/joke/listBest?timeScope=week"><h3>이번주 베스트</h3></a><a href="${ctx}/joke/listBest?timeScope=week"><p>더보기</p></a>
                </div>
                <hr>
                <c:forEach items="${listWeek }" var="joke">
					<div id="eachJoke" class="py-5 font-14">
						<tr>
							<span>
								<td><a class="move" href="${joke.joke_id }">${joke.joke_question }&nbsp;&nbsp;<b>[${joke.reply_count }]</b></a></td>
							</span>
							<span>
								<td>
									<div id="likeCountTd">
										<img src="/resources/images/filledLikeBtn.png" alt="filled like button" style="width: 15px; height: 15px;">
										${joke.like_count }
									</div>
							    </td>
								<td>
									<div id="dislikeCountTd">
										<img src="/resources/images/filledDislikeBtn.png" alt="filled dislike button" style="width: 15px; height: 15px;">
										${joke.dislike_count }
									</div>
								</td>
							</span>
						</tr>
					</div>
					<hr>
				</c:forEach>
            </div>

            <div class="bestBox">
                <div id="box-header">
                    <a href="${ctx}/joke/listBest?timeScope=month"><h3>이번달 베스트</h3></a><a href="${ctx}/joke/listBest?timeScope=month"><p>더보기</p></a>
                </div>
                <hr>
                <c:forEach items="${listMonth }" var="joke">
					<div id="eachJoke" class="py-5 font-14">
						<tr>
							<span>
								<td><a class="move" href="${joke.joke_id }">${joke.joke_question }&nbsp;&nbsp;<b>[${joke.reply_count }]</b></a></td>
							</span>
							<span>
								<td>
									<div id="likeCountTd">
										<img src="/resources/images/filledLikeBtn.png" alt="filled like button" style="width: 15px; height: 15px;">
										${joke.like_count }
									</div>
							    </td>
								<td>
									<div id="dislikeCountTd">
										<img src="/resources/images/filledDislikeBtn.png" alt="filled dislike button" style="width: 15px; height: 15px;">
										${joke.dislike_count }
									</div>
								</td>
							</span>
						</tr>
					</div>
					<hr>
				</c:forEach>
            </div>

            <div class="bestBox">
                <div id="box-header">
                    <a href="${ctx}/joke/listBest"><h3>올타임 베스트</h3></a><a href="${ctx}/joke/listBest"><p>더보기</p></a>
                </div>
                <hr>
                <c:forEach items="${listAlltime }" var="joke">
					<div id="eachJoke" class="py-5 font-14">
						<tr>
							<span>
								<td><a class="move" href="${joke.joke_id }">${joke.joke_question }&nbsp;&nbsp;<b>[${joke.reply_count }]</b></a></td>
							</span>
							<span>
								<td>
									<div id="likeCountTd">
										<img src="/resources/images/filledLikeBtn.png" alt="filled like button" style="width: 15px; height: 15px;">
										${joke.like_count }
									</div>
							    </td>
								<td>
									<div id="dislikeCountTd">
										<img src="/resources/images/filledDislikeBtn.png" alt="filled dislike button" style="width: 15px; height: 15px;">
										${joke.dislike_count }
									</div>
								</td>
							</span>
						</tr>
					</div>
					<hr>
				</c:forEach>
            </div>
            
            <div class="bestBox">
                <div id="box-header">
                    <a href="${ctx}/joke/list"><h3>전체 농담 조회&nbsp;(최신순)</h3></a><a href="${ctx}/joke/listBest"><p>더보기</p></a>
                </div>
                <hr>
                <c:forEach items="${list }" var="joke">
					<div id="eachJoke" class="py-5 font-14">
						<tr>
							<span>
								<td><a class="move" href="${joke.joke_id }">${joke.joke_question }&nbsp;&nbsp;<b>[${joke.reply_count }]</b></a></td>
							</span>
							<span>
								<td>
									<div id="likeCountTd">
										<img src="/resources/images/filledLikeBtn.png" alt="filled like button" style="width: 15px; height: 15px;">
										${joke.like_count }
									</div>
							    </td>
								<td>
									<div id="dislikeCountTd">
										<img src="/resources/images/filledDislikeBtn.png" alt="filled dislike button" style="width: 15px; height: 15px;">
										${joke.dislike_count }
									</div>
								</td>
							</span>
						</tr>
					</div>
					<hr>
				</c:forEach>
            </div>
            
        </div> <!-- #container 끝 -->
        
        <form id="actionForm" action="${ctx}/joke/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount }"> 
			<input type="hidden" name="type" value="${pageMaker.cri.type }">
			<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
		</form>
        
    </main>
    <footer>

    </footer>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script>
    
    	var actionForm = $("#actionForm");
    	
   	 	$(".move").on("click", function(e) {
			e.preventDefault();
			actionForm.append("<input type='hidden' name='joke_id' value='" + $(this).attr("href") + "'>");
			actionForm.attr("action", "${ctx}/joke/read");
			actionForm.submit();
		});
    </script>    
    
<%@include file="../includes/footer.jsp"%>