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
<link rel="stylesheet" href="/dormitory/resources/css/staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	<link href="https://fonts.googleapis.com/css?family=Gothic+A1:200" rel="stylesheet">
<style type="text/css">
  @import url('https://fonts.googleapis.com/css?family=Gothic+A1:100');

#box{
  margin: auto;
  width: 100%;
  height: 900px;
  border: 1px;

}
#left{
  width: 60%;
  float: left;
  box-sizing: border-box;
  
}
#right{
  width: 40%;
  float: right;
  box-sizing: border-box;
  padding: 0;
}

#rbox{
  border: 1px;
  background-color: #d1bea7;
  color: #4a4034;
  padding: 20px;
  width: 100%;
  height: 25%;
  font-size: 1.4em;
  font-weight: bold;
  color: #4a4034;
}
#rbox1{
  border: 1px;
  background-color: #f3ece2;
  padding: 20px;
  width: 100%;
  height: 25%;
  font-size: 1.4em;
  font-weight: bold;
  color: #4a4034;
}
#rbox2{
  border: 1px;
  color: #4a4034;
  width: 98%;
  height: 23%;
}

#rbox3{
  border: 1px;
  color: #4a4034;
  width: 100%;
  height: 26.5%;
  background-color: lightgray;
  padding: 20px;
  padding-top: 60px;
}
#plus{
  width: 30px;
  float: right;
}
.list{
  margin-top: 1em;
  font-size: 0.6em;
  font-weight: normal;
}

li::marker{
  color: #a38e73ef;
}

.page-content li{
	margin-top: 0.5em;
}

#fourbox{
  margin-top: 2em;
  color: white;
  font-size: 1.2em;
  text-align: center;
}
.badge{
  font-size: 0.6em;

}

#date{
  font-size: 0.8em;
  float: right;
}
.footer{
	margin-left: 2em;
	margin-right: 2em;
		
}

.footertext::after{
	content: " | ";
	
}
.footertext{
	
	text-align: justify;
	font-size: 0.9em;
	color: #757575;
}

.footertext2{
	margin-top: 1em;
	text-align: justify;
	font-size: 0.8em;
	color: #757575;
	}

</style>
</head>
<body>
<div class="container-fluid">

 <jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>
	<div class="page-content p-5" id="content">
      

	<div class="row">
                
            </div>

            <div id="box" class="row">
              <div id="left" class="col-7 px-0">
                <!--이미지-->
 <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/dormitory/resources/img/1.jpg" class="d-block w-100">
    </div>
    <div class="carousel-item">
      <img src="/dormitory/resources/img/2.jpg" class="d-block w-100">
    </div>
    
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
              </div>
              <div id="right" class="col-5">
                <div id="rbox" class="col">
                  <!--공지-->
                  <span>공지사항</span>
                  <img id="plus" src="/dormitory/resources/img/m_bbs_more.png">
                <div class="col list px-0">
                  <ul>
                    <li>생활관생 중간고사 야식 이벤트 <span class="badge bg-danger">new</span><span id="date">22.09.25</span></li>
                    <li>제2,3생활관 외벽 및 창가 실리콘보수공사 안내<span id="date">22.09.25</span></li>
                    <li>제1생활관 보일러 교체공사 및 단수 안내<span id="date">22.09.25</span></li>
                    <li>제2,3생활관 후문 폐쇄 안내<span id="date">22.09.25</span></li>
                    <li>제2,3생활관 긴급 소독작업<span id="date">22.09.25</span></li>
                  </ul>
                </div>
                </div>
                <div id="rbox1" class="col">
                  <!--자유게시판-->
                  <span>자유게시판</span>
                  <img id="plus" src="/dormitory/resources/img/m_bbs_more.png">
                  <div class="col list px-0">
                  <ul>
                    <li>기숙사에 무인 복사기가 설치 되면 좋을것 같습니다. <span class="badge bg-danger">new</span><span id="date">22.09.25</span></li>
                    <li>기숙사 비용 납부 문의 <span id="date">22.09.25</span></li>
                    <li>기숙사룸메<span id="date">22.09.25</span></li>
                    <li>기숙사 오티<span id="date">22.09.25</span></li>
                    <li><span class="d-inline-block text-truncate" style="max-width: 300px;">기숙사 침대랑 책상 오늘 기숙사 입실 했는데 아직 룸메가 안 왔는데 침대랑 책상은 어떻게 나누나요?</span><span id="date">22.09.25</span></li>
                  </ul>
                  </div>
                </div>
                <div id="rbox2" class="col">
                  <!--qa 외박신청 입사신청 상벌점 확인-->
                  
                    <div class="row" style="height: 100%;">
                      <div class="col-6" style="background-color:#61bbe7;"><div id="fourbox">입사신청</div></div>
                      <div class="col-6" style="background-color:#455774;"><div id="fourbox">Q&A</div></div>
                  
                      <div class="col-6" style="background-color:#349fd3;"><div id="fourbox">외박신청</div></div>
                      <div class="col-6" style="background-color:#2e394c;"><div id="fourbox">상벌점확인</div></div>
                    </div>
                </div>
                <!-- 푸터 -->
                <div id="rbox3" class="col">
                	<span class="footertext">자료이용</span>
                	<span class="footertext">이메일무단수집거부</span>
                	<span class="footertext">개인정보처리방침</span>
                	<span class="footertext">사이트맵</span>
                	<span class="footertext">찾아오시는길</span>
                	
                	<br>
                	<span class="footertext2">(1234)서울특별시 강남구 역삼동 649-5 에스코빌딩 6층 중앙정보기술인재개발원</span>
                	<br>
                	<span class="footertext2">전화번호: 02-561-1911</span>
                	<br>
                	<span class="footertext2">Copyright © Korea National University of Agriculture and Fisheries, All Rights Reserved.</span>
             </div>   
              </div>
            </div>
            
				
	
				
		     </div>
      	</div>
   	
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>