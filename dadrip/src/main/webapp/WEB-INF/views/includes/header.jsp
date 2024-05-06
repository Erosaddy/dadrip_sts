<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">


    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/resources/css/header.css">
    <link rel="stylesheet" href="/resources/css/reused.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/login.css">

    <title>Dadrip</title>
    <!-- below are leaderboard-related preparations -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
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
	                        <input id="member_id" type="text" placeholder="아이디" name="member_id" onkeyup="fnEnterKey()">
	                    </div>
	                    <div class="u-form-group">
	                        <input id="member_pw" type="password" placeholder="비밀번호" name="member_pw" onkeyup="fnEnterKey()">
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
	                        <input id="id" type="text" placeholder="아이디" name="member_id" oninput = "checkId()">
							<span class="id_validation" style="display: none">아이디는 알파벳 대소문자와 숫자만 사용 가능하며, 5~20자 사이여야 합니다.</span>
							<span class="id_available" style="display: none">사용 가능한 아이디입니다.</span>
	                        <span class="id_occupied" style="display: none">사용중인 아이디입니다.</span>
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
	                        <input id="email" type="email" placeholder="이메일" name="email" oninput = "checkEmail()">
	                        <span class="email_validation" style="display: none">올바른 이메일 형식을 입력해 주세요.</span>
	                        <span class="email_available" style="display: none">사용 가능한 이메일입니다.</span>
	                        <span class="email_occupied" style="display: none">해당 이메일을 사용 중인 계정이 존재합니다.</span>
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
	    </div> <!-- 숨겨진 로그인/회원가입 모달 끝 -->
        
    </header>
    
    <script>
	
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
	
	// 엔터 키로 로그인
	function fnEnterKey() {
		if (window.event.keyCode == 13) {
			var inputUsername = document.querySelector('input[type="text"]').value;
			var inputPassword = document.querySelector('input[type="password"]').value;
			// 빈값 여부 검사
			if(inputUsername == '') {
		        document.getElementById('login-error-message').innerHTML = '아이디를 입력해 주세요.';
		        document.getElementById('login-error-message').style.display = "block";
		        document.getElementById('member_id').focus();
		        return;
		    } else if(inputPassword == '') {
		        document.getElementById('login-error-message').innerHTML = '비밀번호를 입력해 주세요.';
			    document.getElementById('login-error-message').style.display = "block";
			    document.getElementById('member_pw').focus();
		        return;
		    }
			
			document.loginForm.action = "${ctx}/login";
			document.loginForm.submit();
		}
	}
	
	var idAvailability = true;
	var emailAvailability = true;
	
	// 회원가입 시 아이디 유효성 검사
	function checkId(){
		const idReg = /^[a-zA-Z0-9]{5,20}$/;	// 아이디 유효성 검사
        var id = $('#id').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'${ctx}/idCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{member_id: id},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
                	if(id == "") {
                		$('.id_validation').css("display", "none");
	                	$('.id_available').css("display", "none");
	                    $('.id_occupied').css("display", "none");
                    	idAvailability = false;
                	} else if(!idReg.test(id)) {
                		$('.id_validation').css("display", "inline-block");
	                	$('.id_available').css("display", "none");
	                    $('.id_occupied').css("display", "none");
                    	idAvailability = false;
                	} else {
	                	$('.id_validation').css("display", "none");
	                	$('.id_available').css("display", "inline-block");
	                    $('.id_occupied').css("display", "none");
                    	idAvailability = true;
                	}
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                	$('.id_validation').css("display", "none");
                	$('.id_occupied').css("display", "inline-block"); 
                    $('.id_available').css("display", "none");
                    idAvailability = false;
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
    };
    
    function checkEmail(){
    	const emailReg = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;	// 이메일 유효성 검사
        var email = $('#email').val(); //id값이 "id"인 입력란의 값을 저장
        $.ajax({
            url:'${ctx}/emailCheck', //Controller에서 요청 받을 주소
            type:'post', //POST 방식으로 전달
            data:{email: email},
            success:function(cnt){ //컨트롤러에서 넘어온 cnt값을 받는다 
                if(cnt == 0){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한 아이디
                	if (email == "") {
                		$('.email_validation').css("display", "none");
                		$('.email_available').css("display", "none");
	                    $('.email_occupied').css("display", "none");
	                    emailAvailability = false;
                	} else if(!emailReg.test(email)) {
                		$('.email_validation').css("display", "inline-block");
                		$('.email_available').css("display", "none");
	                    $('.email_occupied').css("display", "none");
	                    emailAvailability = false;
                	} else {
                		$('.email_validation').css("display", "none");
	                	$('.email_available').css("display", "inline-block");
	                    $('.email_occupied').css("display", "none");
	                    emailAvailability = true;
                	}
                } else { // cnt가 1일 경우 -> 이미 존재하는 아이디
                	$('.email_validation').css("display", "none");
                    $('.email_available').css("display", "none");
                	$('.email_occupied').css("display", "inline-block"); 
                    emailAvailability = false;
                }
            },
            error:function(){
                alert("에러입니다");
            }
        });
    };

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
	 	// 아이디 중복 검사
	    else if (!idAvailability) {
	    	document.getElementById('signup-error-message').innerHTML = '아이디를 다시 확인해 주세요..';
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
	 	// 이메일 중복 검사
	    else if (!emailAvailability) {
	    	document.getElementById('signup-error-message').innerHTML = '이메일을 다시 확인해 주세요.';
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
        document.getElementById('member_id').focus();
	}
	
	 // 모달 애니메이션
	 
	$(".email-signup").hide();
	$("#signup-box-link").click(function () {
	    $(".email-login").fadeOut(100);
	    $(".email-signup").delay(100).fadeIn(100);
	    $("#login-box-link").removeClass("active");
	    $("#signup-box-link").addClass("active");
	});
	$("#login-box-link").click(function () {
	    $(".email-login").delay(100).fadeIn(100);
	    $(".email-signup").fadeOut(100);
	    $("#login-box-link").addClass("active");
	    $("#signup-box-link").removeClass("active");
	});
	
	</script>
	
	<!-- jQuery -->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>