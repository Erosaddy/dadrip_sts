/**
 * 
 */
 
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


// 로그인 처리

function loginValidation(inputUsername, inputPassword) {
 
    
//    authenticateUser(inputUsername, inputPassword);
}

// 회원가입 처리


// 유효성 검사 메소드
