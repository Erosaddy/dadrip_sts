<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@include file="../includes/header.jsp"%>
<!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/css/leaderboard.css">
<c:set var="contextPath" value="${pageContext.request.contextPath == '/' ? '' : pageContext.request.contextPath }" scope="application" />
<style>
	.uploadResult {
		width:100%;
		background-color: gray;
	}
	
	.uploadResult ul{
		display:flex;
		flex-flow: row;
		justify-content: center;
		align-items: center;
	}
	
	.uploadResult ul li {
		list-style: none;
		padding: 10px;
		align-content: center;
		text-align: center;
	}
	
	.uploadResult ul li img{
		width: 100px;
	}
	
	.uploadResult ul li span {
		color:white;
	}
	
	.bigPictureWrapper {
		position: absolute;
		display: none;
		justify-content: center;
		align-items: center;
		top:0%;
		width:100%;
		height:100%;
		background-color: gray; 
		z-index: 1000;
		background:rgba(255,255,255,0.5);
	}
	
	.bigPicture {
		position: relative;
		display:flex;
		justify-content: center;
		align-items: center;
	}
	
	.bigPicture img {
		width:600px;
	}
</style>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">Joke Read</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Joke Read Page</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

         <div class="form-group">
           <label>Joke_id</label> <input class="form-control" name="joke_id" value="${joke.joke_id }" readonly="readonly">
         </div>

         <div class="form-group">
           <label>Joke Question</label> <input class="form-control" name="joke_question" value="${joke.joke_question }" readonly="readonly">
         </div>

         <div class="form-group">
           <label>Joke Answer</label>
           <textarea class="form-control" rows="3" name="joke_answer" readonly="readonly">${joke.joke_answer }</textarea>
         </div>

         <div class="form-group">
           <label>Member Id</label> <input class="form-control" name="member_id" value="${joke.member_id }" readonly="readonly">
         </div>
         
         <button data-oper="modify" class="btn btn-default">Modify</button>
		 <button data-oper="list" class="btn btn-info">List</button>
		 
		 <form id="operForm" action="${contextPath}/joke/modify" method="get">
	  		 <input type="hidden" id="joke_id" name="joke_id" value="${joke.joke_id}">
	  		 <input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}">
	  		 <input type="hidden" id="amount" name="amount" value="${cri.amount}">
			 <input type="hidden" name="type" value="${cri.type}">
			 <input type="hidden" name="keyword" value="${cri.keyword}">
		 </form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <!-- <div class="panel-heading">Files</div>
      /.panel-heading
      <div class="panel-body">
        
        <div class="uploadResult"> 
          <ul>
          </ul>
        </div>
      </div>
       end panel-body
    </div> -->
    
    <!--  end panel-heading -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<div class='row'>
  <div class="col-lg-12">

    <!-- /.panel -->
    <div class="panel panel-default">
      <div class="panel-heading">
        <i class="fa fa-comments fa-fw"></i> Reply
        <button id='addReplyBtn' class='btn btn-primary btn-xs pull-right'>New Reply</button>
      </div>      
      
      <!-- /.panel-heading -->
      <div class="panel-body">        
        <ul class="chat">
        </ul>
        <!-- ./ end ul -->
      </div>
      <!-- /.panel .chat-panel -->

	  <div class="panel-footer"></div>
	</div>
  </div>
  <!-- ./ end row -->
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">REPLY MODAL</h4>
            </div>
            <div class="modal-body">
            	<div class="form-group">
            		<label>ReplyText</label>
            		<input class="form-control" name="content" value="New Reply!!!!">
            	</div>
            	<div class="form-group">
            		<label>Replier</label>
            		<input class="form-control" name="member_id" value="replier">
            	</div>
				<div class="form-group">
					<label>Reply Date</label>
					<input class="form-control" name="replyDate" value="2018-01-01 13:13">
				</div>
            </div>
			<div class="modal-footer">
        		<button id="modalModifyBtn" type="button" class="btn btn-warning">Modify</button>
        		<button id="modalRemoveBtn" type="button" class="btn btn-danger">Remove</button>
        		<button id="modalRegisterBtn" type="button" class="btn btn-primary">Register</button>
        		<button id="modalCloseBtn" type="button" class="btn btn-default">Close</button>
      		</div>          
    	</div>
          <!-- /.modal-content -->
	</div>
<!-- /.modal-dialog -->
</div>
 <!-- /.modal -->

<script type="text/javascript" src="${contextPath}/resources/js/reply.js"></script>
<script type="text/javascript">
/* window.onload = function() {
	history.pushState(null, null, location.href);
    window.onpopstate = function() {
	alert("sss");
    	
        history.go(1);
	};
};  */

$(document).ready(function() {
	var jokeIdValue = "${joke.joke_id}";
	var replyUL = $(".chat");
	
	showList(1);
	
	function showList(page) {
		console.log("show list " + page);
		   
		replyService.getList(
				{joke_id:jokeIdValue, contextPath:"${contextPath}", page: page || 1 }, 
				function(reply_count, list) {
					console.log("reply_count: "+ reply_count );
					console.log("list: " + list);
					console.log(list);
					
					if(page == -1){
						pageNum = Math.ceil(reply_count/10.0);
						showList(pageNum);
						return;
					}
					  
					var str="";
					 
					if(list == null || list.length == 0){
						return;
					}
					 
					for (var i = 0, len = list.length || 0; i < len; i++) {
						str +="<li class='left clearfix' data-reply_id='"+list[i].reply_id+"'>";
						str +="  <div><div class='header'><strong class='primary-font'>["
							+ list[i].reply_id+"] "+list[i].member_id+"</strong>";
						str +="    <small class='pull-right text-muted'>"
							+ replyService.displayTime(list[i].modified_on)+"</small></div>";
						str +="    <p>"+list[i].content+"</p></div></li>";
					}
					 
					replyUL.html(str);
					 
					showReplyPage(reply_count);
		});//end function
	}//end showList
	
    var pageNum = 1;
    var replyPageFooter = $(".panel-footer");
    
    function showReplyPage(reply_count) {
    	var endNum = Math.ceil(pageNum / 10.0) * 10;
    	var startNum = endNum - 9;
    	
    	var prev = startNum != 1;
    	var next = false;
    	
    	if(endNum * 10 >= reply_count) {
    		endNum = Math.ceil(reply_count/10.0);
    	}
    	
    	if(endNum * 10 < reply_count) {
    		next = true;
    	}
    	
    	var str = "<ul class='pagination pull-right'>";
    	
    	if(prev) {
    		str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
    	}
    	
    	for(var i = startNum ; i <= endNum; i++) {
    		var active = pageNum == i? "active":"";
    		
    		str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
    	}
    	
    	if(next) {
    		str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>Next</a></li>";
    	}
    	
    	str += "</ul></div>";
    	
    	console.log(str);
    	
    	replyPageFooter.html(str);
    }
     
    replyPageFooter.on("click","li a", function(e) {
    	e.preventDefault();
    	console.log("page click");
    	
    	var targetPageNum = $(this).attr("href");
    	
    	console.log("targetPageNum: " + targetPageNum);
    	
    	pageNum = targetPageNum;
    	
    	showList(pageNum);
     });     
	
    var modal = $(".modal");
    var modalInputReplyText = modal.find("input[name='content']");
    var modalInputReplier = modal.find("input[name='member_id']");
    var modalInputReplyDate = modal.find("input[name='replyDate']");
    
    var modalModifyBtn = $("#modalModifyBtn");
    var modalRemoveBtn = $("#modalRemoveBtn");
    var modalRegisterBtn = $("#modalRegisterBtn");
    
    $("#modalCloseBtn").on("click", function(e){
    	modal.modal("hide");
    });
    
    
    $("#addReplyBtn").on("click", function(e){
    	modal.find("input").val("");
    	modalInputReplyDate.closest("div").hide();
    	modal.find("button[id !='modalCloseBtn']").hide();
    	
    	modalRegisterBtn.show();
    	
    	$(".modal").modal("show");
    });
    
    // 새로운 댓글 처리
    modalRegisterBtn.on("click", function(e) {
    	var reply = {
    			content: modalInputReplyText.val(),
    			member_id: modalInputReplier.val(),
    			contextPath:"${contextPath}",
    			joke_id:jokeIdValue
    		};
    	
        replyService.add(reply, function(result){
        	alert(result);
        	
        	modal.find("input").val("");
        	modal.modal("hide"); 
        	
        	showList(-1);
        });
	});
    
    $(".chat").on("click", "li", function(e){
    	var reply = {
    		reply_id : $(this).data("reply_id"),
    		contextPath:"${contextPath}"
    	};

    	replyService.get(reply, function(reply){
    		modalInputReplyText.val(reply.content);
    		modalInputReplier.val(reply.member_id);
    		modalInputReplyDate.val(replyService.displayTime(reply.created_on)).attr("readonly","readonly");
    		modal.data("reply_id", reply.reply_id);
    		
    		modal.find("button[id !='modalCloseBtn']").hide();
    		modalModifyBtn.show();
    		modalRemoveBtn.show();
    		
    		$(".modal").modal("show");
    	});
    });
    
    modalModifyBtn.on("click", function(e){
    	console.log("contextPath : " + "${contextPath}");
    	var reply = {
    			reply_id:modal.data("reply_id"), 
    			content: modalInputReplyText.val(),
    			contextPath:"${contextPath}"
    		};
    	
    	replyService.update(reply, function(result) {
    		alert(result);
    		
     	    modal.modal("hide");
     	    showList(pageNum);
     	});
    });

    modalRemoveBtn.on("click", function (e) {
    	var reply = {
    			reply_id : modal.data("reply_id"), 
    			contextPath:"${contextPath}"
    		};
    	
    	replyService.remove(reply, function(result) {
    		alert(result);
    		
    		modal.modal("hide");
    		showList(pageNum);
    	});
    });
});
</script>
<script type="text/javascript">
$(document).ready(function() {
	var operForm = $("#operForm"); 
		$("button[data-oper='modify']").on("click", function(e){
	  	operForm.attr("action","${contextPath}/joke/modify").submit();
	});
	
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#joke_id").remove();
		operForm.attr("action","${contextPath}/joke/list")
		operForm.submit();
	});
});
</script>

<!-- <script>
$(document).ready(function() {
	  (function() {
	  	var joke_id = "${joke.joke_id}";
	    
	    $.getJSON("${contextPath}/joke/getAttachList", {joke_id: joke_id}, function(arr) {
	        
	       console.log(arr);
	       
	       var str = "";
	       
	       $(arr).each(function(i, attach){
	       
	         if(attach.filetype){
	           var fileCallPath =  encodeURIComponent(attach.uploadPath+ "/s_" + attach.uuid +"_" + attach.fileName);
	           
	           str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.filetype + "' ><div>";
	           str += "<img src='${contextPath}/display?fileName=" + fileCallPath+"'>";
	           str += "</div>";
	           str +"</li>";
	         } else {
	           str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.filetype+"' ><div>";
	           str += "<span> "+ attach.fileName + "</span><br/>";
	           str += "<img src='${contextPath}/resources/img/attach.png'></a>";
	           str += "</div>";
	           str +"</li>";
	         }
	       });
	       
	       $(".uploadResult ul").html(str);
	     });//end getjson
	  })();//end function
	  
	  $(".uploadResult").on("click","li", function(e){
	      
	    console.log("view image");
	    
	    var liObj = $(this);
	    
	    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));

	    if(liObj.data("type")){
	      showImage(path.replace(new RegExp(/\\/g),"/"));
	    } else {
	      self.location ="${contextPath}/download?fileName=" + path;
	    }
	    
	    
	  });
	  
	  function showImage(fileCallPath){
	    $(".bigPictureWrapper").css("display","flex").show();
	    
	    $(".bigPicture")
	    .html("<img src='${contextPath}/display?fileName="+fileCallPath+"' >")
	    .animate({width:"100%", height: "100%"}, 1000);
	    
	  }

	  $(".bigPictureWrapper").on("click", function(e){
	    $(".bigPicture").animate({width:"0%", height: "0%"}, 1000);
	    setTimeout(function(){
	      $(".bigPictureWrapper").hide();
	    }, 1000);
	  });
	});

</script>
 -->

<%@include file="../includes/footer.jsp"%>