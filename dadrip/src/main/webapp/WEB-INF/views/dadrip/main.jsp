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
                        <input id="member_id" type="text" placeholder="아이디" name="member_id">
                    </div>
                    <div class="u-form-group">
                        <input id="member_pw" type="password" placeholder="비밀번호" name="member_pw">
                    </div>
                    <div class="u-form-group">
                        <p id="login-error-message"></p>
                        <button id="login" type="button">로그인</button>
                    </div>
                    <div class="u-form-group">
                        <a href="#" class="forgot-password">비밀번호 찾기</a>
                    </div>
                </form>
                <form name="signUpForm" class="email-signup" method="post">
                    <div class="u-form-group">
                        <input id="id" type="text" placeholder="아이디" name="member_id">
                    </div>
                    <div class="u-form-group">
                        <input id="nickName" type="text" placeholder="닉네임" name="nickname">
                    </div>
                    <div id="signup-password" class="u-form-group">
                        <input id="pw" type="password" placeholder="비밀번호" name="member_pw">
                    </div>
                    <div class="u-form-group">
                        <input id="pwCheck" type="password" placeholder="비밀번호 확인">
                    </div>
                    <div class="u-form-group">
                        <input id="email" type="email" placeholder="이메일" name="email">
                    </div>
                    <div class="u-form-group">
                        <label name="birth">생일</label>
                        <input id="birth" type="date" name="birthday">
                    </div>
                    <div class="u-form-group">
                        <label>남성<input type="radio" name="sex" value="1" checked/></label>
                        <label>여성<input type="radio" name="sex" value="2" /></label>
                    </div>
                    <div class="u-form-group">
                        <p id="signup-error-message"></p>
                        <button id="signUp" type="button">회원가입</button>
                    </div> 
                </form>
            </div>
        </section>
    </div>
	<script>
	//메시지 받기
	
	
	
	//로그인
	$("#login").click(function() {
		// 입력값 알아오기
		var inputUsername = document.querySelector('input[type="text"]').value;
		var inputPassword = document.querySelector('input[type="password"]').value;
		// 빈값 여부 검사
		if(inputUsername == '') {
	        document.getElementById('login-error-message').innerHTML = '아이디를 입력해 주세요.';
	        document.getElementById('login-error-message').style.display = "block";
	        return;
	    } else if(inputPassword == '') {
	        document.getElementById('login-error-message').innerHTML = '비밀번호를 입력해 주세요.';
		    document.getElementById('login-error-message').style.display = "block";
	        return;
	    }
		
		document.loginForm.action = "${ctx}/login";
		document.loginForm.submit();
	});

	//회원가입
	$("#signUp").click(function() {
		
		// 사용자 입력 값 가져오기
	    var inputUsername = document.getElementById('id').value;
	    var inputNickname = document.getElementById('nickName').value;
	    var inputPassword = document.getElementById('pw').value;
	    var inputPasswordCheck = document.getElementById('pwCheck').value;
	    var inputEmail = document.getElementById('email').value;
	    var inputBirth = document.getElementById('birth').value;
	    // 성별 값 받기
	    const genderRadios = document.getElementsByName('sex');
	    let inputGender;
	    for (const radio of genderRadios) {
	        if (radio.checked) {
	            inputGender = radio.value;
	            break; // 선택된 라디오 버튼이 확인되면 반복문을 종료합니다.
	        }
	    }
	    
	    const idReg = /^[a-zA-Z0-9]{5,20}$/;
	    const pwReg1 = /^[A-Za-z\d@$!%*#?&]{7,60}$/;    // 알파벳 대소문자, 숫자, 특수문자만 사용 가능하며 7~60자리 사이일 것
	    const pwReg2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{7,}$/;  // 알파벳, 숫자, 특수문자 적어도 하나씩 사용해야 함
	    //const pwReg3 = /([A-Za-z0-9`~!@#\$%\^&\*\(\)\{\}\[\]\-_=\+\\|;:\'\"<>,\./\?])\1{2,}/g;    // 동일문자 3번 이상 반복 금지(동작 안함, 수정 필요)
	    const emailReg = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
	    
	    // 빈값 없도록 제한
	    if (inputUsername == '') {
	        document.getElementById('signup-error-message').innerHTML = '아이디를 입력해 주세요.';
	        document.getElementById('id').focus();
	        return;
	    } else if (inputNickname == '') {
	        document.getElementById('signup-error-message').innerHTML = '닉네임을 입력해 주세요.';
	        document.getElementById('nickName').focus();
	        return;
	    } else if (inputPassword == '') {
	        document.getElementById('signup-error-message').innerHTML = '비밀번호를 입력해 주세요.';
	        document.getElementById('pwCheck').value = '';
	        document.getElementById('pw').focus();
	        return;
	    } else if (inputPasswordCheck == '') {
	        document.getElementById('signup-error-message').innerHTML = '비밀번호 확인을 입력해 주세요.';
	        document.getElementById('pwCheck').focus();
	        return;
	    } else if (inputEmail == '') {
	        document.getElementById('signup-error-message').innerHTML = '이메일을 입력해 주세요.';
	        document.getElementById('email').focus();
	        return;
	    } else if (inputBirth == '') {
	        document.getElementById('signup-error-message').innerHTML = '생년월일을 선택해 주세요.';
	        document.getElementById('birth').focus();
	        return;
	    }

	    // 비밀번호 확인 체크
	    else if (!(inputPassword == inputPasswordCheck)) {
	        document.getElementById('signup-error-message').innerHTML = '확인용 비밀번호가 입력하신 비밀번호와 일치하지 않습니다.';
	        document.getElementById('pw').value = '';
	        document.getElementById('pwCheck').value = '';
	        document.getElementById('pw').focus();
	        return;
	    }
	    // 아이디 길이, 사용가능 문자
	    else if (!idReg.test(inputUsername)) {
	        document.getElementById('signup-error-message').innerHTML = '아이디는 알파벳 대소문자와 숫자만 사용 가능하며, 5~20자 사이여야 합니다.';
	        document.getElementById('id').focus();
	        return;
	    }
	    // 비밀번호 길이, 사용가능 문자
	    else if (!pwReg1.test(inputPassword)) {
	        document.getElementById('signup-error-message').innerHTML = '비밀번호는 알파벳 대소문자, 숫자, 특수문자만 사용 가능하며, 7~60자 사이여야 합니다.';
	        document.getElementById('pw').value = '';
	        document.getElementById('pwCheck').value = '';
	        document.getElementById('pw').focus();
	        return;
	    }
	    // 비밀번호 필수로 들어가야 하는 문자들 지정
	    else if (!pwReg2.test(inputPassword)) {
	        document.getElementById('signup-error-message').innerHTML = '비밀번호는 각각 적어도 하나의 영문자, 숫자, 특수문자(@$!%*#?&)를 포함해야 합니다.';
	        document.getElementById('pw').value = '';
	        document.getElementById('pwCheck').value = '';
	        document.getElementById('pw').focus();
	        return;
	    }
	    // 비밀번호 동일 문자 3번 이상 반복 금지
	    /* else if (!pwReg3.test(inputPassword)) {
	        document.getElementById('signup-error-message').innerHTML = '비밀번호에 동일한 문자를 연속 3번 이상 사용할 수 없습니다.';
	        document.getElementById('pw').value = '';
	        document.getElementById('pwCheck').value = '';
	        document.getElementById('pw').focus();
	        return;
	    } */
	    // 이메일 유효성 검사
	    else if (!emailReg.test(inputEmail)) {
	        document.getElementById('signup-error-message').innerHTML = '올바른 이메일 형식을 입력해 주세요.';
	        document.getElementById('email').focus();
	        return;
	    }
	    
		document.signUpForm.action = "${ctx}/signup";
		document.signUpForm.submit();
		
	});
	
	// 회원가입 등록 확인 alert
	if ("${result}" == "signupSuccess") {
		alert("회원가입에 성공했습니다.");
	}
	
	
	const modal = document.querySelector('#modal');

	const btnSignInModalBtn = document.querySelector('#btn-signin-modal');
	const btnSignUpModalBtn = document.querySelector('#btn-signup-modal');
	const btnMypageBtn = document.querySelector('#btn-mypage');
	const btnLogoutBtn = document.querySelector('#btn-logout');

	const btnCloseModal = document.querySelector('.modal-close');

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
	
	// 로그인 후 일치하는 정보가 없을 때 자동으로 로그인 모달 켜기
	if("${result}" == "loginFail") {
	    modal.style.display="flex";
	    $(".email-signup").hide();
	    $(".email-login").delay(1).fadeIn(1);
	    $(".email-signup").fadeOut(1);
	    $("#login-box-link").addClass("active");
	    $("#signup-box-link").removeClass("active");
	    
	    document.getElementById('login-error-message').innerHTML = '아이디 또는 비밀번호가 일치하지 않습니다.';
        document.getElementById('login-error-message').style.display = "block";
	}
	
	function validateCredentials(inputUsername, inputNickname, inputPassword, inputPasswordCheck, inputEmail, inputBirth) {
		
	   
	    return true;
	}

	
	</script>
    
    <script src="/resources/js/login.js"></script>
    <script src="/resources/js/bestJokes.js"></script>
</body>
</html>