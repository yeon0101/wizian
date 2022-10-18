<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- <script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
  
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />  
  
  crossorigin="anonymous"></script> -->
  
<style>
  @charset "UTF-8";
  @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');


/*
*
* ==========================================
* CUSTOM UTIL CLASSES
* ==========================================
*
*/

	.vertical-nav {
	  min-width: 17rem;
	  width: 17rem;
	  height: 100vh;
	  position: fixed;
	  top: 0;
	  left: 0;
	  box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
	  transition: all 0.4s;
	  background-color: #c2d4ff !important;
	}
	
	.flex-column a{
	  font-size: 16px !important;
	  text-decoration: none;
	  background-color: #c2d4ff;
	}
	
	.page-content {
	  width: calc(100% - 17rem);
	  margin-left: 17rem;
	  transition: all 0.4s;
	}
	
	/* for toggle behavior */
	
	#sidebar.active {
	  margin-left: -17rem;
	}
	
	#content.active {
	  width: 100%;
	  margin: 0;
	}
	
	@media (max-width: 768px) {
	  #sidebar {
	    margin-left: -17rem;
	  }
	  #sidebar.active {
	    margin-left: 0;
	  }
	  #content {
	    width: 100%;
	    margin: 0;
	  }
	  #content.active {
	    margin-left: 17rem;
	    width: calc(100% - 17rem);
	  }
	}

/*
*
* ==========================================
* FOR DEMO PURPOSE
* ==========================================
*
*/

	body {
	  background-color: #f8f9fa;
	  min-height: 100vh;
	  overflow-x: hidden;
	  font-family: 'Noto Sans KR', sans-serif;
	}
	
	.separator {
	  margin: 3rem 0;
	  border-bottom: 1px dashed #fff;
	}
	
	.text-uppercase {
	  letter-spacing: 0.1em;
	}
	
	.text-gray {
 	  color: #aaa;
	}


 	.nav-link{ 
 	  color: #495057;
 	  padding-left: 1.5rem;
 	}
 	.nav-link:hover{
 		color:#fc7774;
 		
 	}


  .nav i{
    padding-right: 7px;
  }
 
  
	</style>

	<script type="text/javascript">

	document.addEventListener("DOMContentLoaded", function () {
		var navLink = document.getElementsByClassName('nav-link');
		var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];
		console.log(nowPage);
		
		for(elm of navLink){
			if( (elm.getAttribute("href").split('/'))[4].concat(".jsp") == nowPage){
				elm.removeAttribute('href');
				elm.style.color='white';
				elm.style.backgroundColor='#91b2ff';
				elm.style.borderRight='4px solid white';
			}
		}
	});

   
    </script>
    
    
    
    
  <div class="vertical-nav bg-white" id="sidebar">

  
    <div style=" padding-left: 1vw; position: absolute; top:90%">
<!--   <div style=" padding-left: 1vw;padding-top: 3vh;"> -->
	<span style="font-size: 1.2rem; font-weight:900 ; color: #91b2ff">Dormitory</span>
	<span style="font-size: 1.0rem; font-weight:100 ; color: #91b2ff"><br>Management System</span>
	
  </div>
  
<!--    -->
  
  <div class="py-3 px-3 mb-2">
    <div class="media d-flex align-items-center">
      <img src="../../resources/img/순재.png" alt="..." width="65" class="mr-3 rounded-circle img-thumbnail shadow-sm">
      <div class="media-body" style="margin-left: 0.5vw">
        <h5 class="m-0">${sessionStaffInfo.staff_name}</h5>
        <p class="font-weight-light text-muted mb-0">관리자</p>
      </div>
      <span style="cursor: pointer; font-size: 1.3vh;transform: translate(2vw,0)" class="font-weight-bold btn btn-light bg-white rounded-pill shadow-sm" 
      onclick="location.href='/dormitory/staff/login/staffLogoutProcess'">로그아웃</span>
    </div>
  </div>

  <p class="text-gray font-weight-bold text-uppercase px-4 small mb-1 mt-3">생활관관리</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
      <a href="/dormitory/staff/admin/adminPage" class="nav-link">
        <i class="bi bi-people"></i>
        생활관담당자관리
            </a>
    </li>
    <li class="nav-item">
      <a href="/dormitory/staff/plan/dormitoryInfoPage" class="nav-link">
        <i class="bi bi-building"></i>
        생활관호실정보관리
            </a>
    </li>
  </ul>

  
   <p class="text-gray font-weight-bold text-uppercase px-4 small mb-1 mt-3">입사관리</p>

  <ul class="nav flex-column bg-white mb-0">
     <li class="nav-item">
      <a href="/dormitory/staff/plan/planRegisterPage" class="nav-link">
        <i class="bi bi-calendar-plus"></i>
        입사계획등록
            </a>
    </li>
    
    <li class="nav-item">
      <a href="/dormitory/staff/dormitoryEnterApproval/dormitoryEnterApprovalPage" class="nav-link ">
        <i class="bi bi-card-checklist"></i>
        입사신청관리
            </a>
    </li>
    
    <li class="nav-item">
      <a href="/dormitory/staff/dormitoryRoomAssignments/dormitoryRoomAssignmentsPage" class="nav-link ">
        <i class="bi bi-door-open"></i>
        호실배정관리
            </a>
    </li>
    
     <li class="nav-item">
      <a href="/dormitory/staff/payment/paymentManagePage" class="nav-link ">
        <i class="bi bi-cash-coin"></i>
        생활관비납부관리
            </a>
    </li>
    
    

  </ul>
  
   <p class="text-gray font-weight-bold text-uppercase px-4 small mb-1 mt-3">입사생활</p>

  <ul class="nav flex-column bg-white mb-0">
       <li class="nav-item">
      <a href="/dormitory/staff/dormitoryLife/nightOutApprovalPage" class="nav-link ">
        <i class="bi bi-calendar2-check"></i>
        외박활동처리
            </a>
    </li>
    <li class="nav-item">
     <a href="/dormitory/staff/dormitoryLife/penaltyPointsGivePage" class="nav-link">
        <i class="bi bi-clipboard-check"></i>
        벌점활동처리
            </a>
    </li>    
    <li class="nav-item">
      <a href="/dormitory/staff/adminNotice/adminNoticePage" class="nav-link ">
        <i class="bi bi-motherboard"></i>
        공지사항관리
            </a>
    </li>
    
  </ul>


</div>
<!-- 사이드바 끝 -->
  
    
