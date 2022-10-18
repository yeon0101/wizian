<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<style type="text/css">

	#col{
		background-color: lightgray;
	}
	#col1{
		text-align: center;
		font-weight: bold;
		background-color: lightgray;
	}

	#col2{
		text-align: center;
	}



	#row1{
		margin-top: 4em;
		height: 12em;
		background-color: lightgray;
	}	

	#input1{
		width: 9rem;
		height: 1.4rem;
		margin-left: 1em;
		background-color: antiquewhite;
	}
	#col1-1{
		margin-top: 1em;

	}

	#input2{
		width: 25rem;
		height: 1.4em;
		margin-left: 1em;
	}

	#input3{
		margin-top: 1em;
		width: 80rem;
		height: 5em;
		margin-left: 1em;
	}
	
	#submit{
		margin-top: 1em;
		padding-left: 9em;
	}
</style>
</head>
<body>
<jsp:include page="../../staff_common/staffCommon.jsp"></jsp:include>



	<main>
	  
				<div id="row1" class="row border">
                    <div class="col">
                    <form action="./writeNoticeProcess" method="post">
                        <div class="row">
                        
                            <div id="col1-1" class="col-3"><span>작성자</span><input id="input1" type="text" readonly></div>
                            <div id="col1-1" class="col"><span>제목</span><input id="input2" type="text" name="notice_title"></div>
                            <div id="submit" class="col-2"><input type="submit" value="등록"></div>
                        
                        </div>
						<div class="row">
							<div class="col-2"><span>내용</span></div>
							<div class="col"><textarea id="input3" name="notice_content"></textarea></div>
						</div>
					</form>
                    </div>
                </div>
		<!-- 
		<div class="row" >
			<div class="col">
				작성자: 담당자	<br>
				<form action="./writeNoticeProcess" method="get">
				제목: <input type="text" name="notice_title"><br>
				내용 :<br> 
				<textarea rows="10" cols="50" name="notice_content"></textarea><br>
				<input type="submit" value="등록">
				</form>	
			</div>
		</div>-->
	</main>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>