/**
 * 
 */
console.log("Vote Module........");

var voteService = (function() {
	function add(vote, callback, error) {
		console.log("add vote.................");
		
		$.ajax({
			type : "post",
			url : vote.contextPath + "/vote/insert",
			data : JSON.stringify(vote),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		})
	}
	
	// 현재 사용자의 투표 현황
	function getList(param, callback, error) {
		
		var joke_id = param.joke_id;
		var member_id = param.member_id
		var contextPath = param.contextPath;

		$.getJSON(contextPath + "/vote/" + joke_id + "/" + member_id,
		function(data) {
			if (callback) {
				callback(data.vote_id, data.vote_type, data.joke_id);
			}
		}).fail(function(xhr, status, err) {
			if (err) {
				callback(null);
			}
		});
	}
	
	// 댓글 삭제
	function remove(vote, callback, error) {
		console.log("remove vote.................");
		console.log("joke_id in js ========> " + vote.joke_id);
		console.log("member_id in js ========> " + vote.member_id);
		$.ajax({
			type : "delete",
			url : vote.contextPath + "/vote/" + vote.joke_id + "/" + vote.member_id,
			success : function(deleteResult, status, xhr) {
				if (callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}

	// 댓글 수정
	function update(vote, callback, error) {
		console.log("modify vote.........");
		$.ajax({
			type : "put",
			url : vote.contextPath + "/vote/" + vote.joke_id + "/" + vote.member_id,
			data : JSON.stringify(vote),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	// 댓글 조회
	function get(reply, callback, error) {
		$.get(reply.contextPath + "/replies/" + reply.reply_id, function(result) {
			if (callback) {
				callback(result);
			}
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}

	// 댓글 시간 처리
	function displayTime(timeValue) {

		var today = new Date();

		var gap = today.getTime() - timeValue;

		var dateObj = new Date(timeValue);
		var str = "";

		if (gap < (1000 * 60 * 60 * 24)) {
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');
		} else {
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
	}

	return {
		add : add,
		get : get,
		getList : getList,
		remove : remove,
		update : update,
		displayTime : displayTime
	}
})();