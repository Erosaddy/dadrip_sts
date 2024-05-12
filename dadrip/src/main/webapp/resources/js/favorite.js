/**
 * 
 */
console.log("Favorite Module........");

var favoriteService = (function() {
	function add(favorite, callback, error) {
		console.log("add favorite.................");
		
		$.ajax({
			type : "post",
			url : favorite.contextPath + "/favorite/insert",
			data : JSON.stringify(favorite),
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
	
	// 현재 사용자의 찜 현황
	function getList(param, callback, error) {
		
		var joke_id = param.joke_id;
		console.log("joke_id in favorite.js" + joke_id);
		var member_id = param.member_id
		var contextPath = param.contextPath;

		$.getJSON(contextPath + "/favorite/" + joke_id + "/" + member_id,
		function(data) {
			if (callback) {
				callback(data.favorite_id, data.joke_id);
			}
		}).fail(function(xhr, status, err) {
			if (err) {
				callback(null);
			}
		});
	}
	
	// 댓글 삭제
	function remove(favorite, callback, error) {
		console.log("remove favorite.................");
		console.log("joke_id in favorite.js ========> " + favorite.joke_id);
		console.log("member_id in favorite.js ========> " + favorite.member_id);
		$.ajax({
			type : "delete",
			url : favorite.contextPath + "/favorite/" + favorite.joke_id + "/" + favorite.member_id,
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
		displayTime : displayTime
	}
})();