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
                    <a href="http://localhost:9090/dadrip/mainSignIn">
                        <img src="/resources/images/Dadrip_logo.PNG" alt="Dadrip logo">
                    </a>
                </div>
                <div class="navigation">
                    <a href="jokeList.html" class="px-10 text-bold">아재개그 목록</a>
                    <a href="#" class="px-10 text-bold">아재력 테스트</a>
                </div>
                <div>
                    <input type="search" placeholder="search for dad jokes" class="search">
                    <button class="btn-signin-modal">마이페이지</button>
                    <button class="btn-signup-modal">로그아웃</button>
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
                    <h5><button id="todayBest">오늘의 베스트</button></h5>
                    <h5><button id="weeklyBest">이번주 베스트</button></h5>
                    <h5><button id="monthlyBest">이번달 베스트</button></h5>
                    <h5><button id="allTimeBest">올타임 베스트</button></h5>
                    
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
  
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>
    <script src="/resources/js/login.js"></script>
    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/bestJokes.js"></script>
</body>
</html>