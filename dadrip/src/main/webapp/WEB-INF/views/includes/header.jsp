<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/reused.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/login.css">
    <title>Dadrip</title>
    <!-- below are leaderboard-related preparations -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link rel="stylesheet" href="/resources/css/leaderboard.css">
    <script src="https://unpkg.com/@phosphor-icons/web"></script>
    <link href="https://fonts.googleapis.com/css2?family=Rubik:wght@400;500&display=swap" rel="stylesheet" />
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
</head>
<body>
 <c:set var="ctx" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath}" scope="application"/>
 <header>
        <nav>
            <div class="container">
                <div class="logo">
                    <a href="http://localhost:9090/dadrip/main">
                        <img src="/resources/images/Dadrip_logo.PNG" alt="Dadrip logo">
                    </a>
                </div>
                <div class="navigation">
                    <a href="jokeList.html" class="px-10 text-bold">아재개그 목록</a>
                    <a href="#" class="px-10 text-bold">아재력 테스트</a>
                </div>
                <div>
                    <input type="search" placeholder="search for dad jokes" class="search">
	                    
	                    <c:choose>
	                    	<c:when test="${empty memberInfo}">
			                    <button id="btn-signin-modal" class="btn-signin-modal">로그인</button>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<button id="btn-mypage" class="btn-signin-modal">마이페이지</button>
	                    	</c:otherwise>
	                    </c:choose>
	                    
	                    <c:choose>
	                    	<c:when test="${empty memberInfo}">
                    			<button id="btn-signup-modal" class="btn-signup-modal">회원가입</button>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<button id="btn-logout" class="btn-signup-modal">로그아웃</button>
	                    	</c:otherwise>
	                    </c:choose>
                </div>
                <div>
                	<c:choose>
	                	<c:when test="${not empty memberInfo}">
							<p>${memberInfo.nickname }님 안녕하세요!</p>
	                    </c:when>
	                </c:choose>
                </div>
            </div>
        </nav>
    </header>