/**
 * 
 */
 
 document.addEventListener('DOMContentLoaded', function () {
    $('#todayBest').css('background-color', '#5c5be5');
    $('#todayBest').css('color', '#ffffff');

    fetch('/resources/JSON/todayBest.json')
        .then(response => response.json())
        .then(data => {
            const table = document.getElementById('jokes-table');
            const rows = table.querySelectorAll('tr');

            data.forEach((item, index) => {
                // 각 행의 'name' 클래스를 가진 td를 찾습니다
                const nameCell = rows[index].querySelector('.name');
                const paragraphs = nameCell.querySelectorAll('p');
                
                // 첫 번째 p태그에 joke_question 삽입
                paragraphs[0].textContent = item.joke_question;
                // 두 번째 p태그에 joke_answer 삽입
                paragraphs[1].textContent = item.joke_answer;
            });
        })
        .catch(error => console.error('Error fetching data:', error));
});

// 오늘의 베스트 클릭시 오늘 가장 인기있었던 글들 가져오기
document.getElementById('todayBest').addEventListener('click', function () {
    var labelName = this.id;
    selectedLabel(labelName);   

    fetch('/resources/JSON/todayBest.json')
        .then(response => response.json())
        .then(data => {
            const table = document.getElementById('jokes-table');
            const rows = table.querySelectorAll('tr');

            data.forEach((item, index) => {
                // 각 행의 'name' 클래스를 가진 td를 찾습니다
                const nameCell = rows[index].querySelector('.name');
                const paragraphs = nameCell.querySelectorAll('p');
                
                // 첫 번째 p태그에 joke_question 삽입
                paragraphs[0].textContent = item.joke_question;
                // 두 번째 p태그에 joke_answer 삽입
                paragraphs[1].textContent = item.joke_answer;
            });
        })
        .catch(error => console.error('Error fetching data:', error));
});

// 이번주 베스트 클릭시 이번주 가장 인기있었던 글들 가져오기
document.getElementById('weeklyBest').addEventListener('click', function () {
    var labelName = this.id;
    selectedLabel(labelName);

    fetch('/resources/JSON/weeklyBest.json')
        .then(response => response.json())
        .then(data => {
            const table = document.getElementById('jokes-table');
            const rows = table.querySelectorAll('tr');

            data.forEach((item, index) => {
                // 각 행의 'name' 클래스를 가진 td를 찾습니다
                const nameCell = rows[index].querySelector('.name');
                const paragraphs = nameCell.querySelectorAll('p');
                
                // 첫 번째 p태그에 joke_question 삽입
                paragraphs[0].textContent = item.joke_question;
                // 두 번째 p태그에 joke_answer 삽입
                paragraphs[1].textContent = item.joke_answer;
            });
        })
        .catch(error => console.error('Error fetching data:', error));
});

// 이번달 베스트 클릭시 이번달 가장 인기있었던 글들 가져오기
document.getElementById('monthlyBest').addEventListener('click', function () {
    var labelName = this.id;
    selectedLabel(labelName);

    fetch('/resources/JSON/monthlyBest.json')
        .then(response => response.json())
        .then(data => {
            const table = document.getElementById('jokes-table');
            const rows = table.querySelectorAll('tr');

            data.forEach((item, index) => {
                // 각 행의 'name' 클래스를 가진 td를 찾습니다
                const nameCell = rows[index].querySelector('.name');
                const paragraphs = nameCell.querySelectorAll('p');
                
                // 첫 번째 p태그에 joke_question 삽입
                paragraphs[0].textContent = item.joke_question;
                // 두 번째 p태그에 joke_answer 삽입
                paragraphs[1].textContent = item.joke_answer;
            });
        })
        .catch(error => console.error('Error fetching data:', error));
});
// 올타임 베스트 클릭시 전체 글 중 가장 인기있었던 글들 가져오기
document.getElementById('allTimeBest').addEventListener('click', function () {
    var labelName = this.id;
    selectedLabel(labelName);

    fetch('/resources/JSON/allTimeBest.json')
        .then(response => response.json())
        .then(data => {
            const table = document.getElementById('jokes-table');
            const rows = table.querySelectorAll('tr');

            data.forEach((item, index) => {
                // 각 행의 'name' 클래스를 가진 td를 찾습니다
                const nameCell = rows[index].querySelector('.name');
                const paragraphs = nameCell.querySelectorAll('p');
                
                // 첫 번째 p태그에 joke_question 삽입
                paragraphs[0].textContent = item.joke_question;
                // 두 번째 p태그에 joke_answer 삽입
                paragraphs[1].textContent = item.joke_answer;
            });
        })
        .catch(error => console.error('Error fetching data:', error));
});

function selectedLabel(labelName) {
    $('#todayBest').css('background-color', '#f9f9f9');
    $('#todayBest').css('color', '#141a39');
    $('#weeklyBest').css('background-color', '#f9f9f9');
    $('#weeklyBest').css('color', '#141a39');
    $('#monthlyBest').css('background-color', '#f9f9f9');
    $('#monthlyBest').css('color', '#141a39');
    $('#allTimeBest').css('background-color', '#f9f9f9');
    $('#allTimeBest').css('color', '#141a39');
    $("#" + labelName).css('background-color', '#5c5be5');
    $("#" + labelName).css('color', '#ffffff');
}