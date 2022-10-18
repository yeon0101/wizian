<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
	
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style type="text/css">
	
</style>
	
<script type="text/javascript">
	
	
	function login() {
		
		//값 옴 컨트롤러로 넘기면 됨. 예외처리도 하셈 값안왔을때
		var inputID = document.getElementById('inputID');
		var inputPW = document.getElementById('inputPW');

		//아이디창이나 비밀번호창 비어있는데 로그인시도할때
		if(inputID.value.trim() == "" || inputPW.value.trim() == ""){
			swal("아이디와 비밀번호를 입력해주세요","", "");
		}else{
			var loginForm = document.getElementById('loginForm');
			loginForm.submit();
		}
		
	}
	
	document.addEventListener("DOMContentLoaded",function(){
		if("${loginState}" == "fail"){
			swal("로그인 실패","","").then(function () {
				location.href= "./loginPage";
			});
			
		}
	});

	
	function showStudentLoginForm(){
		
		document.getElementById('studentLogin').className = 'btn btn-dark';
		document.getElementById('adminLogin').className = 'btn btn-outline-dark';
		
		var idInputBox = document.getElementById('inputID');
		idInputBox.name = 'stud_id';
		idInputBox.setAttribute('placeholder','학번');
		
		var pwInputBox = document.getElementById('inputPW');
		pwInputBox.name = 'stud_pw';
		
		var loginForm = document.getElementById('loginForm');
		loginForm.action = '/dormitory/student/login/studentLoginProcess';
	}
	
	
	function showAdminLoginForm(){
		
		document.getElementById('adminLogin').className = 'btn btn-dark';
		document.getElementById('studentLogin').className = 'btn btn-outline-dark';

		var idInputBox = document.getElementById('inputID');
		idInputBox.name = 'staff_id';
		idInputBox.setAttribute('placeholder','직원번호');
		
		var pwInputBox = document.getElementById('inputPW');
		pwInputBox.name = 'staff_pw';
		
		var loginForm = document.getElementById('loginForm');
		loginForm.action = '/dormitory/staff/login/staffLoginProcess';
	}

</script>


</head>
<body>


	<div class="container" style="width:500px; height:400px;margin-top: 15%">
		<div class="row">
			<div class="col">
				<div class="row my-2 g-1">
					<div class="col d-grid"><button id="studentLogin" class="btn btn-dark" onclick="showStudentLoginForm()">학생로그인</button></div>
					<div class="col d-grid"><button id="adminLogin" class="btn btn-outline-dark" onclick="showAdminLoginForm()">직원로그인</button></div>
				</div>
				<form action="/dormitory/student/login/studentLoginProcess" method="post" id="loginForm">
				<div class="row my-2">
					<div class="col">
						<input type="text" id="inputID" name="stud_id" class="form-control" placeholder="학번" onKeypress="javascript:if(event.keyCode==13) {login()}">
					</div>
				</div>
				<div class="row my-2">
					<div class="col">
						<input type="password" id="inputPW" name="stud_pw" class="form-control" placeholder="비밀번호" onKeypress="javascript:if(event.keyCode==13) {login()}">
					</div>
				</div>
				</form>
				<div class="row">
					<div class="col d-grid"><button id="loginBtn" class="btn btn-warning" onclick="login()">로그인</button></div>
				</div>
			</div>
		</div>
	</div>
	

	
	

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
		crossorigin="anonymous"></script>
</body>
</html>