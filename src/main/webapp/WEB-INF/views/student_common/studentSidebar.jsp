<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  

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
	  background-color: #ffeab5 !important;
	}
	.flex-column a{
	  font-size: 16px !important;
	  text-decoration: none;
	  background-color: #ffeab5;
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
				elm.style.backgroundColor='#d9bc75';
				elm.style.borderRight='4px solid white';
			}
		}
	});

    $(function() {
        // Sidebar toggle behavior
        $('#sidebarCollapse').on('click', function() {
          $('#sidebar, #content').toggleClass('active');
        });
      });
    </script>
    
    
    
    
  <div class="vertical-nav bg-white" id="sidebar">

  <div style="padding-left: 1vw; position: absolute; top: 90%">
	<span style="font-size: 1.2rem; font-weight:900 ; color: #d9bc75">Dormitory</span>
	<span style="font-size: 1.0rem; font-weight:100 ; color: #d9bc75"><br>Management System</span>
	
  </div>
  <div class="py-3 px-3 mb-2">
    <div class="media d-flex align-items-center">
      <img src="../../resources/img/은우.jpg" alt="..." width="65" class="mr-3 rounded-circle img-thumbnail shadow-sm" style="object-fit:cover">
      <div class="media-body" style="margin-left: 0.5vw">
        <h5 class="m-10">${sessionStudentInfo.stud_name}</h5>
        <p class="font-weight-light text-muted mb-0"></p>
      </div>
      <span style="cursor: pointer; font-size: 1.3vh;transform: translate(2vw,0)" class="font-weight-bold btn btn-light bg-white rounded-pill shadow-sm" 
      onclick="location.href='/dormitory/staff/login/staffLogoutProcess'">로그아웃</span>
    </div>
  </div>

  <p class="text-gray font-weight-bold text-uppercase px-3 small mb-1 mt-3">메인</p>

  <ul class="nav flex-column bg-white mb-0">
  	<li class="nav-item">
      <a href="/dormitory/student/main/studentMainPage" class="nav-link">
        <i class="bi bi-house-fill"></i>
        홈
            </a>
    </li>
    <li class="nav-item">
      <a href="/dormitory/student/notice/noticePage" class="nav-link">
        <i class="bi bi-card-text"></i>
        공지사항
            </a>
    </li>
    <li class="nav-item">
      <a href="/dormitory/student/board/boardListPage" class="nav-link">
        <i class="bi bi-people-fill"></i>
        자유게시판
            </a>
    </li>
  </ul>

   <p class="text-gray font-weight-bold text-uppercase px-3 small mb-1 mt-3">입사신청</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
      <a href="/dormitory/student/dormitoryEnterApplication/dormitoryEnterApplicationPage" class="nav-link">
        <i class="bi bi-pencil-square"></i>
        입사신청
            </a>
    </li>
    <li class="nav-item">
      <a href="/dormitory/student/dormitoryLife/studentAssortmentPage" class="nav-link">
        <i class="bi bi-card-list"></i>
        입사신청내역
            </a>
    </li>
  </ul>
  
   <p class="text-gray font-weight-bold text-uppercase px-3 small mb-1 mt-3">입사자종합</p>

  <ul class="nav flex-column bg-white mb-0">
    <li class="nav-item">
      <a href="/dormitory/student/dormitoryLife/nightOutApplyPage" class="nav-link ">
        <i class="bi bi-pencil-square"></i>
        외박신청
            </a>
    </li>
    
    
  </ul>
  
</div>

<!-- 사이드바 끝 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
  
    
