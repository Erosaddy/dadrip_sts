<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@include file="../includes/header_main.jsp" %>
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
    
	 
    
    <script src="/resources/js/bestJokes.js"></script>
    
</body>
</html>