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
<!-- <link rel="stylesheet" href="/dormitory/resources/css/staff_MainPage.css"> -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script type="text/javascript">

	var boardNo = ${data.boardVo.board_no};
	var entNo = ${data.entStudVo.ENT_STUD_NO};
	var entStudNo = 0; //참고 0은 비회원으로 인지함

	function writeComment(){
		console.log("aaa");
		var commentValue = document.getElementById("commentInput").value;
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				document.getElementById("commentInput").value = "";	
				
				refreshCommentList();
			}
		}
		
		xhr.open("post" , "./writeComment"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("board_no=" + boardNo + "&cmmt_content=" + commentValue + "&ent_stud_no=" + entNo); //AJAX로 리퀘스트함..		
		
}

 	function refreshCommentList(){
		
 		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
 		xhr.onreadystatechange = function () {
 			if(xhr.readyState == 4 && xhr.status == 200){
 				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var commentListBox = document.getElementById("commentList");
 				commentListBox.innerHTML = "";	
				
 				for(commentData of jsonObj.data){
					
					var commentRowBox = document.createElement("div");
 					commentRowBox.classList.add("row-commentbox");
					
 					var col1 = document.createElement("div");
 					col1.classList.add("col");
 					col1.setAttribute("id", "commtentbox");
 					commentRowBox.appendChild(col1);
 					
 					var imgbox = document.createElement("div");
 					imgbox.classList.add("col-1");
 					col1.appendChild(imgbox);
 					
 					var imageInput = document.createElement("img");
 					imageInput.classList.add("radius_img_1");
 					imageInput.setAttribute("src", "/dormitory/resources/img/commentIcon.jpg");
 					imgbox.appendChild(imageInput);
 					
 					var writerbox = document.createElement("div");
 					writerbox.classList.add("writer");
 					col1.appendChild(writerbox);
 					
 					var writer = document.createElement("span");
 					writer.innerText = commentData.entStudVo.STUD_NAME;
 					writerbox.appendChild(writer);
 					
 					var commentinput = document.createElement("div");
 					commentinput.classList.add("textarea");
 					commentinput.innerText = commentData.commentVo.cmmt_content;
 					col1.appendChild(commentinput);
 					
					
 					var commtDate = document.createElement("div");
 					commtDate.classList.add("commtdate");
					
 					
  					var temp = new Date(commentData.commentVo.cmmt_reg_dt);
  						var Date1 = "";
  						var Date2 = "";
  						var Date3 = "";
  						Date1 += temp.getFullYear();
  						Date2 += ("0" + (1 + temp.getMonth())).slice(-2);
  						Date3 += ("0" + temp.getDate()).slice(-2);
  						Date4 = Date1+"."+Date2+"."+Date3
  						commtDate.innerText = Date4
  						col1.appendChild(commtDate);



//
 					var icon = document.createElement("img");
 					icon.classList.add("dangerimg");
 					icon.setAttribute("src", "/dormitory/resources/img/danger.png");
 					col1.appendChild(icon);
					
 					
 				//if(entStudNo == commentData.entStudVo.ENT_STUD_NO){
 					var deleteIcon = document.createElement("i");
 					deleteIcon.setAttribute("onclick" , "deleteComment("+commentData.commentVo.cmmt_no+")");
 					deleteIcon.classList.add("bi");
 					deleteIcon.classList.add("bi-trash-fill");
 					col1.appendChild(deleteIcon);
 				//}
 					commentListBox.appendChild(commentRowBox);
 				}
 			}
 		}
		
 		xhr.open("get" , "./getCommentList?board_no=" + boardNo); //리퀘스트 세팅..
 		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
 		xhr.send(); //AJAX로 리퀘스트함..
		
 	}
 	
 
 	
 	function deleteComment(cmmt_no){
 		console.log(cmmt_no);
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var result = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				console.log("ssss");
				refreshCommentList();
			}
		}
		
		xhr.open("get" , "./deleteCommentProcess?cmmt_no=" + cmmt_no); //리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..	
		console.log("aaaaaa");
	}
	
 		window.addEventListener("DOMContentLoaded" , function (){
 		//사실상 처음 실행하는 코드 모음...
 		refreshCommentList();
		
 	});	
	
	
</script>
<style type="text/css">
#title{
	font-size: 2em;
	font-weight: bold;
    background-color: white;
}

#title2{
    margin: auto;
	margin-top: 1em;
	font-size: 0.9em;
    color: #757575;
    padding-bottom: 1em;

}	

.title1{
    color: #292929;
    margin-left: 0.5em;
    font-size: 1.7em;
    font-weight: bold;
}

#span::after{
    content: " | ";
    font-size: 0.6em;
}

.cmmtInput {
  width: 500px;
  height: 32px;
  font-size: 15px;
  border: 0;
  border-radius: 15px;
  outline: none;
  padding-left: 10px;
  background-color: rgb(233, 233, 233);
}

.btn-two {
  color: #202020; 
  padding: 15px 25px;
  display: inline-block;
  border: 1px solid rgba(0,0,0,0.21);
  border-bottom-color: rgba(0,0,0,0.34);
  text-shadow:0 1px 0 rgba(0,0,0,0.15);
  box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
              0 2px 0 -1px rgba(0,0,0,0.13), 
              0 3px 0 -1px rgba(0,0,0,0.08), 
              0 3px 13px -1px rgba(0,0,0,0.21);
}

.btn-two:active {
  top: 1px;
  border-color: rgba(0,0,0,0.34) rgba(0,0,0,0.21) rgba(0,0,0,0.21);
  box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
  position: relative;
}

.btn-two.blue {background-color: #fdefc3;}


.btn-two.mini{
  padding: 4px 12px;  
  font-size: 12px;
}

.btn-two {
  margin: 9px;
}

#cmmt{
    margin-left: 3em;
    font-size: 1em;
    font-weight: bold;
     margin-right: 0.5em;
}

.commentContent::before{
    content: "| ";
    margin-left: 3em;
    margin-top: 1em;
}

#cmmtbox{
	margin-top: 10em; 
	box-shadow: 0 -5px 5px -5px #333;
	
}

#boardbtn{
  font-size: 12px;
  position: relative;
  top: 10em;
}



.row-commentbox{
  margin-top: 1em;
  border: 1px;
  width: 1100px;
  margin-left: 40px; 
  padding: 10px;
  box-shadow: 0 0 11.9px 2.9px rgb(0 0 0 / 10%);
  transition: all 0.2s linear;
}

.row-commentbox:hover{
	transform: scale(1.1);
}
#commtentbox{
  height: 75px;
  
}
.radius_img_1 {   
   border-radius: 50%;
   margin-top: 0.5em;
   margin-left: 1em;
   width: 67%; 
   height: 70%; 
   max-width: 70%;
  }
.writer{
  position: relative;
  left: 100px;
  bottom: 50px;
  font-size: 0.9em;
  font-weight: bold;
}
.textarea{
  position: relative;
  left: 100px;
  bottom: 45px;
  font-size: 0.8em;
}
.commtdate{
  position: relative;
  left: 930px;
  bottom: 92px;
  font-size: 0.8em;
}
.dangerimg{
  position: relative;
  left: 1000px;
  bottom: 117px;
  width: 18px; height: 13px;
}

.bi-trash-fill{
  position: relative;
  left: 1030px;
  bottom: 112px;	
}
</style>
</head>
<body>
	
		<jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>
		 
		 <div class="page-content p-5" id="content">
      
		
		
		<div class="container-fluid bg-white">
			<div class="row bg-white shadow-sm p-3 mb-5 bg-body rounded">
						<div id="title" class="col">
							<h2>자유게시판</h2> 
						</div>
					</div>
					<div class="row">
                        <div class="col title1">
                            <p>${data.boardVo.board_title }</p>
                        </div>
                    </div>
					<div id="title2" class="row border-bottom">
						<div class="col">
	                    	<span id="span">작성자 ${data.entStudVo.STUD_NAME }</span> 
	                    	<span>등록일 <fmt:formatDate value="${data.boardVo.board_reg_dt }" pattern="yy.MM.dd"/></span>
	              		</div>
					</div>
					<div class="boardbtn">
    					<a href="./deleteBoardProcess?board_no=${data.boardVo.board_no }" type="button" class="btn-two blue mini" style="float: right;">삭제</a> 
	               		<a type="button" class="btn-two blue mini" style="float: right;">수정</a>
	               </div>                
            <div class="row" style="margin-top: 2em;">
                <div class="col" style="font-size: 1em;">
                   ${data.boardVo.board_content }
                       	
                </div>
            </div>
            <div id="cmmtbox" class="row">
              <div class="col my-2" style="font-size: 1.5em; margin-left: 1em;">
                <h3>댓글</h3>
              </div>
              </div>
              <div class="row my-2" >
                <div class="col" style="margin-left: 2em;">
                  <input id="commentInput" class="shadow-sm cmmtInput" type="text">
                  <button class="btn-two blue mini" onclick="writeComment()">입력</button>
                </div>
              </div>
 <!--댓글-->
 				<div id="commentList"></div>
<!--               <div class="row-commentbox"> -->
<!--                 <div class="col" id="commtentbox"> -->
<!--                   <div class="col-1"> -->
<!--                     <img src="/dormitory/resources/img/commentIcon.jpg" style="width: 67%; height: 70%; max-width: 70%;" class="radius_img_1"> -->
<!--                   </div> -->
<!--                       <div class="writer"> -->
<!--                         <span>보리</span> -->
<!--                       </div> -->
<!--                       <div class="textarea">안녕하세요 보리입니다. 지금 노트북 뒤에서 자고 있어요.</div> -->
<!--                       <div class="commtdate">2022.05.05</div> -->
<!--                       <img src="/dormitory/resources/img/danger.png" class="dangerimg"> -->
<!--                 </div> -->
      	      
            </div>
		</div>
   		

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>