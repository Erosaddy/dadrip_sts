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
document.getElementById('login').addEventListener('click', function (e) {
    e.preventDefault(); // 폼 제출 방지

    // 사용자 입력 값 가져오기
    var inputUsername = document.querySelector('input[type="text"]').value;
    var inputPassword = document.querySelector('input[type="password"]').value;

    if(inputUsername == '') {
        document.getElementById('login-error-message').innerHTML = '아이디를 입력해 주세요.';
        return;
    } else if(inputPassword == '') {
        document.getElementById('login-error-message').innerHTML = '비밀번호를 입력해 주세요.';
        return;
    }
        
    authenticateUser(inputUsername, inputPassword);
});

function authenticateUser(username, password) {
    // 로딩 상태 표시 추가 가능
    fetch('/resources/JSON/userList.json')
        .then(response => response.json())
        .then(users => {
            let isAuthenticated = users.some(user => user.user_id === username && user.user_pw === password);

            if (isAuthenticated) {
                
                window.location.href = '/dadrip/mainSignIn';
            } else {
                document.getElementById('login-error-message').innerHTML = '아이디 혹은 비밀번호가 일치하지 않습니다.';
            }
        })
        .catch(error => {
            console.error('Error fetching user data:', error);
            alert('로그인 처리 중 오류가 발생했습니다.');
        });
}


// 회원가입 처리
document.getElementById('signUp').addEventListener('click', function (e) {
    e.preventDefault(); // 폼 제출 방지

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

    if (validateCredentials(inputUsername, inputNickname, inputPassword, inputPasswordCheck, inputEmail, inputBirth)) {
        alert('회원가입이 완료되었습니다.')
    }
});

// 유효성 검사 메소드
function validateCredentials(inputUsername, inputNickname, inputPassword, inputPasswordCheck, inputEmail, inputBirth) {

    const idReg = /^[a-zA-Z0-9]{5,20}$/;
    const pwReg1 = /^[A-Za-z\d@$!%*#?&]{7,60}$/;    // 알파벳 대소문자, 숫자, 특수문자만 사용 가능하며 7~60자리 사이일 것
    const pwReg2 = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&]).{7,}$/;  // 알파벳, 숫자, 특수문자 적어도 하나씩 사용해야 함
    const peReg3 = /([A-Za-z0-9`~!@#\$%\^&\*\(\)\{\}\[\]\-_=\+\\|;:'"<>,\./\?])\1{2,}/g;    // 동일문자 3번 이상 반복 금지
    const emailReg = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
    
    // 빈값 없도록 제한
    if (inputUsername == '') {
        document.getElementById('signup-error-message').innerHTML = '아이디를 입력해 주세요.';
        document.getElementById('id').focus();
        return false;
    } else if (inputNickname == '') {
        document.getElementById('signup-error-message').innerHTML = '닉네임을 입력해 주세요.';
        document.getElementById('nickName').focus();
        return false;
    } else if (inputPassword == '') {
        document.getElementById('signup-error-message').innerHTML = '비밀번호를 입력해 주세요.';
        document.getElementById('pwCheck').value = '';
        document.getElementById('pw').focus();
        return false;
    } else if (inputPasswordCheck == '') {
        document.getElementById('signup-error-message').innerHTML = '비밀번호 확인을 입력해 주세요.';
        document.getElementById('pwCheck').focus();
        return false;
    } else if (inputEmail == '') {
        document.getElementById('signup-error-message').innerHTML = '이메일을 입력해 주세요.';
        document.getElementById('email').focus();
        return false;
    } else if (inputBirth == '') {
        document.getElementById('signup-error-message').innerHTML = '생년월일을 선택해 주세요.';
        document.getElementById('birth').focus();
        return false;
    }

    // 비밀번호 확인 체크
    else if (!(inputPassword == inputPasswordCheck)) {
        document.getElementById('signup-error-message').innerHTML = '확인용 비밀번호가 입력하신 비밀번호와 일치하지 않습니다.';
        document.getElementById('pw').value = '';
        document.getElementById('pwCheck').value = '';
        document.getElementById('pw').focus();
        return false;
    }
    // 아이디 길이, 사용가능 문자
    else if (!idReg.test(inputUsername)) {
        document.getElementById('signup-error-message').innerHTML = '아이디는 영어 대소문자와 숫자만 사용 가능하며, 5~20자 사이여야 합니다.';
        document.getElementById('id').focus();
        return false;
    }
    // 비밀번호 길이, 사용가능 문자
    else if (!pwReg1.test(inputPassword)) {
        document.getElementById('signup-error-message').innerHTML = '비밀번호는 영어 대소문자와 숫자, 특수문자만 사용 가능하며, 7~60자 사이여야 합니다.';
        document.getElementById('pw').value = '';
        document.getElementById('pwCheck').value = '';
        document.getElementById('pw').focus();
        return false;
    }
    // 비밀번호 필수로 들어가야 하는 문자들 지정
    else if (!pwReg2.test(inputPassword)) {
        document.getElementById('signup-error-message').innerHTML = '비밀번호는 각각 적어도 하나의 영문자, 숫자, 특수문자(@$!%*#?&)를 포함해야 합니다.';
        document.getElementById('pw').value = '';
        document.getElementById('pwCheck').value = '';
        document.getElementById('pw').focus();
        return false;
    }
    // 비밀번호 동일 문자 3번 이상 반복 금지
    else if (!pwReg3.test(inputPassword)) {
        document.getElementById('signup-error-message').innerHTML = '비밀번호에 동일한 문자를 연속 3번 이상 사용할 수 없습니다.';
        document.getElementById('pw').value = '';
        document.getElementById('pwCheck').value = '';
        document.getElementById('pw').focus();
        return false;
    }
    // 이메일 유효성 검사
    else if (!emailReg.test(inputEmail)) {
        document.getElementById('signup-error-message').innerHTML = '올바른 이메일 형식을 입력해 주세요.';
        document.getElementById('email').focus();
        return false;
    }
    return true;
}