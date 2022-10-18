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
<script type="text/javascript">
	
	
	
	
	function newWrite(){
		console.log("aaa");
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var writeNoticeBox = document.getElementById("writeNotice");
				writeNoticeBox.innerHTML = "";
							
				var formBox = document.createElement("form");
				formBox.setAttribute("action" , "./writeNoticeProcess");
				formBox.setAttribute("method" , "post");
				writeNoticeBox.appendChild(formBox);
				
				var writebox = document.createElement("div");
				writebox.classList.add("writebox");
				formBox.appendChild(writebox);
				
				var savebox = document.createElement("button");
				savebox.classList.add("btn");
			 	savebox.classList.add("writebtn");
				savebox.setAttribute("type", "submit");
				savebox.setAttribute("value" , "저장");
				savebox.innerText = "저장";
				writebox.appendChild(savebox);
				
				var writerBox = document.createElement("div");
				writerBox.classList.add("writer");
				writerBox.innerText = "작성자";
				writebox.appendChild(writerBox);
				
				var writerInputBox = document.createElement("div");
				writerInputBox.classList.add("writerInputBox");
				writebox.appendChild(writerInputBox);
				
				var writerInput = document.createElement("input");
				writerInput.classList.add("form-control");
				writerInput.classList.add("form-control-sm");
				writerInput.setAttribute("type", "text");
				writerInput.setAttribute("readonly","true");
				writerInput.value= jsonObj.staffVo.staff_name;
				writerInputBox.appendChild(writerInput);
				
				
				var titlebox = document.createElement("div");
				titlebox.classList.add("title");
				titlebox.innerText = "공지사항 제목";
				writebox.appendChild(titlebox);
				
				var titleInputBox = document.createElement("div");
				titleInputBox.classList.add("titleInputBox");
				writebox.appendChild(titleInputBox);
				
				
				var inputTitle = document.createElement("input");
				inputTitle.classList.add("form-control");
				inputTitle.classList.add("form-control-sm");
				inputTitle.setAttribute("type" , "text");
				inputTitle.setAttribute("name" , "notice_title");
				titleInputBox.appendChild(inputTitle);
				
				var writedate = document.createElement("div");
				writedate.classList.add("date");
				writedate.innerText = "작성일";
				writebox.appendChild(writedate);
				
				var datebox = document.createElement("div");
				datebox.classList.add("datebox");
				writebox.appendChild(datebox);
				
				var inputDate = document.createElement("input");
				inputDate.setAttribute("type" , "date");
				inputDate.classList.add("form-control");
				inputDate.classList.add("form-control-sm");
				//inputDate.setAttribute("readonly","true");
			
				var temp = new Date(jsonObj.notice_reg_dt);
 					var Date1 = "";
 					var Date2 = "";
 					var Date3 = "";
 					Date1 += temp.getFullYear();
 					Date2 += ("0" + (1 + temp.getMonth())).slice(-2);
 					Date3 += ("0" + temp.getDate()).slice(-2);
					Date4 = Date1+"."+Date2+"."+Date3
 					inputDate.value = Date4
					datebox.appendChild(inputDate);
				//inputDate.value = jsonObj.notice_reg_dt;
				//dateBox.appendChild(inputDate);
				
				var checkbox = document.createElement("div");
				checkbox.classList.add("noticecheck");
				checkbox.innerText = "상단고정여부";
				writebox.appendChild(checkbox);
				
				var inputCheck = document.createElement("input");
				inputCheck.setAttribute("type" , "checkbox");
				inputCheck.setAttribute("name" , "notice_pin");
				inputCheck.setAttribute("value" , "1");
				inputCheck.setAttribute("id" , "input_ckeck");
				checkbox.appendChild(inputCheck);
				
				var inputHiddenCheck = document.createElement("input");
				inputHiddenCheck.setAttribute("type" , "hidden");
				inputHiddenCheck.setAttribute("name" , "notice_pin");
				inputHiddenCheck.setAttribute("value" , "0");
				inputHiddenCheck.setAttribute("id" , "input_check_hidden");
				checkbox.appendChild(inputHiddenCheck);
				
				
				
				var noticeContent = document.createElement("div");
				noticeContent.classList.add("content");
				noticeContent.innerText = "공지내용";
				writebox.appendChild(noticeContent);
				
				var contentBox = document.createElement("div");
				contentBox.classList.add("contentbox");
				writebox.appendChild(contentBox);
				
				var inputcontent = document.createElement("textarea");
				inputcontent.classList.add("form-control");
				inputcontent.setAttribute("rows", "6");
				inputcontent.setAttribute("name" , "notice_content");
				contentBox.appendChild(inputcontent);
				
				
				var hiddenBox = document.createElement("input");
				hiddenBox.setAttribute("type" , "hidden");
				hiddenBox.setAttribute("name" , "admin_no");
				hiddenBox.setAttribute("value" , jsonObj.adminVo.admin_no);
				formBox.appendChild(hiddenBox);
				writeNoticeBox.appendChild(formBox);
			}
		}
		
		xhr.open("get" , "./callWriteNoticeProcess");//리퀘스트 세팅..
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send(); //AJAX로 리퀘스트함..				
	}
	
	
	
	function OnlyRead(noticeNo){
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var writeNoticeBox = document.getElementById("writeNotice");
				writeNoticeBox.innerHTML = "";
				
				var writebox = document.createElement("div");
				writebox.classList.add("writebox");
				writeNoticeBox.appendChild(writebox);
				
				var writerBox = document.createElement("div");
				writerBox.classList.add("writer");
				writerBox.innerText = "작성자";
				writebox.appendChild(writerBox);
								
				var writerInputBox = document.createElement("div");
				writerInputBox.classList.add("writerInputBox");
				writebox.appendChild(writerInputBox);
				
				var writerInput = document.createElement("input");
				writerInput.classList.add("form-control");
				writerInput.classList.add("form-control-sm");
				writerInput.setAttribute("type", "text");
				writerInput.setAttribute("readonly","true");
				writerInput.value= jsonObj.dataList.staffVo.staff_name;
				writerInputBox.appendChild(writerInput);
									
				var titlebox = document.createElement("div");
				titlebox.classList.add("title");
				titlebox.innerText = "공지사항 제목";
				writebox.appendChild(titlebox);
				
				var titleInputBox = document.createElement("div");
				titleInputBox.classList.add("titleInputBox");
				writebox.appendChild(titleInputBox);
				
				var inputTitle = document.createElement("input");
				inputTitle.classList.add("form-control");
				inputTitle.classList.add("form-control-sm");
				inputTitle.setAttribute("type" , "text");
				inputTitle.setAttribute("readonly" , "true");
				inputTitle.value= jsonObj.dataList.noticeVo.notice_title;
				titleInputBox.appendChild(inputTitle);
				
				var writedate = document.createElement("div");
				writedate.classList.add("date");
				writedate.innerText = "작성일";
				writebox.appendChild(writedate);
				
				var datebox = document.createElement("div");
				datebox.classList.add("datebox");
				writebox.appendChild(datebox);
				
				var inputDate = document.createElement("input");
				inputDate.setAttribute("type" , "text");
				inputDate.classList.add("form-control");
				inputDate.classList.add("form-control-sm");
				inputDate.setAttribute("readonly" , "true");
			
 				var temp = new Date(jsonObj.dataList.noticeVo.notice_reg_dt);
  					var Date1 = "";
  					var Date2 = "";
  					var Date3 = "";
  					Date1 += temp.getFullYear();
  					Date2 += ("0" + (1 + temp.getMonth())).slice(-2);
  					Date3 += ("0" + temp.getDate()).slice(-2);
 					Date4 = Date1+"년"+Date2+"월"+Date3+"일"
  					inputDate.value = Date4
					datebox.appendChild(inputDate);
				
				var noticeContent = document.createElement("div");
				noticeContent.classList.add("content");
				noticeContent.innerText = "공지내용";
				writebox.appendChild(noticeContent);
				
				var contentBox = document.createElement("div");
				contentBox.classList.add("contentbox");
				writebox.appendChild(contentBox);
				
				var inputcontent = document.createElement("textarea");
				inputcontent.classList.add("form-control");
				inputcontent.setAttribute("rows", "6");
				inputcontent.setAttribute("readonly", "true");
				inputcontent.innerText = jsonObj.dataList.noticeVo.notice_content;
				contentBox.appendChild(inputcontent);
				

				
				
			}
		}
			xhr.open("get" , "./readNoticeProcess?notice_no=" + noticeNo); //리퀘스트 세팅..
			//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send(); //AJAX로 리퀘스트함..
}
	
	
				
	function deleteCheck() {
		  const query = 'input[id="notice_no"]:checked';
		  const selectedEls = document.querySelectorAll(query);
		  
		  // 선택된 목록에서 value 찾기
		  let result = '';
		  selectedEls.forEach((el) => {
		    result += el.value + ' ';
		  });
		  
		   let arr = result.split(' ');
		  // alert(arr);
		
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () {
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
				//var getNotice = document.getElementsById("notice_no").value;
				location.href="./adminNoticePage"
				
			}
		}
		
		xhr.open("post" , "./deleteNoticeProcess"); //리퀘스트 세팅..
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("notice_no=" + arr); //AJAX로 리퀘스트함..
	}
	

	
</script>
<style type="text/css">
thead{
	background-color: #F7C561 ;
	text-align: center;
}
.thcontent{
	text-align: center;
}

.tr{
	border: inherit;
	border-width: 1px;
}

.noticebtn{
	background-color: #f1f1f1;
}

.writebox{
	border-radius: 10px;
	border: 1px;
	background-color: #fdefc3;
	box-shadow: 0 .125rem .25rem rgba(0,0,0,.20)!important;
	height: 300px;
}

.writer{
	position: relative;
	left: 50px;
	top: 50px;
	font-size: 1.2em;
	font-weight: bold;
}
.writerInputBox{
	width: 400px;
	position: relative;
	left: 200px;
	top: 18px;
}
.title{
	position: relative;
	left: 50px;
	top: 50px;
	font-size: 1.2em;
	font-weight: bold;
}
.titleInputBox{
	width: 400px;
	top: 20px;
	position: relative;
	left: 200px;
	
}
.date{
	position: relative;
	left: 50px;
	top: 50px;
	font-size: 1.2em;
	font-weight: bold;
}
.datebox{
	position: relative;
	left: 200px;
	top: 20px;
	font-size: 1.2em;
	width: 400px;
	
}

.writebtn{
	position: relative;
	left: 1460px;
	top: 10px;
	background-color:  #f1f1f1;
}
.content{
	position: relative;
	left: 800px;
	bottom: 120px;
	font-size: 1.2em;
	font-weight: bold;
}
.contentbox{
	width: 500px;
	height: 70px;
	position: relative;
	left: 950px;
	bottom: 160px;
}
.tdtitle{
	text-align: left;
}

	
.tab-content{
	background-color: #fff;
    border-bottom-left-radius: 0.375rem;
    border-bottom-right-radius: 0.375rem;
    padding: 0.5rem;
    border: 1px solid #dee2e6;
    border-top: 0;
   }
   
   
/* .nav-tabs {
	border-width: 0px;
	background-color: #e9ecef;
	border-top-left-radius: 0.375rem;
    border-top-right-radius: 0.375rem;
} */

.nav-tabs .nav-link{
	color: #495057;
	background-color:#F7C561;
}

.table-wrapper{
	/* height:250px;
overflow-y:auto; */
	background-color:white;
	border-radius:0.375rem;
	overflow:hidden;
}

.table{
	margin-bottom:0;
	
	
}

.table thead{
	text-align: center;
	background-color: #F7C561;
	vertical-align: middle;
}

.shadow{
	box-shadow: 0 .125rem .25rem rgba(0,0,0,.20)!important;
}

.page-content .btn{
  border-color: #6C758A;
  color: #495057;
  font-size: 0.8rem;
  background-color: #f1f1f1;
  padding: 0.2rem 0.7rem;
}
 .btn1{
 	border: none;
 }
 
 .noticecheck{
	font-weight: bold;
	position: relative;
	left: 50em;
	bottom: 170px;

}
</style>
</head>
<body>

<jsp:include page="../../staff_common/staffSidebar.jsp"></jsp:include>


   <div class="page-content p-5" id="content">	
				
					<div class="row my-2 px-2">
							<div class="col my-2" style="text-align: right;">
								<button type="button" class="btn noticebtn" onClick="newWrite()">신규</button> 
								<button  type="button" class="btn noticebtn" onClick="deleteCheck()">삭제</button>
							</div>
						</div>	
					
					<div class="table-wrapper">
						<table class="table table-striped table-bordered">
							<thead class="shadow p-3 mb-5 rounded">
								<tr>
								  <th><input type="checkbox"></th>
								  <th>제목</th>
								  <th>담당자</th>
								  <th>작성일</th>
								</tr>
							  </thead>
							  <c:forEach items="${dataList }" var="data">
							  <tbody>
								<tr>
								  <td class="thcontent"><input id="notice_no" type="checkbox" value="${data.noticeVo.notice_no }"></td>
								  <td class="tdtitle"><button  type="button" class="btn1" onClick="OnlyRead(${data.noticeVo.notice_no})">${data.noticeVo.notice_title }</button></td>
								  <td  class="thcontent">${data.staffVo.staff_name }</td>
								  <td  class="thcontent"><fmt:formatDate value="${data.noticeVo.notice_reg_dt }" pattern="yy.MM.dd"/></td>
								</tr>
							</c:forEach>
						  </table>
						</div>  
					<hr>
				
				
				
				



	<div class="row" id="writeNotice"></div> 
	
	
	
					
				
				
			</div>


	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>