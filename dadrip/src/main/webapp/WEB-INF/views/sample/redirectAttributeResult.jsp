<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body onload="result()">

	RedirectAttributeResult : ${msg }	

	<script type="text/javascript">
		function result() {
			var msg = "${msg}";
			
			alert(msg);
		}
	</script>
</body>
</html>