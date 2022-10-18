<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<style>
  body{
    background-color: white;
    font-family: 'Noto Sans KR', sans-serif;
  }

  /* background-color: #f8f9fa; */

  header{
    background-color: rgb(87, 111, 208);
    height: 50px;
    color:white;
    font-size: 14px;
    padding:0;
    position:fixed;
    width:100%;
    left:0;
    top:0;
    
  }

  nav{
    width: 250px;
    height: 100%;
    position: fixed;
    top: 50px;
    border-right: #edeef0 solid;
  }

  main{
    margin-left: 250px;
    margin-top:40px;
    height: 100%;
    padding: 20px;
    
    
  }

  nav ul li a{
    display: block;
    padding: 8px 45px;
    color: #495057;
    font-size: 14px;
    text-decoration: none;
    list-style: none;
  }

  nav ul li a:hover,
  nav ul li a.active{
      font-weight: bold;
      color: rgb(87, 111, 208);
      background: rgb(244, 244, 244);
      border-right: rgb(87, 111, 208) solid 2px;
  }
 
  ul{
    padding: 0;
  }
  
   li{
  list-style: none;
  }

  .title{
    padding:10px 30px;
    font-size: 13px;
    color: #6c757d;
  }

  #profile-img{
    width: 30px;
  }

  .clicked-menu{
    background: rgb(244, 244, 244);
    font-weight: bold;
    border-right: rgb(87, 111, 208) solid 2px;
    color: rgb(87, 111, 208);
  }
  
  .container-fluid{
  	padding:0;
  }

</style>

<script>
	/* document.addEventListener("DOMContentLoaded", function(){

	  function menuActive(e){
	    var clickedMenu = document.getElementsByClassName('clicked-menu')[0];
	    clickedMenu.classList.remove('clicked-menu');
	    e.target.classList.add('clicked-menu');
	  }
	  
	  var menuList = document.getElementsByClassName("menu");
	  Array.from(menuList).forEach(menu=> {
	  menu.addEventListener("click", menuActive);
	  });

	});
 */
 	/* document.addEventListener("DOMContentLoaded", function () {
     var menuList = document.getElementsByClassName('menu');
     var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];
     
     for(elm of menuList){
        if(elm.getAttribute("onClick")=="location.href=''"){
           return;
        } 
        if( elm.getAttribute("href").split('/')[4].replace("'",".jsp") == nowPage){
           elm.classlist.add('clicked-menu');
           elm.parentNode.parentNode.previousElementSibling.className="menu";
        }
        
     }
  }); */


</script>


  <header class="mx-0">
    <div class="row px-3">
      <div class="col mx-2 fs-3">
        <img class="img-fluid" style="width:30px" src="../../resources/img/free-icon-revit-1379267.png" alt="dfdsf">
        Dormitory
      </div>
      <div class="col-5 text-end mt-2">
      	<span><button onclick="location.href='/dormitory/staff/login/staffLogoutProcess'">로그아웃</button></span>
        <span><input type="text" style="border: none;"></span>
        <span class="fs-5 px-2"><i class="bi bi-bell-fill"></i></span>
        <span class="px-2"><img id="profile-img" class="img-fluid rounded-circle" src="../../resources/img/none.gif" alt="dlalwl"></span>
        <span>${sessionStudentInfo.stud_name }</span>
      </div>
    </div>
  </header>

  <nav class="pt-3">
    <ul>
      <li class="menu"><a href="/dormitory/student/dormitoryEnterApplication/dormitoryEnterApplicationPage">입사신청</a></li>
      <li class="menu"><a href="/dormitory/student/dormitoryLife/nightOutApplyPage">외박신청</a></li>
      <li class="menu"><a href="/dormitory/student/notice/noticePage">공지사항</a></li>
       <li class="menu"><a href="/dormitory/student/board/boardListPage">자유게시판</a></li>
      <li class="menu"><a href="/dormitory/student/dormitoryLife/studentTempPage">입사자종합</a></li>
      
    </ul>
  </nav>
  
 
