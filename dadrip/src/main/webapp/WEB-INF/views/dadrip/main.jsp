<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@include file="../includes/header.jsp" %>
<link rel="stylesheet" href="/resources/css/leaderboard.css">
    
    <main>
    
        <div id="container" class="mx-auto">
            
            <div class="main-image">
                <img src="/resources/images/laugh.jpg" alt="World laughter day">
                <div id="main-phrase" class="text-bold">
                    <p>최고의</p>
                    <p>아재개그를</p>
                    <p>한 눈에</p>
                </div>
            </div>
            
            <div class="leaderboard">

                <div id="header" class="mx-auto">
                    <div>
                        <h5><button id="todayBest">오늘의 베스트</button></h5>
                    </div>
                    <div>
                        <h5><button id="weeklyBest">이번주 베스트</button></h5>
                    </div>
                    <div>
                        <h5><button id="monthlyBest">이번달 베스트</button></h5>
                    </div>
                    <div>
                        <h5><button id="allTimeBest">올타임 베스트</button></h5>
                    </div>
                </div>
                
                <div id="leaderboard">
                    <div class="ribbon"></div>
                    <table id="jokes-table">
					    <c:set var="index" value="1" />
					    
					    <c:forEach items="${listDay}" var="joke" varStatus="status">
					        <c:if test="${status.index < 5}">
					            <tr>
					                <td class="number">${status.index + 1}</td>
					                <td class="name">
					                    <p>${joke.joke_question}</p>
					                    <p>${joke.joke_answer}</p>
					                </td>
					            </tr>
					        </c:if>
					    </c:forEach>
					    
					    <!-- 추가로 빈 칸을 채움 -->
					    <c:forEach begin="${fn:length(listDay) + 1}" end="5" var="i">
					        <tr>
					            <td class="number">${i}</td>
					            <td class="name">
					                <p></p>
					                <p></p>
					            </td>
					        </tr>
					    </c:forEach>
					</table>
					
                </div>

            </div>
        </div>

    </main>
    
    <footer>

    </footer>
    
    <script>
    	
    </script>
    
    <script src="/resources/js/bestJokes.js"></script>
    
    <script>
	    $(document).ready(function () {
	        // result 변수가 정의되어 있는지 확인
	        var result = '${result}' || '';
	        
	        if (result === 'success') {
	            alert('회원 탈퇴되었습니다.');
	        }
	    });
	    
	    
    </script>
    
<%@include file="../includes/footer.jsp"%>