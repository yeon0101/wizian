<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 세션 만료</title>

<style type="text/css">
	#img{
		width: 100%;
		height: 100%;
	}
	#img:hover{
		width: 105%;
		height: 105%;
		transform: translateX(-2%) translateY(-2%);
		
		transition: .3s;
	}	
</style>

<script type="text/javascript">
	function goLoginPage() {
		
		document.getElementById('img').style.transform= 'translateY(-280%)';
		document.getElementById('background').style.transition='1.1s';
		document.getElementById('background').style.backgroundColor ='#F7C561';
		setTimeout(goLoginPage2,1100);
			
	}
	
	function goLoginPage2() {
		location.href='/dormitory/main/loginPage';
	}
	
</script>


</head>
<body style="background-color: white " id='background'>

<div style="position: absolute; top: 40%; left: 50%; transform: translateX(-50%) translateY(-50%);" id="imgDiv">

	<img src="../../resources/img/sessionEnd.png" id="img" onclick="goLoginPage()" style="cursor: pointer; border-radius: 10px">
	
</div>

</body>
</html>