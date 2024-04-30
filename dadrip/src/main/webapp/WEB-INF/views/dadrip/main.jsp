<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header.jsp" %> 
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
                        <tr>
                            <td class="number">1</td>
                            <td class="name">
                                <p></p>
                                <p></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="number">2</td>
                            <td class="name">
                                <p></p>
                                <p></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="number">3</td>
                            <td class="name">
                                <p></p>
                                <p></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="number">4</td>
                            <td class="name">
                                <p></p>
                                <p></p>
                            </td>
                        </tr>
                        <tr>
                            <td class="number">5</td>
                            <td class="name">
                                <p></p>
                                <p></p>
                            </td>
                        </tr>
                    </table>
                    
                </div>

            </div>
        </div>

    </main>
    <footer>

    </footer>
    <!-- 숨겨진 로그인/회원가입 모달 -->
    <div id="modal">
        <section id="login-body" class="mx-auto">
            <div class="login-box">
                <div class="lb-header">
                    <a href="#" class="active" id="login-box-link">로그인</a>
                    <a href="#" id="signup-box-link">회원가입</a>
                    <button class="modal-close">X</button>
                </div>
                <div class="social-login">
                    <a href="#">
                        <i class="fa fa-facebook fa-lg"></i>
                        페이스북으로 로그인하기
                    </a>
                    <a href="#">
                        <i class="fa fa-google-plus fa-lg"></i>
                        구글로 로그인하기
                    </a>
                </div>
                <form name="loginForm" class="email-login" method="post">
                    <div class="u-form-group">
                        <input id="member_id" type="text" placeholder="아이디" required name="member_id"/>
                    </div>
                    <div class="u-form-group">
                        <input id="member_pw" type="password" placeholder="비밀번호" required name="member_pw"/>
                    </div>
                    <div class="u-form-group">
                        <p id="login-error-message">
	                        <c:choose>
	                        	<c:when test="${empty memberInfo}">
									<p style="display:none;">아이디 또는 비밀번호가 일치하지 않습니다.</p>
	                        	</c:when>
	                        </c:choose>
                        </p>
                        <button id="login" type="submit">로그인</button>
                    </div>
                    <div class="u-form-group">
                        <a href="#" class="forgot-password">비밀번호 찾기</a>
                    </div>
                </form>
                <form class="email-signup">
                    <div class="u-form-group">
                        <input id="id" type="text" placeholder="아이디" required/>
                    </div>
                    <div class="u-form-group">
                        <input id="nickName" type="text" placeholder="닉네임" required/>
                    </div>
                    <div id="signup-password" class="u-form-group">
                        <input id="pw" type="password" placeholder="비밀번호" required/>
                    </div>
                    <div class="u-form-group">
                        <input id="pwCheck" type="password" placeholder="비밀번호 확인" required/>
                    </div>
                    <div class="u-form-group">
                        <input id="email" type="email" placeholder="이메일" required/>
                    </div>
                    <div class="u-form-group">
                        <label name="birth">생일</label>
                        <input id="birth" type="date" required/>
                    </div>
                    <div class="u-form-group">
                        <label>남성<input type="radio" name="sex" value="1" checked/></label>
                        <label>여성<input type="radio" name="sex" value="2" /></label>
                    </div>
                    <div class="u-form-group">
                        <p id="signup-error-message"></p>
                        <button id="signUp" type="submit">회원가입</button>
                    </div> 
                </form>
            </div>
        </section>
    </div>
	<script>
	$("#login").click(function() {
		document.loginForm.action = "${ctx}/login";
		document.loginForm.submit();
		
		
	});
	const modal = document.querySelector('#modal');

	const btnSignInModalBtn = document.querySelector('#btn-signin-modal');
	const btnSignUpModalBtn = document.querySelector('#btn-signup-modal');
	const btnMypageBtn = document.querySelector('#btn-mypage');
	const btnCloseModal = document.querySelector('.modal-close');

	const btnLogoutBtn = document.querySelector('#btn-logout');

	let btnSignInModal = null;
	let btnSignUpModal = null;
	let btnMypage = null;
	let btnLogout = null;
	
	if(btnSignInModalBtn != null) {
		btnSignInModal = document.querySelector('#btn-signin-modal');
		
		// 로그인 버튼을 눌러 로그인 모달 띄우기 + 스크롤을 막는 css 속성 부여
		btnSignInModal.addEventListener("click", ()=>{
		    modal.style.display="flex";
		    $(".email-signup").hide();
		    $(".email-login").delay(1).fadeIn(1);
		    $(".email-signup").fadeOut(1);
		    $("#login-box-link").addClass("active");
		    $("#signup-box-link").removeClass("active");
		});
		
	}
	if(btnSignUpModalBtn != null) {
		btnSignUpModal = document.querySelector('#btn-signup-modal');
		
		// 회원가입 버튼을 눌러 회원가입 모달 띄우기 + 스크롤을 막는 css 속성 부여
		btnSignUpModal.addEventListener("click", ()=>{
		    modal.style.display="flex";
		    $(".email-login").hide();
		    $(".email-login").fadeOut(1);
		    $(".email-signup").delay(1).fadeIn(1);
		    $("#login-box-link").removeClass("active");
		    $("#signup-box-link").addClass("active");
		});
		
	}
	if(btnMypageBtn != null) {
		btnMypage = document.querySelector('#btn-mypage');
		
		
	}
	
	if(btnLogoutBtn != null) {
		btnLogout = document.querySelector('#btn-logout');
		
		// 로그아웃 버튼을 클릭 시 로그아웃
			btnLogout.addEventListener("click", ()=>{
		    window.location = "${ctx}/logout";
		});
		
	}
	
	// X 버튼을 눌러 모달을 탈출 + 스크롤을 막는 css 속성 지우기

	btnCloseModal.addEventListener("click", ()=>{
		console.log("btnCloseModal..............");
	    modal.style.display="none";
	    
	    // 모달 탈출시 로그인 및 회원가입 값 초기화
	    document.getElementById('member_id').value = '';
	    document.getElementById('member_pw').value = '';
	    document.getElementById('id').value = '';
	    document.getElementById('nickName').value = '';
	    document.getElementById('pw').value = '';
	    document.getElementById('pwCheck').value = '';
	    document.getElementById('email').value = '';
	    document.getElementById('birth').value = '';
	    document.getElementById('login-error-message').innerHTML = '';
	    document.getElementById('signup-error-message').innerHTML = '';
	});
	
	</script>
    
    <script src="/resources/js/login.js"></script>
    <script src="/resources/js/bestJokes.js"></script>
</body>
</html>