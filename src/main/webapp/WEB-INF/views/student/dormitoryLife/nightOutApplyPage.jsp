<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외박승인</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
 
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style>
	.page-content{
      font-size:0.8rem;
   }
   table{
    width: 100%;
    border-collapse: collapse;
    }
	
	thead{
		text-align: center;
		position: relative;
	}.ui-datepicker th {
    background: #ffffff;
    }
    
	.table thead tr{
	 position: sticky;
	  top: 0;
	  border-top: 0;
  	background-clip: padding-box;
  	background-color: #F7C561;
  	border-bottom-width: thin;
	border-bottom-color: #696767;
	}
	thead tr th{
		border-right: 1px solid #dee2e6;
	}
	thead tr th:first-child{
		border-right: 0; 
	}

	tbody th{
	background-clip: padding-box;
	}
	tbody tr td{
	text-align: center;
	border-right: 1px solid #dee2e6;
}
	.shadow{
	box-shadow: 0 .125rem .25rem rgba(0,0,0,.20)!important;
	}
	
	.table-wrapper{
		/* height:250px;
		overflow-y:auto; */
		background-color:white;
		border-radius:10px;
		overflow:hidden;
	}
	textarea {
			width: 100%;
			height: 100px;
			padding: 10px;
			box-sizing: border-box;
			border-radius: 5px;
			font-size: 12px;
			resize: none;
		}

	.rounded {
	  border-radius: 10px;
	}
		/*네비바*/
	.nav-tabs {
	    --bs-nav-tabs-border-width: 0;
	    --bs-nav-tabs-link-active-color: #495057;
	    --bs-nav-tabs-link-active-bg: #F7C561;
   }
   
   
       /*네비바*/
    .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #000000;
    background-color: var(--bs-nav-tabs-link-active-bg);
    border-color: var(--bs-nav-tabs-link-active-border-color);
    font-weight: bold;
	}
     .nav {
    --bs-nav-link-color: #858585;
    }
    .nav-tabs .nav-link{
	color: #495057;
	background-color:#efefef;
	}
      
	.btn-primary {
    --bs-btn-color: #696767;
    --bs-btn-bg: #f1f1f1;
    --bs-btn-border-color: #6C758A;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #898a8b;
    --bs-btn-hover-border-color: #ffffff;
     padding: 0.2rem 0.7rem;
	}
	.btn {
    --bs-btn-font-size: 0.8rem;
    }

 </style>

</head>
<body>
<jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>
 
   <div class="page-content p-4" id="content">
				<!-- 여기다 작성하세요 -->
		<div class="row py-1"></div>
       	<div class="row mb-2">
    		<div class="col text-end">
    			<button class="btn btn-primary" onclick="check()">조회</button>
    			<button class="btn btn-primary" onclick="nightOutApply()">외박신청</button>
    			<button class="btn btn-primary" onclick="deleteMyAct()">외박취소</button>
    		</div>
   		</div>		
   		<div class="table-wrapper shadow">		
   		<div class="row py-3"></div>
	 		<div class="row shadow py-3 mx-3" style="background: #fdefc3; border-radius:10px;" >
	 			<div class="col"><!-- 입사명, 성명 -->
	 				<div class="row mb-1">
	 					<div class="col-1 p-0 text-end">입사명</div>
	 					<div class="col">
	                               <select name="" class="form-control form-control-sm" id="entInfo">
	                                   <c:forEach items="${entInfo}" var="info">
	                                       <option value="${info.ENT_NO}"> 
	                                       <c:if test="${info[0].ENT_NAME}">selected="selected"</c:if>>
	                                       ${info.ENT_NAME}
	                                       </option>
	                                   </c:forEach>
	                               </select>		 							
	 					</div>
	 					<div class="col-1  p-0 text-end">호실</div>
	 					<div class="col"><input class="form-control form-control-sm" disabled value="${dmtInfo.ROOM_NAME }"></div>
	 					<div class="col-1  p-0 text-end">학부(과)</div>
	 					<div class="col"><input class="form-control form-control-sm" disabled value="${studInfo.stud_dept}"></div>
	 				</div>
	 				<div class="row">
	 					<div class="col-1  p-0 text-end">성명</div>
	 					<div class="col"><input class="form-control form-control-sm" disabled value="${studInfo.stud_name}"></div>
	 					<div class="col-1  p-0 text-end">학번</div>
	 					<div class="col"><input class="form-control form-control-sm" disabled value="${studInfo.stud_id}"></div>
	 					<div class="col-1  p-0 text-end">학년</div>
	 					<div class="col"><input class="form-control form-control-sm" disabled value="${studInfo.stud_grade}"></div>
	 				</div>
	 			</div>	
	 		</div>	
 		
 		<div class="row py-3"></div>
			<div class="row shadow py-3 mx-3" style="background: #fdefc3; border-radius:10px;" id="nightOutApplyContent">
				<div class="col">
					<div class="row mb-1">
						<div class="col-3  p-0 text-end">외박분류</div>
						<div class="col">
							<select name="" class="form-control form-control-sm"  id="selectAct">
			                      <c:forEach items="${actStandard}" var="act">
			                          <option value="${act.act_cd}">
			                          <c:if test="${act.act_nm}">selected="selected"</c:if>>
			                           ${act.act_nm}
			                          </option>
			                      </c:forEach>
			            	</select>	
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-3 p-0 text-end">외박시작</div>
		 				<div class="col"><input class="datepicker" style="width:100%;" id="startDate" value=""></div>
		 			</div>
		 			<div class="row mb-1">	
		 				<div class="col-3  p-0 text-end">외박종료</div>
		 				<div class="col"><input class="datepicker" style="width:100%;" id="endDate" value=""></div>
					</div>
					<div class="row">
						<div class="col-3  p-0 text-end">총외박일수</div>
						<div class="col"><input class="form-control form-control-sm" id="i_result" value=""></div>
					</div>
				</div>
				<div class="col">
					<div class="row ms-1 mb-1"><div class="col">신청사유</div></div>
					<div class="row ms-1">
						<div class="col"><textarea rows="4" cols="40" id="reason"></textarea></div>
					</div>
				</div>
				<div class="col">
					<div class="row mb-1">
		 				<div class="col-4 p-0 text-end">보호자연락처</div>
						<div class="col"><input class="form-control form-control-sm" disabled value="${studInfoVo.GRDN_PHONE }"></div>
					</div>
					<div class="row mb-1">
						<div class="col-4 p-0 text-end">신청일시</div>
						<div class="col"><input class="form-control form-control-sm" disabled id="todayDate" value="">
									<input type="hidden" id="hiddenResult" value="">
						</div>
					</div>
					<div class="row mb-1">
						<div class="col-4 p-0 text-end">신청취소일시</div>
						<div class="col"><input class="form-control form-control-sm" disabled value=""></div>
					</div>
					<div class="row mb-1">
						<div class="col-4 p-0 text-end">활동승인여부</div>
						<div class="col"><input class="form-control form-control-sm" disabled value=""></div>
					</div>
				</div>
			</div>	
	
 		<div class="row py-3"></div>
 		
 		<div class="row mx-3" ><!-- 내가 신청한 외박 리시트 -->
 			<div class="col">
 			<div class="row">
 			 		<ul class="nav nav-tabs" id="myTab" role="tablist">
					  <li class="nav-item" role="presentation">
					    <button class="nav-link active" onclick="check()" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">외박내역</button>
					  </li>
					  <li class="nav-item" role="presentation">
					    <button class="nav-link" onclick="cancelList()" id="profile-tab" data-bs-toggle="tab" data-bs-target="#profile" type="button" role="tab" aria-controls="profile" aria-selected="false">외박취소내역</button>
					  </li>
					</ul>
 			</div>
			<div class="row shadow" style="height:400px; overflow: auto;">
				<div class="col">
						<div class="row " id="tableRow">
							<table class="table table-sm table-striped">
							  <thead>
							    <tr>
							      <th scope="col">신청번호</th>
							      <th scope="col">신청일시</th>
							      <th scope="col">신청사유</th>
							      <th scope="col">외박시작일</th>
							      <th scope="col">외박종료일</th>
							      <th scope="col">외박일수</th>
							      <th scope="col">승인상태</th>
							      <th scope="col">취소일자</th>
							    </tr>
							  </thead>
							  <tbody>
							   	<c:forEach items="${myActDtlList }" var="list">
							    <tr>
							      <th scope="row">${list.act_no}</th>
							      <td>${list.act_req_dt}</td>
							      <td>${list.act_rsn}</td>
							      <td>${list.act_start_dt }</td>
							      <td>${list.act_ent_dt}</td>
							      <td>${list.act_day_cnt }</td>
							      <td>${list.act_conf_yn }</td>
							      <td>${list.act_cancl_dt }</td>
							    </tr>
							    </c:forEach>
							  </tbody>
							</table>						
						</div>
 					</div>
 				</div>
 			</div>
 		</div>
 		<div class="row py-3"></div>
 		</div>
 	</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>

<script>
var myEntStudNo = 0;

function getEntNo() {
	   var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	         if(xhr.readyState == 4 && xhr.status == 200){
	            var jsonObj = JSON.parse(xhr.responseText);

	            if(jsonObj.result == 'success'){
	            	myEntStudNo = jsonObj.data;
	            }else{
	            	swal({
	            		title : '',
	            		text: '입사승인 후 이용할 수 있습니다.',
            	    	icon  : 'warning',
            	    	closeOnClickOutside : false
	            	}, function(){
	            		location.href='../main/studentMainPage';
	            	});
	            }
	            
	         }
	      }
	      xhr.open("post", "./getEntNo", false);
	      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	      xhr.send();
	   }

function nightOutApply() {	  
	var actCD = document.getElementById("selectAct").value;
	var entNo = document.getElementById("entInfo").value;
	var reqDt = document.getElementById("hiddenResult").value;
	var startDt = document.getElementById("startDate").value;
	var endDt = document.getElementById("endDate").value;
	var iResult = document.getElementById("i_result").value;
	var reasonVa = document.getElementById("reason").value;
	
	if(endDt == '' || reasonVa == '' ){//모집차수 전체인데 자동승인하려고하면 안되도록
		swal("","빈칸을 채워주세요", "warning");
		return;
	}else{
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
			swal("","외박신청되었습니다", "success");

			document.getElementById("endDate").value = "";
			document.getElementById("i_result").value ="";
			document.getElementById("reason").value = "";
			check();
			}
		}
		xhr.open("post" , "./insertAct?act_cd="+actCD+"&ent_stud_no="+myEntStudNo+"&ent_no="+entNo+"&act_req_dt="+reqDt+"&act_start_dt="+startDt+"&act_ent_dt="+endDt+"&act_day_cnt="+iResult+"&act_rsn="+reasonVa);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();

		}
} 

function deleteMyAct() {
  // 선택된 목록 가져오기
  const query = 'input[name="check1"]:checked';
  const selectedEls = document.querySelectorAll(query);
  
  // 선택된 목록에서 value 찾기
  let result = '';
  selectedEls.forEach((el) => {
    result += el.value + ' ';
  });
	let arr = result.split(' ');
	//alert(arr);
	
	if(arr == '' ){//모집차수 전체인데 자동승인하려고하면 안되도록
		swal("","선택된 항목이 없습니다", "warning");
		return;
	}else{
		var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				if(jsonObj.result == 'fail'){
					swal("","승인처리되어 취소할 수 없습니다", "warning");
					return;
				}else{
					swal("","외박신청이 취소되었습니다", "success");
					check();
				}
			}
		}
		xhr.open("post" , "./deleteMyAct");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("act_no="+arr);
	} 	
}
function check() {
	var entNo = document.getElementById("entInfo").value;
	
	  var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON
				
				var tableRowBox = document.getElementById("tableRow")
				tableRowBox.innerHTML = "";
			
					var tableBox = document.createElement("table")
					tableBox.classList.add("table")
					tableBox.classList.add("table-sm")
					tableBox.classList.add("table-striped")

					var theadBox = document.createElement("thead")
					tableBox.appendChild(theadBox)

					var trBox = document.createElement("tr")
					theadBox.appendChild(trBox)
					
				    var thBox9 = document.createElement("th")
		            thBox9.setAttribute("scope","col")
		            trBox.appendChild(thBox9)
		
					var thBox1 = document.createElement("th")
					thBox1.setAttribute("scope","col")
					thBox1.innerText = "신청번호"
					trBox.appendChild(thBox1)

					var thBox2 = document.createElement("th")
					thBox2.setAttribute("scope","col")
					thBox2.innerText = "신청일시"
					trBox.appendChild(thBox2)

					var thBox3 = document.createElement("th")
					thBox3.setAttribute("scope","col")
					thBox3.innerText = "신청사유"
					trBox.appendChild(thBox3)

					var thBox4 = document.createElement("th")
					thBox4.setAttribute("scope","col")
					thBox4.innerText = "외박시작"
					trBox.appendChild(thBox4)

					var thBox5 = document.createElement("th")
					thBox5.setAttribute("scope","col")
					thBox5.innerText = "외박종료"
					trBox.appendChild(thBox5)

					var thBox6 = document.createElement("th")
					thBox6.setAttribute("scope","col")
					thBox6.innerText = "외박일수"
					trBox.appendChild(thBox6)

					var thBox7 = document.createElement("th")
					thBox7.setAttribute("scope","col")
					thBox7.innerText = "승인상태"
					trBox.appendChild(thBox7)
					
					var tbodyBox = document.createElement("tbody")
					tableBox.appendChild(tbodyBox)

					for( myActDtlData of jsonObj.data){
					
						if(myActDtlData.act_cancl_dt == null){
							var tr2Box = document.createElement("tr")
							tbodyBox.appendChild(tr2Box)

							var th2Box = document.createElement("th")
							th2Box.setAttribute("scope","row")
							tr2Box.appendChild(th2Box)

			               var inputBox2 = document.createElement("input")
			               inputBox2.setAttribute("type","checkbox")
			               inputBox2.setAttribute("name","check1")
			               inputBox2.setAttribute("value","")
			               inputBox2.value = myActDtlData.act_no
			               th2Box.appendChild(inputBox2)
			               
			               	var tdBox0 = document.createElement("td")					
							tdBox0.innerText = myActDtlData.act_no
							tr2Box.appendChild(tdBox0)
							
							var tdBox1 = document.createElement("td")//신청일시
							//date 변환
							var tempDate1 = new Date(myActDtlData.act_req_dt);
							var reqDate1 = "";
							var reqDate2 = "";
							var reqDate3 = "";
							reqDate1 += tempDate1.getFullYear();
							reqDate2 += ("0" + (1 + tempDate1.getMonth())).slice(-2);
							reqDate3 += ("0" + tempDate1.getDate()).slice(-2);
							tempReqDate = reqDate1+"년"+reqDate2+"월"+reqDate3+"일"
							tdBox1.innerText = tempReqDate
							tr2Box.appendChild(tdBox1)
				
							var tdBox2 = document.createElement("td")					
							tdBox2.innerText = myActDtlData.act_rsn
							tr2Box.appendChild(tdBox2)
							
							var tdBox3 = document.createElement("td") //외박시작
							var tempDate2 = new Date(myActDtlData.act_start_dt);//날짜 변환
							var strDate1 = "";
							var strDate2 = "";
							var strDate3 = "";
							strDate1 += tempDate2.getFullYear();
							strDate2 += ("0" + (1 + tempDate2.getMonth())).slice(-2);
							strDate3 += ("0" + tempDate2.getDate()).slice(-2);
							tempStrDate = strDate1+"년"+strDate2+"월"+strDate3+"일"
							tdBox3.innerText = tempStrDate
							tr2Box.appendChild(tdBox3)
				
							var tdBox4 = document.createElement("td")  //외박끝
							var tempDate3 = new Date(myActDtlData.act_ent_dt);//날짜 변환
							var entDate1 = "";
							var entDate2 = "";
							var entDate3 = "";
							entDate1 += tempDate3.getFullYear();
							entDate2 += ("0" + (1 + tempDate3.getMonth())).slice(-2);
							entDate3 += ("0" + tempDate3.getDate()).slice(-2);
							tempEntDate = entDate1+"년"+entDate2+"월"+entDate3+"일"
							tdBox4.innerText = tempEntDate
							tr2Box.appendChild(tdBox4)
				
							var tdBox5 = document.createElement("td") //외박일수
							tdBox5.innerText = myActDtlData.act_day_cnt;
							tr2Box.appendChild(tdBox5)
				
							var tdBox6 = document.createElement("td")
							tdBox6.innerText = myActDtlData.act_conf_yn
							tr2Box.appendChild(tdBox6)
						}
						}
					tableRowBox.appendChild(tableBox) //가장 마지막
			}
		}
		xhr.open("post" , "./myActListCheck?ent_no="+entNo+"&stud_id="+myEntStudNo);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
}
function cancelList() {
	var entNo = document.getElementById("entInfo").value;
	
	  var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON
				
				var tableRowBox = document.getElementById("tableRow")
				tableRowBox.innerHTML = "";
			
					var tableBox = document.createElement("table")
					tableBox.classList.add("table")
					tableBox.classList.add("table-sm")
					tableBox.classList.add("table-striped")

					var theadBox = document.createElement("thead")
					tableBox.appendChild(theadBox)

					var trBox = document.createElement("tr")
					theadBox.appendChild(trBox)
					
				    var thBox9 = document.createElement("th")
		            thBox9.setAttribute("scope","col")
		            trBox.appendChild(thBox9)
		
					var thBox1 = document.createElement("th")
					thBox1.setAttribute("scope","col")
					thBox1.innerText = "신청번호"
					trBox.appendChild(thBox1)

					var thBox2 = document.createElement("th")
					thBox2.setAttribute("scope","col")
					thBox2.innerText = "신청일시"
					trBox.appendChild(thBox2)

					var thBox3 = document.createElement("th")
					thBox3.setAttribute("scope","col")
					thBox3.innerText = "신청사유"
					trBox.appendChild(thBox3)

					var thBox4 = document.createElement("th")
					thBox4.setAttribute("scope","col")
					thBox4.innerText = "외박시작"
					trBox.appendChild(thBox4)

					var thBox5 = document.createElement("th")
					thBox5.setAttribute("scope","col")
					thBox5.innerText = "외박종료"
					trBox.appendChild(thBox5)

					var thBox6 = document.createElement("th")
					thBox6.setAttribute("scope","col")
					thBox6.innerText = "외박일수"
					trBox.appendChild(thBox6)

					var thBox7 = document.createElement("th")
					thBox7.setAttribute("scope","col")
					thBox7.innerText = "승인상태"
					trBox.appendChild(thBox7)

					var thBox8 = document.createElement("th")
					thBox8.setAttribute("scope","col")
					thBox8.innerText = "취소일자"
					trBox.appendChild(thBox8)
					
					var tbodyBox = document.createElement("tbody")
					tableBox.appendChild(tbodyBox)

					for( myActDtlData of jsonObj.data){
						if(myActDtlData.act_cancl_dt != null){
							var tr2Box = document.createElement("tr")
							tbodyBox.appendChild(tr2Box)

							var th2Box = document.createElement("th")
							th2Box.setAttribute("scope","row")
							tr2Box.appendChild(th2Box)

			               	var tdBox0 = document.createElement("td")					
							tdBox0.innerText = myActDtlData.act_no
							tr2Box.appendChild(tdBox0)
							
							var tdBox1 = document.createElement("td")//신청일시
							//date 변환
							var tempDate1 = new Date(myActDtlData.act_req_dt);
							var reqDate1 = "";
							var reqDate2 = "";
							var reqDate3 = "";
							reqDate1 += tempDate1.getFullYear();
							reqDate2 += ("0" + (1 + tempDate1.getMonth())).slice(-2);
							reqDate3 += ("0" + tempDate1.getDate()).slice(-2);
							tempReqDate = reqDate1+"년"+reqDate2+"월"+reqDate3+"일"
							tdBox1.innerText = tempReqDate
							tr2Box.appendChild(tdBox1)
				
							var tdBox2 = document.createElement("td")					
							tdBox2.innerText = myActDtlData.act_rsn
							tr2Box.appendChild(tdBox2)
							
							var tdBox3 = document.createElement("td") //외박시작
							var tempDate2 = new Date(myActDtlData.act_start_dt);//날짜 변환
							var strDate1 = "";
							var strDate2 = "";
							var strDate3 = "";
							strDate1 += tempDate2.getFullYear();
							strDate2 += ("0" + (1 + tempDate2.getMonth())).slice(-2);
							strDate3 += ("0" + tempDate2.getDate()).slice(-2);
							tempStrDate = strDate1+"년"+strDate2+"월"+strDate3+"일"
							tdBox3.innerText = tempReqDate
							tr2Box.appendChild(tdBox3)
				
							var tdBox4 = document.createElement("td")  //외박끝
							var tempDate3 = new Date(myActDtlData.act_ent_dt);//날짜 변환
							var entDate1 = "";
							var entDate2 = "";
							var entDate3 = "";
							entDate1 += tempDate3.getFullYear();
							entDate2 += ("0" + (1 + tempDate3.getMonth())).slice(-2);
							entDate3 += ("0" + tempDate3.getDate()).slice(-2);
							tempEntDate = entDate1+"년"+entDate2+"월"+entDate3+"일"
							tdBox4.innerText = tempEntDate
							tr2Box.appendChild(tdBox4)
				
							var tdBox5 = document.createElement("td") //외박일수
							tdBox5.innerText = myActDtlData.act_day_cnt;
							tr2Box.appendChild(tdBox5)
				
							var tdBox6 = document.createElement("td")
							tdBox6.innerText = myActDtlData.act_conf_yn
							tr2Box.appendChild(tdBox6)
				
							var tdBox7 = document.createElement("td") //취소날짜
							var tempDate4 = new Date(myActDtlData.act_cancl_dt);//날짜 변환
							var canDate1 = "";
							var canDate2 = "";
							var canDate3 = "";
							canDate1 += tempDate4.getFullYear();
							canDate2 += ("0" + (1 + tempDate4.getMonth())).slice(-2);
							canDate3 += ("0" + tempDate4.getDate()).slice(-2);
							tempCanDate = canDate1+"."+canDate2+"."+canDate3
							tdBox7.innerText = 	tempCanDate
							tr2Box.appendChild(tdBox7)
						}
					}
					tableRowBox.appendChild(tableBox) //가장 마지막
			}
		}
		xhr.open("post" , "./myActListCheck?ent_no="+entNo+"&stud_id="+myEntStudNo);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();	
}

function clock() {
    var date = new Date();
    var year = date.getFullYear();
    var month = ("0" + (1 + date.getMonth())).slice(-2);
    var day = ("0" + date.getDate()).slice(-2);
    
    document.getElementById("todayDate").value = year+"년"+ month +"월" +day+ "일"  ;
    document.getElementById("hiddenResult").value = year+"-"+month+"-"+day;
//    var day = time.getDay();
//    var week = ['일', '월', '화', '수', '목', '금', '토'];

//    var hours = time.getHours();
//    var minutes = time.getMinutes();
//   var seconds = time.getSeconds();
}


$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

  $(function(){
    $('.datepicker').datepicker({
    	onSelect: function() { 
            var startDate = $.datepicker.formatDate("yy-mm-dd",$("#startDate").datepicker("getDate")); 
            var endDate = $.datepicker.formatDate("yy-mm-dd",$("#endDate").datepicker("getDate"));
            
            document.getElementById("startDate").value = startDate;
            document.getElementById("endDate").value = endDate;
            
            var ar1 = startDate.split('-');
            var ar2 = endDate.split('-');
            var da1 = new Date(ar1[0], ar1[1], ar1[2]);
            var da2 = new Date(ar2[0], ar2[1], ar2[2]);
            var dif = da2 - da1;
            var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
            var cMonth = cDay * 30;// 월 만듬
            var cYear = cMonth * 12; // 년 만듬

            document.getElementById('i_result').value = parseInt(dif/cDay);
        }
    });
    $("#startDate").datepicker("setDate", new Date());
  })
 
  window.addEventListener("DOMContentLoaded",function(){
	  getEntNo();
	  clock();
	check();
	}); 

</script>
</html>