<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</head>
<body>
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
                    <button class="btn-signin-modal">로그인</button>
                    <button class="btn-signup-modal">회원가입</button>
                </div>
            </div>
        </nav>
    </header>
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
                <form class="email-login" method="post">
                    <div class="u-form-group">
                        <input id="loginId" type="text" placeholder="아이디" required/>
                    </div>
                    <div class="u-form-group">
                        <input id="loginPw" type="password" placeholder="비밀번호" required/>
                    </div>
                    <div class="u-form-group">
                        <p id="login-error-message"></p>
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
                        <label>남성<input type="radio" name="sex" value="M" checked/></label>
                        <label>여성<input type="radio" name="sex" value="F" /></label>
                    </div>
                    <div class="u-form-group">
                        <p id="signup-error-message"></p>
                        <button id="signUp" type="submit">회원가입</button>
                    </div> 
                </form>
            </div>
        </section>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/resources/js/login.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/bestJokes.js"></script>
</body>
</html>