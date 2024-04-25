/**
 * 
 */
 
const modal = document.querySelector('#modal');
const btnSignInModal = document.querySelector('.btn-signin-modal');
const btnSignUpModal = document.querySelector('.btn-signup-modal');
const btnCloseModal = document.querySelector('.modal-close')

// 로그인 버튼을 눌러 로그인 모달 띄우기 + 스크롤을 막는 css 속성 부여
btnSignInModal.addEventListener("click", ()=>{
    modal.style.display="flex";
    $(".email-signup").hide();
    $(".email-login").delay(1).fadeIn(1);
    $(".email-signup").fadeOut(1);
    $("#login-box-link").addClass("active");
    $("#signup-box-link").removeClass("active");
});
// 회원가입 버튼을 눌러 회원가입 모달 띄우기 + 스크롤을 막는 css 속성 부여
btnSignUpModal.addEventListener("click", ()=>{
    modal.style.display="flex";
    $(".email-login").hide();
    $(".email-login").fadeOut(1);
    $(".email-signup").delay(1).fadeIn(1);
    $("#login-box-link").removeClass("active");
    $("#signup-box-link").addClass("active");
});
// X 버튼을 눌러 모달을 탈출 + 스크롤을 막는 css 속성 지우기
btnCloseModal.addEventListener("click", ()=>{
    modal.style.display="none";
    
    // 모달 탈출시 로그인 및 회원가입 값 초기화
    document.getElementById('loginId').value = '';
    document.getElementById('loginPw').value = '';
    document.getElementById('id').value = '';
    document.getElementById('nickName').value = '';
    document.getElementById('pw').value = '';
    document.getElementById('pwCheck').value = '';
    document.getElementById('email').value = '';
    document.getElementById('birth').value = '';
    document.getElementById('login-error-message').innerHTML = '';
    document.getElementById('signup-error-message').innerHTML = '';
});
 