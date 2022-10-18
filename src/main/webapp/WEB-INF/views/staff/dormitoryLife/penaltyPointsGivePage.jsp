<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>벌점부과관리</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />  
  
	
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
    
	#penTable thead tr{
	 position: sticky;
	  top: 0;
  	background-clip: padding-box;
  	background-color: #F7C561;
  	border-bottom-width: thin;
	border-color: #999b9b;
	}
	thead th{
		border-right: 1px solid #dee2e6;
	}
	thead th:first-child{
		border-right: 0;
	}

	tbody th{
	background-clip: padding-box;
	}
	tbody tr td{
	text-align: center;
	border-right: 1px solid #dee2e6;
}
	
	/*tbody tr:nth-child(odd) { 
		background-color: #ffffff;
	}
	tbody tr:nth-child(even) { 
		background-color: #f8e6ae; 
	}*/
	#tableOnRow{
		border :1px solid #dee2e6; 
		height: 400px;
		overflow: auto;
		
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
	.btn {
    --bs-btn-font-size: 0.8rem;
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
	.rounded {
	  border-radius: 10px;
}      

label {
  font-size: 0.9em;
  line-height: 0.9rem;
  padding: 0.1em 0.2em;
}

span {
  vertical-align: middle;
}

[type="radio"] {
  vertical-align: middle;
}

 </style>

</head>
<body>
<jsp:include page="../../staff_common/staffSidebar.jsp"></jsp:include>
   <div class="page-content p-4" id="content">
   		<div class="row py-1"></div>
   	    <div class="row pb-2">
    		<div class="col text-end">
    			<button class="btn btn-primary" onclick="penDtlList()">벌점조회</button>
    			<button class="btn btn-primary" onclick="showPopup()">학생조회</button>    			
    			<button class="btn btn-primary" onclick="givePenaltyFinal()">벌점부여</button>
    		</div>
   		</div>
   		
   		<!--  -->
   		<div class="table-wrapper shadow">
	 	<!-- <div class="table-wrapper shadow"> -->
	 		<div class="row py-3"></div>
	 		<div class="row shadow py-3 mx-3" style="background: #fdefc3; border-radius:10px;" >
	 			<div class="col"><!-- 입사명, 성명 -->
	 				<div class="row mb-1">
	 					<div class="col-3 p-0 text-end">입사명</div>
	 					<div class="col">
	 					   <select name="" class="form-control form-control-sm" id="entInfoList">
	                          		<c:forEach items="${entInfoList }" var="list">
	                          			<option value="${list.ent_no}">
	                          				<c:if test="${list.ent_name}">selected="selected</c:if>
	                          				${list.ent_name }
	                          			</option>
	                          		</c:forEach>
	                          	</select>
	 					</div>
	 				</div>
	 				<div class="row">
	 					<div class="col-3 p-0 text-end">벌점부과일</div>
	 					<div class="col-9"><input class="datepicker" style="width:100%" id="applyDate" value=""></div>
	 				</div>
	 			</div>
	 			<div class="col">
	 				<div class="row mb-1">
	 					<div class="col-3 p-0 text-end">호관</div>
	 					<div class="col">
	 					  <select name="" class="form-control form-control-sm" id="bldg">
	                                <c:forEach items="${bldgInfo}" var="info">
	                                    <option value="${info.bldg_code}"> 
	                                    <c:if test="${info.bldg_name}">selected="selected"</c:if>
	                                    ${info.bldg_name}
	                                    </option>
	                                </c:forEach>
	                            </select>	
	 					</div>
	 				</div>
	 				<div class="row">
	 					<div class="col-3 p-0 text-end" id="radioBox">승인여부	 					
	 					</div>
	 					<div class="col" id="radioBox">
	                        <label>
	                        	<input type="radio" name="chk_resign" checked><span>전체</span>
	                        </label>
	                        <label>
	                        	<input type="radio" st name="chk_resign" value="Y"><span>Y</span>
	                        </label>
	                        <label>
	                        	<input type="radio" name="chk_resign" value="N"><span>N</span>
	                        </label>
                        </div>
	 				</div>
	 			</div>
	 			<div class="col">
	 				<div class="row mb-1">
	 					<div class="col-3 p-0 text-end">이름/학번</div>
	 					<div class="col"><input class="form-control form-control-sm" id="studName" value=""></div>
	 				</div>
	 				<div class="row">
	 					<div class="col-3 p-0 text-end">벌점부과자</div>
	 					<div class="col pe-0"><input class="form-control form-control-sm" disabled value="${staffInfo.STAFF_NAME }"></div>
	 					<div class="col ps-0"><input class="form-control form-control-sm" disabled value="${staffInfo.ADMIN_NO }"></div>
	 				</div>
	 			</div>
	 		</div>	
		<!-- </div> -->
 		<div class="row py-2"></div>
 		<div class="row mx-2 pb-1" id="countPen">
		 			<div class="col">0건이 조회되었습니다</div>
		</div>
 		<div class="row shadow mx-3" id="tableOnRow">
 			<div class="col">
		 		<div class="row" id="tableRow">
			 		<!-- table 자리 -->
		 		</div> 			
 			</div>
 		</div>

 		<div class="row py-2"></div>
 		
		<div class="row px-1 pb-1"><div class="col ms-3">벌점부과사항 입력</div></div>
		<!-- <div class="table-wrapper shadow"> -->
		<div class="row shadow py-3 mx-3" style="background: #fdefc3; border-radius:10px;" id ="penDlt">
			<div class="col"><!-- co1-1 -->
				<div class="row mb-1"><!-- row1 -->
					<div class="col-4 p-0 text-end">학번/이름</div>
					<div class="col pe-0"><input class="form-control form-control-sm"></div>
					<div class="col ps-0"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row mb-1"><!-- row2 -->
					<div class="col-4 p-0 text-end">벌점부과번호</div>
					<div class="col"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row mb-1"><!-- row3 -->
					<div class="col-4 p-0 text-end">벌점항목</div>
					<div class="col"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row"><!-- row4 -->
					<div class="col-4 p-0 text-end">벌점</div>
					<div class="col"><input class="form-control form-control-sm"></div>
				</div>
			</div>
			<div class="col ps-4"><!-- co1-2 -->
				<div class="row ps-2 mb-1"><div class="col">벌점부과사유</div></div>
				<div class="row">
					<div class="col">
						<textarea rows="4" cols="40"></textarea>
					</div>
				</div>
			</div>
			<div class="col"><!-- co1-3 -->
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">벌점부과일자</div>
					<div class="col">
						<input type="date" style="width: 100%">
					</div>
				</div>
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">벌점진행상태</div>
					<div class="col">
						<input class="form-control form-control-sm">
					</div>
				</div>
				<div class="row">
					<div class="col-4 p-0 text-end">벌점부과자</div>
					<div class="col pe-0">
						<input class="form-control form-control-sm">
					</div>
					<div class="col ps-0">
						<input class="form-control form-control-sm">
					</div>
				</div>
			</div>
		</div>
		<div class="row py-3"></div>
		<!-- </div> -->
		</div>
		</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script type="text/javascript">
function showPopup() {
	window.open("./popup","a","width=600, height=500,left=300, top=100");
}
window.call = function (data){
	  var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				
				var penDltBox = document.getElementById("penDlt")
				penDltBox.innerHTML = ""
				
				var stuData = jsonObj.data;
				var staff = jsonObj.staffData;
				
			   var col1 = document.createElement("div")
			    col1.classList.add("col")
			    penDltBox.appendChild(col1)

			    var col1InnerRow1 = document.createElement("div")
			    col1InnerRow1.classList.add("row")
			    col1InnerRow1.classList.add("mb-1")
			    col1.appendChild(col1InnerRow1)

			        var row1InnerCol1 = document.createElement("div")
			        row1InnerCol1.classList.add("col-4")
			        row1InnerCol1.classList.add("p-0")
			        row1InnerCol1.classList.add("text-end")
			        row1InnerCol1.innerText ="학번/이름"
			        col1InnerRow1.appendChild(row1InnerCol1)

			        var row1InnerCol2 = document.createElement("div")
			        row1InnerCol2.classList.add("col")
			        row1InnerCol2.classList.add("pe-0")
			        col1InnerRow1.appendChild(row1InnerCol2)

			        var inputID = document.createElement("input")
			        inputID.classList.add("form-control")
			        inputID.classList.add("form-control-sm")			        
			        inputID.setAttribute("value","")
			        inputID.value = stuData.STUD_ID
			        row1InnerCol2.appendChild(inputID)

			        var row1InnerCol3 = document.createElement("div")
			        row1InnerCol3.classList.add("col")
			        row1InnerCol3.classList.add("ps-0")
			        col1InnerRow1.appendChild(row1InnerCol3)

			        var inputName = document.createElement("input")
			        inputName.classList.add("form-control")
			        inputName.classList.add("form-control-sm")
			        inputName.setAttribute("value","")
			        inputName.value = stuData.STUD_NAME
			        row1InnerCol3.appendChild(inputName)
			        
			       	var inputNo = document.createElement("input")
			        inputNo.setAttribute("type","hidden")
			        inputNo.setAttribute("value","")
			        inputNo.setAttribute("id","entStud")
			        inputNo.value = stuData.ENT_STUD_NO
			        row1InnerCol3.appendChild(inputNo)
			       
			    var col1InnerRow2 = document.createElement("div")
			    col1InnerRow2.classList.add("row")
			    col1InnerRow2.classList.add("mb-1")
			    col1.appendChild(col1InnerRow2)

			        var row2InnerCol1 = document.createElement("div")
			        row2InnerCol1.classList.add("col-4")
			        row2InnerCol1.classList.add("p-0")
			        row2InnerCol1.classList.add("text-end")
			        row2InnerCol1.innerText = "벌점부과번호"
			        col1InnerRow2.appendChild(row2InnerCol1)

			        var row2InnerCol2 = document.createElement("div")
			        row2InnerCol2.classList.add("col")
			        col1InnerRow2.appendChild(row2InnerCol2)

			        var inputAct = document.createElement("input")
			        inputAct.classList.add("form-control")
			        inputAct.classList.add("form-control-sm")
			        inputAct.setAttribute("value","")
			        inputAct.setAttribute("disabled","")
			        inputAct.value = "";
			        row2InnerCol2.appendChild(inputAct)

			    var col1InnerRow3 = document.createElement("div")
			    col1InnerRow3.classList.add("row")
			    col1InnerRow3.classList.add("mb-1")
			    col1.appendChild(col1InnerRow3)

			        var row3innerCol1 =  document.createElement("div")
			        row3innerCol1.classList.add("col-4")
			        row3innerCol1.classList.add("p-0")
			        row3innerCol1.classList.add("text-end")
			        row3innerCol1.innerText = "벌점항목"
			        col1InnerRow3.appendChild(row3innerCol1)

			        var row3innerCol2 =  document.createElement("div")
			        row3innerCol2.classList.add("col")
			        col1InnerRow3.appendChild(row3innerCol2)
			        
			        var selectBox = document.createElement("select")
			        selectBox.classList.add("form-control")
			        selectBox.classList.add("form-control-sm")
			        selectBox.setAttribute("id","penList")
					row3innerCol2.appendChild(selectBox)
					
					for(penStnList of jsonObj.penList){
						
						var optionBox = document.createElement("option")
						optionBox.setAttribute("value","")
						optionBox.value = penStnList.pen_cd
						optionBox.innerText = penStnList.pen_nm +"["+penStnList.pen_pt+"]"
						selectBox.appendChild(optionBox)
					}

			    var col1InnerRow4 = document.createElement("div")
			    col1InnerRow4.classList.add("row")
			    col1.appendChild(col1InnerRow4)

			    var row4innerCol1 =  document.createElement("div")
			        row4innerCol1.classList.add("col-4")
			        row4innerCol1.classList.add("p-0")
			        row4innerCol1.classList.add("text-end")
			        row4innerCol1.innerText = "벌점"
			        col1InnerRow4.appendChild(row4innerCol1)

			        var row4innerCol2 =  document.createElement("div")
			        row4innerCol2.classList.add("col")
			        col1InnerRow4.appendChild(row4innerCol2)
			        
			        var penPT = document.createElement("input")
			        penPT.classList.add("form-control")
			        penPT.classList.add("form-control-sm")
			        penPT.setAttribute("value","")
			        penPT.setAttribute("disabled","")   
			        row4innerCol2.appendChild(penPT)
			    
			    var col2 = document.createElement("div")
			    col2.classList.add("col")
			    col2.classList.add("ps-4")
			    penDltBox.appendChild(col2)

			        var reasonRow = document.createElement("div")
			        reasonRow.classList.add("row")
			        reasonRow.classList.add("mb-1")
			        reasonRow.classList.add("ps-2")
			        col2.appendChild(reasonRow)

			        var reasonRowinnerCol = document.createElement("div")
			        reasonRowinnerCol.classList.add("col")
			        reasonRowinnerCol.innerText = "벌점부과사유"
			        reasonRow.appendChild(reasonRowinnerCol)
			        
			        var reasonRow2 = document.createElement("div")
			        reasonRow2.classList.add("row")
			        col2.appendChild(reasonRow2)
			        
			        var reasonRowinnerCol2 = document.createElement("div")
			        reasonRowinnerCol2.classList.add("col")
			        reasonRow2.appendChild(reasonRowinnerCol2)

			        var inputReason = document.createElement("textarea")
			        inputReason.setAttribute("rows", "4")
			        inputReason.setAttribute("cols", "40")
			        inputReason.setAttribute("value", "")
			        inputReason.setAttribute("id", "textAr")
			        reasonRowinnerCol2.appendChild(inputReason) 
			        
				var col3 = document.createElement("div")
			    col3.classList.add("col")
			    penDltBox.appendChild(col3)

			    var roomRow = document.createElement("div")
			    roomRow.classList.add("row")
			    roomRow.classList.add("mb-1")
			    col3.appendChild(roomRow)

			        var roomCol1 = document.createElement("div")
			        roomCol1.classList.add("col-4")
			        roomCol1.classList.add("p-0")
			        roomCol1.classList.add("text-end")
			        roomCol1.innerText = "벌점부과일자"
			        roomRow.appendChild(roomCol1)

			        var roomCol2 = document.createElement("div")
			        roomCol2.classList.add("col")
			        roomRow.appendChild(roomCol2)

			        var inputRoom = document.createElement("input")
			        inputRoom.setAttribute("type","date")
			        inputRoom.setAttribute("value","")
			        inputRoom.setAttribute("disabled","")
			        inputRoom.setAttribute("style","width: 100%")
			                     //날짜 변환
			            var tempEndDT = new Date() //벌점부과일
					    var entDate1 = ""
					    var entDate2 = ""
					    var entDate3 = ""
					    entDate1 = tempEndDT.getFullYear();
						entDate2 = ("0" + (1 + tempEndDT.getMonth())).slice(-2);
						entDate3 = ("0" + tempEndDT.getDate()).slice(-2);
						entDate4 = entDate1+"-"+entDate2+"-"+entDate3
					inputRoom.value = entDate4
			        roomCol2.appendChild(inputRoom)

			    var parPhoneRow = document.createElement("div")
			    parPhoneRow.classList.add("row")
			    parPhoneRow.classList.add("mb-1")
			    col3.appendChild(parPhoneRow)

			        var phoneCol1 = document.createElement("div")
			        phoneCol1.classList.add("col-4")
			        phoneCol1.classList.add("p-0")
			        phoneCol1.classList.add("text-end")
			        phoneCol1.innerText = "벌점진행상태"
			        parPhoneRow.appendChild(phoneCol1)

			        var phoneCol2 = document.createElement("div")
			        phoneCol2.classList.add("col")
			        parPhoneRow.appendChild(phoneCol2)

			        var inputPhone = document.createElement("input")
			        inputPhone.classList.add("form-control")
			        inputPhone.classList.add("form-control-sm")
			        inputPhone.setAttribute("value","")
			        inputPhone.setAttribute("disabled","") 
			        phoneCol2.appendChild(inputPhone)

			    var reqDtRow = document.createElement("div")
			    reqDtRow.classList.add("row")
			    col3.appendChild(reqDtRow)

			        var reqDtCol1 = document.createElement("div")
			        reqDtCol1.classList.add("col-4")
			        reqDtCol1.classList.add("p-0")
			        reqDtCol1.classList.add("text-end")
			        reqDtCol1.innerText = "벌점부과자"
			        reqDtRow.appendChild(reqDtCol1)

			        var reqDtCol2 = document.createElement("div")
			        reqDtCol2.classList.add("col")
			        reqDtCol2.classList.add("pe-0")
			        reqDtRow.appendChild(reqDtCol2)
			        
			        var inputDept = document.createElement("input")
			        inputDept.classList.add("form-control")
			        inputDept.classList.add("form-control-sm")
			        inputDept.setAttribute("value","")
			        inputDept.setAttribute("disabled","") 
			        inputDept.value = staff.STAFF_NAME
			        reqDtCol2.appendChild(inputDept)
			        
			        var reqDtCol3 = document.createElement("div")
			        reqDtCol3.classList.add("col")
			        reqDtCol3.classList.add("ps-0")			        
			        reqDtRow.appendChild(reqDtCol3)
			        
			        var inputGde = document.createElement("input")
			        inputGde.classList.add("form-control")
			        inputGde.classList.add("form-control-sm")
			        inputGde.setAttribute("value","")
			        inputGde.setAttribute("disabled","") 
			        inputGde.setAttribute("id","adminNo")
			        inputGde.value = staff.ADMIN_NO
			       	reqDtCol3.appendChild(inputGde)			

			}
		}
		xhr.open("post" , "./givePenalty" );
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send("stud_id="+data);	
}

function givePenaltyFinal() {
	
		var ESN = document.getElementById("entStud").value;
		var penCD  = document.getElementById("penList").value;
		var penRSM = document.getElementById("textAr").value;
		var adno = document.getElementById("adminNo").value;
	
	if(ESN == null || penCD == '' || penRSM == ''){
		swal("","빈칸을 확인해주세요", "warning");
		return;
	}else{
		  var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () { // 콜백함수
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					swal("","완료되었습니다.", "success");

					document.getElementById("penList").value ="";
					document.getElementById("textAr").value ="";
					penDtlList();
				}
			}
			xhr.open("post" , "./givePenaltyFinal");
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send("ent_stud_no="+ESN+"&pen_cd="+penCD+"&pen_rsm="+penRSM+"&admin_no="+adno);	
	}
}

function penDtlList() {
	var entNo = document.getElementById("entInfoList").value;
	var bldgVa = document.getElementById("bldg").value;
	
	var studNameVa = document.getElementById("studName").value;
	var studParam = "";
	
	if(isNaN(studNameVa) == true){
		studParam += "&stud_name=" + studNameVa;
	}else{
		studParam += "&stud_id=" + studNameVa;
	}
	var applyDT = document.getElementById("applyDate").value;
	var radioBoxVa = document.querySelector('input[name="chk_resign"]:checked').value;
	
	var reqParam = "";
	reqParam += "?ent_no=" + entNo +"&bldg_code="+bldgVa;
	
	if(applyDT != '' && radioBoxVa != 'on' && studNameVa != ''){
		reqParam += "&penDate="+applyDT + "&pen_conf_yn="+radioBoxVa +studParam;
	}
	else if((applyDT != '' && radioBoxVa != 'on') || (radioBoxVa != 'on' && applyDT != '')){
		reqParam += "&penDate="+applyDT + "&pen_conf_yn="+radioBoxVa
	}
	else if((radioBoxVa != 'on' && studNameVa != '') ||(studNameVa != '' && radioBoxVa != 'on')){
		reqParam += "&pen_conf_yn="+radioBoxVa +studParam
	}
	else if((applyDT != '' && studNameVa != '') || (studNameVa != '' &&applyDT != '')){
		reqParam += "&penDate="+applyDT + studParam;
	}
	else if(studNameVa != ''){
		reqParam += studParam;
	}
	else if(applyDT != ''){
		reqParam += "&penDate="+applyDT
	}
	else if(radioBoxVa != 'on'){
		reqParam += "&pen_conf_yn="+radioBoxVa
	}
	
  var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () { // 콜백함수
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)*/
			
			 var countPenRow = document.getElementById("countPen")
			 	countPenRow.innerHTML = "";
			
				var num = jsonObj.count
				var penCo1 = document.createElement("div")
				penCo1.classList.add("col")
				penCo1.innerText = num+"건이 조회되었습니다"
				countPenRow.appendChild(penCo1)
			
			 var ListTableBox = document.getElementById("tableRow")
	            ListTableBox.innerHTML="";

	            var tableBox = document.createElement("table")
	            tableBox.classList.add("table")
	            tableBox.classList.add("table-sm")
	            tableBox.classList.add("table-striped")
	            tableBox.setAttribute("id","penTable")
	            tableBox.setAttribute("style", "white-space: nowrap;")

	            var theadBox = document.createElement("thead")
	            tableBox.appendChild(theadBox)

	            var trBox = document.createElement("tr")
				theadBox.appendChild(trBox)

	            var thBox1 = document.createElement("th")
	            thBox1.setAttribute("scope","col")
	            trBox.appendChild(thBox1)

	            var inputBox1 = document.createElement("input")
	            inputBox1.setAttribute("type", "checkbox")
	            inputBox1.setAttribute("id", "checkAll")
	            thBox1.appendChild(inputBox1)

	            var thBox2= document.createElement("th")
	            thBox2.setAttribute("scope","col")
	            thBox2.innerText = "벌점부과번호"
	            trBox.appendChild(thBox2)

	            var thBox3= document.createElement("th")
	            thBox3.setAttribute("scope","col")
	            thBox3.innerText = "학과"
	            trBox.appendChild(thBox3)

	            var thBox4= document.createElement("th")
	            thBox4.setAttribute("scope","col")
	            thBox4.innerText = "학년"
	            trBox.appendChild(thBox4)

	            var thBox5= document.createElement("th")
	            thBox5.setAttribute("scope","col")
	            thBox5.innerText = "학번"
	            trBox.appendChild(thBox5)

	            var thBox6= document.createElement("th")
	            thBox6.setAttribute("scope","col")
	            thBox6.innerText = "성명"
	            trBox.appendChild(thBox6)

	            var thBox7= document.createElement("th")
	            thBox7.setAttribute("scope","col")
	            thBox7.innerText = "호관"
	            trBox.appendChild(thBox7)

	            var thBox8= document.createElement("th")
	            thBox8.setAttribute("scope","col")
	            thBox8.innerText = "호실"
	            trBox.appendChild(thBox8)

	            var thBox9= document.createElement("th")
	            thBox9.setAttribute("scope","col")
	            thBox9.innerText = "벌점부과일"
	            trBox.appendChild(thBox9)


	            var thBox10= document.createElement("th")
	            thBox10.setAttribute("scope","col")
	            thBox10.innerText = "벌점"
	            trBox.appendChild(thBox10)

	           /* var thBox11= document.createElement("th")
	            thBox11.setAttribute("scope","col")
	            thBox11.innerText = "누적벌점"
	            trBox.appendChild(thBox11)*/

	            var thBox12= document.createElement("th")
	            thBox12.setAttribute("scope","col")
	            thBox12.innerText = "진행상태"
	            trBox.appendChild(thBox12)
	            
	            var tbodyBox = document.createElement("tbody")
				tableBox.appendChild(tbodyBox)
	            
	            for(penList of jsonObj.data){
	                var tr2Box = document.createElement("tr")
	                tr2Box.setAttribute("onclick","showPen( "+penList.penDtlVo.pen_no+" )");
					tbodyBox.appendChild(tr2Box)

	                var th2Box = document.createElement("th")
					th2Box.setAttribute("scope","row")
					tr2Box.appendChild(th2Box)

	                var inputBox2 = document.createElement("input")
	                inputBox2.setAttribute("type","checkbox")
	                inputBox2.setAttribute("name","check1")
	                inputBox2.setAttribute("value","")
	                inputBox2.value = penList.penDtlVo.pen_no
	                th2Box.appendChild(inputBox2)
	                		
	                var tdBox1 = document.createElement("td") //벌점부과번호
	                tdBox1.innerText = penList.penDtlVo.pen_no
	                tr2Box.appendChild(tdBox1)

	                var tdBox2 = document.createElement("td") //학과
	                tdBox2.innerText = penList.StudInfo.STUD_DEPT
	                tr2Box.appendChild(tdBox2)

	                var tdBox3 = document.createElement("td") //학년
	                tdBox3.innerText = penList.StudInfo.STUD_GRADE
	                tr2Box.appendChild(tdBox3)

	                var tdBox4 = document.createElement("td") //학번
	                tdBox4.innerText = penList.StudInfo.STUD_ID
	                tr2Box.appendChild(tdBox4)

	                var tdBox5 = document.createElement("td") //성명
	                tdBox5.innerText = penList.StudInfo.STUD_NAME
	                tr2Box.appendChild(tdBox5)

	                var tdBox6 = document.createElement("td") //호관
	                tdBox6.innerText = penList.ConstructionInfo.BLDG_NAME
	                tr2Box.appendChild(tdBox6)

	                var tdBox7 = document.createElement("td") //호실
	                tdBox7.innerText = penList.ConstructionInfo.FLOOR_NAME
	                tr2Box.appendChild(tdBox7)

	                var tdBox8 = document.createElement("td") //벌점부과일
	                tdBox8.innerText = dateFormat(penList.penDtlVo.pen_dt)
	                tr2Box.appendChild(tdBox8)

	                var tdBox9 = document.createElement("td") // 벌점             
	                tdBox9.innerText = penList.penStd.PEN_PT
	                tr2Box.appendChild(tdBox9)

	              /*  var tdBox10 = document.createElement("td")//누적벌점
	                tdBox10.innerText = "추후누적벌점"
	                tr2Box.appendChild(tdBox10)*/

	                var tdBox11 = document.createElement("td")//진행상태
	                tdBox11.innerText = penList.penDtlVo.pen_conf_yn
	                tr2Box.appendChild(tdBox11)
	            }
	            ListTableBox.appendChild(tableBox)
 		}
	}
	xhr.open("get" , "./penDtlList"+reqParam);
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send();
}

function showPen(penNo) {
	  var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () { // 콜백함수
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
			var penDltBox = document.getElementById("penDlt")
			penDltBox.innerHTML = ""
			
			var penData = jsonObj.data;
			
				   var col1 = document.createElement("div")
				    col1.classList.add("col")
				    penDltBox.appendChild(col1)

				    var col1InnerRow1 = document.createElement("div")
				    col1InnerRow1.classList.add("row")
				    col1InnerRow1.classList.add("mb-1")
				    col1.appendChild(col1InnerRow1)

				        var row1InnerCol1 = document.createElement("div")
				        row1InnerCol1.classList.add("col-4")
				        row1InnerCol1.classList.add("p-0")
				        row1InnerCol1.classList.add("text-end")
				        row1InnerCol1.innerText ="학번/이름"
				        col1InnerRow1.appendChild(row1InnerCol1)

				        var row1InnerCol2 = document.createElement("div")
				        row1InnerCol2.classList.add("col")
				        row1InnerCol2.classList.add("pe-0")
				        col1InnerRow1.appendChild(row1InnerCol2)

				        var inputID = document.createElement("input")
				        inputID.classList.add("form-control")
				        inputID.classList.add("form-control-sm")
				        inputID.setAttribute("value","")
				        inputID.value = penData.StudInfo.STUD_ID
				        row1InnerCol2.appendChild(inputID)

				        var row1InnerCol3 = document.createElement("div")
				        row1InnerCol3.classList.add("col")
				        row1InnerCol3.classList.add("ps-0")
				        col1InnerRow1.appendChild(row1InnerCol3)

				        var inputName = document.createElement("input")
				        inputName.classList.add("form-control")
				        inputName.classList.add("form-control-sm")
				        inputName.setAttribute("value","")
				        inputName.value = penData.StudInfo.STUD_NAME
				        row1InnerCol3.appendChild(inputName)
				       
				    var col1InnerRow2 = document.createElement("div")
				    col1InnerRow2.classList.add("row")
				    col1InnerRow2.classList.add("mb-1")
				    col1.appendChild(col1InnerRow2)

				        var row2InnerCol1 = document.createElement("div")
				        row2InnerCol1.classList.add("col-4")
				        row2InnerCol1.classList.add("p-0")
				        row2InnerCol1.classList.add("text-end")
				        row2InnerCol1.innerText = "벌점부과번호"
				        col1InnerRow2.appendChild(row2InnerCol1)

				        var row2InnerCol2 = document.createElement("div")
				        row2InnerCol2.classList.add("col")
				        col1InnerRow2.appendChild(row2InnerCol2)

				        var inputAct = document.createElement("input")
				        inputAct.classList.add("form-control")
				        inputAct.classList.add("form-control-sm")
				        inputAct.setAttribute("value","")
				        inputAct.value = penData.penDtlVo.pen_no
				        row2InnerCol2.appendChild(inputAct)

				    var col1InnerRow3 = document.createElement("div")
				    col1InnerRow3.classList.add("row")
				    col1InnerRow3.classList.add("mb-1")
				    col1.appendChild(col1InnerRow3)

				        var row3innerCol1 =  document.createElement("div")
				        row3innerCol1.classList.add("col-4")
				        row3innerCol1.classList.add("p-0")
				        row3innerCol1.classList.add("text-end")
				        row3innerCol1.innerText = "벌점항목"
				        col1InnerRow3.appendChild(row3innerCol1)

				        var row3innerCol2 =  document.createElement("div")
				        row3innerCol2.classList.add("col")
				        col1InnerRow3.appendChild(row3innerCol2)

				        var strDate = document.createElement("input")
				        strDate.classList.add("form-control")
				        strDate.classList.add("form-control-sm")
				        strDate.setAttribute("value","")
				        strDate.value = penData.penStd.PEN_NM
				        row3innerCol2.appendChild(strDate)

				    var col1InnerRow4 = document.createElement("div")
				    col1InnerRow4.classList.add("row")
				    col1.appendChild(col1InnerRow4)

				    var row4innerCol1 =  document.createElement("div")
				        row4innerCol1.classList.add("col-4")
				        row4innerCol1.classList.add("p-0")
				        row4innerCol1.classList.add("text-end")
				        row4innerCol1.innerText = "벌점"
				        col1InnerRow4.appendChild(row4innerCol1)

				        var row4innerCol2 =  document.createElement("div")
				        row4innerCol2.classList.add("col")
				        col1InnerRow4.appendChild(row4innerCol2)

				        var penPT = document.createElement("input")
				        penPT.classList.add("form-control")
				        penPT.classList.add("form-control-sm")
				        penPT.setAttribute("value","")
				        penPT.value = penData.penStd.PEN_PT
				        row4innerCol2.appendChild(penPT)
						
				    var col2 = document.createElement("div")
				    col2.classList.add("col")
				    col2.classList.add("ps-4")
				    penDltBox.appendChild(col2)

				        var reasonRow = document.createElement("div")
				        reasonRow.classList.add("row")
				        reasonRow.classList.add("mb-1")
				        reasonRow.classList.add("ps-2")
				        col2.appendChild(reasonRow)

				        var reasonRowinnerCol = document.createElement("div")
				        reasonRowinnerCol.classList.add("col")
				        reasonRowinnerCol.innerText = "벌점부과사유"
				        reasonRow.appendChild(reasonRowinnerCol)

				        var reasonRow2 = document.createElement("div")
				        reasonRow2.classList.add("row")
				        col2.appendChild(reasonRow2)
				        
				        var reasonRowinnerCol2 = document.createElement("div")
				        reasonRowinnerCol2.classList.add("col")
				        reasonRow2.appendChild(reasonRowinnerCol2)
				        
				        var inputReason = document.createElement("textarea")
				        inputReason.setAttribute("rows", "4")
				        inputReason.setAttribute("cols", "40")
				        inputReason.setAttribute("value", "")
				        inputReason.value = penData.penDtlVo.pen_rsm
				        reasonRowinnerCol2.appendChild(inputReason) 
				        
					var col3 = document.createElement("div")
				    col3.classList.add("col")
				    penDltBox.appendChild(col3)

				    var roomRow = document.createElement("div")
				    roomRow.classList.add("row")
				    roomRow.classList.add("mb-1")
				    col3.appendChild(roomRow)

				        var roomCol1 = document.createElement("div")
				        roomCol1.classList.add("col-4")
				        roomCol1.classList.add("p-0")
				        roomCol1.classList.add("text-end")
				        roomCol1.innerText = "벌점부과일자"
				        roomRow.appendChild(roomCol1)

				        var roomCol2 = document.createElement("div")
				        roomCol2.classList.add("col")
				        roomRow.appendChild(roomCol2)

				        var inputRoom = document.createElement("input")
				        inputRoom.setAttribute("type","date")
				        inputRoom.setAttribute("style","width: 100%")
				        inputRoom.setAttribute("value","")
				                     //날짜 변환
				            var tempEndDT = new Date(penData.penDtlVo.pen_dt) //벌점부과일
						    var entDate1 = ""
						    var entDate2 = ""
						    var entDate3 = ""
						    entDate1 = tempEndDT.getFullYear();
							entDate2 = ("0" + (1 + tempEndDT.getMonth())).slice(-2);
							entDate3 = ("0" + tempEndDT.getDate()).slice(-2);
							entDate4 = entDate1+"-"+entDate2+"-"+entDate3
						inputRoom.value = entDate4
				        roomCol2.appendChild(inputRoom)

				    var parPhoneRow = document.createElement("div")
				    parPhoneRow.classList.add("row")
				    parPhoneRow.classList.add("mb-1")
				    col3.appendChild(parPhoneRow)

				        var phoneCol1 = document.createElement("div")
				        phoneCol1.classList.add("col-4")
				        phoneCol1.classList.add("p-0")
				        phoneCol1.classList.add("text-end")
				        phoneCol1.innerText = "벌점진행상태"
				        parPhoneRow.appendChild(phoneCol1)

				        var phoneCol2 = document.createElement("div")
				        phoneCol2.classList.add("col")
				        parPhoneRow.appendChild(phoneCol2)

				        var inputPhone = document.createElement("input")
				        inputPhone.classList.add("form-control")
				        inputPhone.classList.add("form-control-sm")
				        inputPhone.setAttribute("value","")
				        inputPhone.value = penData.penDtlVo.pen_conf_yn
				        phoneCol2.appendChild(inputPhone)

				    var reqDtRow = document.createElement("div")
				    reqDtRow.classList.add("row")
				    col3.appendChild(reqDtRow)

				        var reqDtCol1 = document.createElement("div")
				        reqDtCol1.classList.add("col-4")
				        reqDtCol1.classList.add("p-0")
				        reqDtCol1.classList.add("text-end")
				        reqDtCol1.innerText = "벌점부과자"
				        reqDtRow.appendChild(reqDtCol1)

				        var reqDtCol2 = document.createElement("div")
				        reqDtCol2.classList.add("col")
				        reqDtCol2.classList.add("pe-0")
				        reqDtRow.appendChild(reqDtCol2)
				        
				        var inputDept = document.createElement("input")
				        inputDept.classList.add("form-control")
				        inputDept.classList.add("form-control-sm")
				        inputDept.setAttribute("value","")
				        inputDept.value = penData.staffInfo.STAFF_NAME
				        reqDtCol2.appendChild(inputDept)
				        
				        var reqDtCol3 = document.createElement("div")
				        reqDtCol3.classList.add("col")
				        reqDtCol3.classList.add("ps-0")
				        reqDtRow.appendChild(reqDtCol3)
				        
				        var inputGde = document.createElement("input")
				        inputGde.classList.add("form-control")
				        inputGde.classList.add("form-control-sm")
				        inputGde.setAttribute("value","")
				        inputGde.value = penData.penDtlVo.admin_no
				       	reqDtCol3.appendChild(inputGde)			

		}
	}
	xhr.open("post" , "./getPenDtl" );
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send("pen_no="+penNo);
}

function dateFormat(value) {
	var dateValue = new Date(value)
	var Date1 = ""
	var Date2 = ""
	var Date3 = ""
	Date1 += dateValue.getFullYear();
	Date2 += ("0" + (1 + dateValue.getMonth())).slice(-2);
	Date3 += ("0" + dateValue.getDate()).slice(-2);
	Date4 = Date1+"."+Date2+"."+Date3
	
	return Date4;
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
  yearSuffix: '년',
  changeMonth: true,
  changeYear: true,
  dateFormat:'yy-mm-dd',
  closeText:'취소',
  showButtonPanel: true,
  onClose: function () {
      if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
          $(this).val('');
      }
  }
  
});

$(function(){
$('.datepicker').datepicker({
	onSelect: function() { 
        var applyDate = $.datepicker.formatDate("yy-mm-dd",$("#applyDate").datepicker("getDate")); 
        //var endDate = $.datepicker.formatDate("yy-mm-dd",$("#endDate").datepicker("getDate"));
        
        document.getElementById("applyDate").value = applyDate;
        //document.getElementById("endDate").value = endDate;
    }
});
$("#applyDate").datepicker("setDate", new Date());
})

window.addEventListener("DOMContentLoaded",function(){
	penDtlList();
}); 


</script>
</html>