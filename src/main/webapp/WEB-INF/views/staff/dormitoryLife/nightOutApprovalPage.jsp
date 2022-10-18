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
</head>
<style>
	.page-content{
      font-size:0.8rem;
   }
   table{
    border-collapse: collapse;
    }
	
	thead{
		text-align: center;
		position: relative;
	}
	.ui-datepicker th {
    background: #ffffff;
    }
    
	#tableA thead tr{
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

	tbody{
		background: #ffffff;
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
#tableOnRow{
		border :1px solid #dee2e6; 
		height: 400px;
		overflow: auto;
	}


 </style>
<body>
<jsp:include page="../../staff_common/staffSidebar.jsp"></jsp:include>

   <div class="page-content p-4" id="content">
   		<div class="row py-1"></div>
        <div class="row pb-2">
    		<div class="col text-end">
    			<button class="btn btn-primary "  onclick="lookupList()">조회</button>
    			<button class="btn btn-primary" onclick="approvalAct()">외박승인</button>
    		</div>
   		</div>	
		<div class="table-wrapper shadow">
			<div class="row py-3"></div>
	 		<div class="row shadow py-3 mx-3" style="background: #fdefc3; border-radius:10px;" >
                 <div class="col">
                 	<div class="row mb-1">
                 		<div class="col-3 p-0 text-end">외박기준</div>
                 		<div class="col">
                 		   <select name="" class="form-control form-control-sm" id="ActStnd">
                              <option selected>전체</option>
                         		<c:forEach items="${ActStndInfo }" var="act">
                         			<option value="${act.act_cd}">
                         				<c:if test="${act.act_nm}">selected="selected</c:if>
                         				${act.act_nm}
                         			</option>
                         		</c:forEach>
                         	</select>
                 		</div>                 	
                 	</div>
                 	<div class="row">
                 		<div class="col-3 p-0 text-end">신청일자</div>
                        <div class="col"><input class="datepicker" style="width:100%" id="applyDate" value=""></div>
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
                 	<div class="col-3 p-0 text-end">인정여부</div>
                 		<div class="col" id="radioBox">
	                        <label>
	                        	<input type="radio" name="chk_approval" checked><span>전체</span>
	                        </label>
	                        <label>
	                        	<input type="radio" st name="chk_approval" value="Y"><span>Y</span>
	                        </label>
	                        <label>
	                        	<input type="radio" name="chk_approval" value="N"><span>N</span>
	                        </label>
                        </div>
                    </div>
                 </div>
                 <div class="col">
                 	<div class="row mb-1">
                    	<div class="col-3 p-0 text-end">학번/성명</div>
                 		<div class="col"><input class="form-control form-control-sm" id="studName" value=""></div>              	
                 	</div>
                 	<div class="row">
	 					<div class="col-3 p-0 text-end">직원</div>
	 					<div class="col pe-0"><input class="form-control form-control-sm" disabled value="${staffInfo.STAFF_NAME }"></div>
	 					<div class="col ps-0"><input class="form-control form-control-sm" disabled value="${staffInfo.ADMIN_NO }"></div>
	 				</div>
                 </div>
			</div>	
		<div class="row py-2"></div>
	        <div class="row mx-2" id="theNumber"></div>			
			<div class="row shadow mx-3" id="tableOnRow">
	            <div class="col">
	                <div class="row" id="ListTable">
	                	<!-- table자리 -->
	                </div>
	            </div>
			</div>	

 		<div class="row py-3"></div>
		<div class="row shadow py-3 mx-3" style="background: #fdefc3; border-radius:10px;" id="ActDtlBox">
			<div class="col"><!-- col-1 -->
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">신청자</div>
					<div class="col pe-0"><input class="form-control form-control-sm"></div>
					<div class="col ps-0"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">외박기준</div>
					<div class="col"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">학과/학년</div>
					<div class="col pe-0"><input class="form-control form-control-sm"></div>
					<div class="col ps-0"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">외박시작일</div>
					<div class="col"><input type="date" style="width:100%"></div>
				</div>
				<div class="row">
					<div class="col-4 p-0 text-end">외박종료일</div>
					<div class="col"><input type="date" style="width:100%"></div>
				</div>
			</div>
			<div class="col ps-4"><!-- col-2 -->
				<div class="row ps- mb-1"><div class="col">외박사유</div></div>
				<div class="row">
					<div class="col">
						<textarea rows="4" cols="40"></textarea>
					</div>
				</div>
			</div>
			<div class="col"><!-- col-3 -->
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">호실</div>
					<div class="col"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">보호자연락처</div>
					<div class="col"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">신청일시</div>
					<div class="col"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row mb-1">
					<div class="col-4 p-0 text-end">신청취소일시</div>
					<div class="col"><input class="form-control form-control-sm"></div>
				</div>
				<div class="row">
					<div class="col-4 p-0 text-end">인정여부</div>
					<div class="col"><input type="checkBox"></div>
				</div>
			</div>
		</div>
		<div class="row py-3"></div>
	</div>	
</div>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script type="text/javascript">


/*function searchBystudName(value) { //학생이름이나 학번 검색
	var studValue = document.getElementById("studName").value;
	var studParam = "";
	
	if(isNaN(studValue) == true){
		studParam += "?stud_name=" + studValue;
	}else{
		studParam += "?stud_id=" + studValue;
	}
	  var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
				entNo = jsonObj.data;
			}
		}
		xhr.open("post" , "./getEntNo"+ studParam);
		//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
}*/


function lookupList(){
	var studNameVa = document.getElementById("studName").value;
		var studParam = "";
		
		if(isNaN(studNameVa) == true){
			studParam += "&stud_name=" + studNameVa;
		}else{
			studParam += "&stud_id=" + studNameVa;
		}
	var applyDT = document.getElementById("applyDate").value;
	var bldgVa = document.getElementById("bldg").value;
	var actCD = document.getElementById("ActStnd").value;
	var radioBoxVa = document.querySelector('input[name="chk_approval"]:checked').value;

	var reqParam = "";
	reqParam += "?actReqDate=" + applyDT;
	reqParam += "&bldg_code=" + bldgVa;
	
	if(actCD != '전체' && radioBoxVa != 'on' && studNameVa != ''){
		reqParam += "&act_cd="+actCD + "&act_conf_yn="+radioBoxVa +studParam;
	}else if((studNameVa != '' && actCD != '전체') ||(actCD != '전체' && studNameVa != '')){
		reqParam += studParam +"&act_cd="+actCD
	}else if((radioBoxVa != 'on' && studNameVa != '') || (studNameVa != '' && radioBoxVa != 'on')){
		reqParam += "&act_conf_yn="+radioBoxVa + studParam
	}else if((actCD != '전체' && radioBoxVa != 'on') || (radioBoxVa != 'on' &&actCD != '전체')){
		reqParam += "&act_cd="+actCD + "&act_conf_yn="+radioBoxVa;
	}else if(studNameVa != ''){
		reqParam += studParam;
	}else if(radioBoxVa != 'on'){
		reqParam += "&act_conf_yn="+radioBoxVa;
	}else if(actCD != '전체'){
		reqParam += "&act_cd="+actCD;
	}
	
	
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () { // 콜백함수
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
			var theNumberBox = document.getElementById("theNumber")
			theNumberBox.innerHTML = "";
			
			var col1 = document.createElement("div")
			col1.classList.add("col")
			number = jsonObj.count
			col1.innerText = number +"건이 조회되었습니다";
			theNumberBox.appendChild(col1)
					
            var ListTableBox = document.getElementById("ListTable")
            ListTableBox.innerHTML="";

            var tableBox = document.createElement("table")
            tableBox.classList.add("table")
            tableBox.classList.add("table-sm")
            tableBox.classList.add("table-striped")
            tableBox.setAttribute("style", "white-space: nowrap;")
            tableBox.setAttribute("id", "tableA")


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
            inputBox1.setAttribute("onclick", "checkAll(this)")
            thBox1.appendChild(inputBox1)

            var thBox2= document.createElement("th")
            thBox2.setAttribute("scope","col")
            thBox2.innerText = "신청일시"
            trBox.appendChild(thBox2)

            var thBox3= document.createElement("th")
            thBox3.setAttribute("scope","col")
            thBox3.innerText = "외박기준"
            trBox.appendChild(thBox3)

            var thBox4= document.createElement("th")
            thBox4.setAttribute("scope","col")
            thBox4.innerText = "호관"
            trBox.appendChild(thBox4)

            var thBox5= document.createElement("th")
            thBox5.setAttribute("scope","col")
            thBox5.innerText = "호실"
            trBox.appendChild(thBox5)

            var thBox6= document.createElement("th")
            thBox6.setAttribute("scope","col")
            thBox6.innerText = "학번"
            trBox.appendChild(thBox6)

            var thBox7= document.createElement("th")
            thBox7.setAttribute("scope","col")
            thBox7.innerText = "성명"
            trBox.appendChild(thBox7)

            var thBox8= document.createElement("th")
            thBox8.setAttribute("scope","col")
            thBox8.innerText = "학과"
            trBox.appendChild(thBox8)

            var thBox9= document.createElement("th")
            thBox9.setAttribute("scope","col")
            thBox9.innerText = "외박시작일"
            trBox.appendChild(thBox9)


            var thBox10= document.createElement("th")
            thBox10.setAttribute("scope","col")
            thBox10.innerText = "외박종료일"
            trBox.appendChild(thBox10)

            var thBox11= document.createElement("th")
            thBox11.setAttribute("scope","col")
            thBox11.innerText = "외박일수"
            trBox.appendChild(thBox11)

            var thBox12= document.createElement("th")
            thBox12.setAttribute("scope","col")
            thBox12.innerText = "승인상태"
            trBox.appendChild(thBox12)
            
            var thBox13= document.createElement("th")
            thBox13.setAttribute("scope","col")
            thBox13.innerText = "신청사유"
            trBox.appendChild(thBox13)
            
            var tbodyBox = document.createElement("tbody")
			tableBox.appendChild(tbodyBox)
            
            for(actDtlList of jsonObj.data){
                var tr2Box = document.createElement("tr")
                tr2Box.setAttribute("onclick","showAct( "+actDtlList.actDtlVo.act_no+" )");
				tbodyBox.appendChild(tr2Box)

                var th2Box = document.createElement("th")
				th2Box.setAttribute("scope","row")
				tr2Box.appendChild(th2Box)

                var inputBox2 = document.createElement("input")
                inputBox2.setAttribute("type","checkbox")
                inputBox2.setAttribute("name","check1")
                inputBox2.setAttribute("value","")
                inputBox2.value = actDtlList.actDtlVo.act_no
                th2Box.appendChild(inputBox2)
                
                /*if(actData.actDtlVo.act_conf_yn == 'Y'){
                	document.getElementsByName('check1').checked = true;
                }*/
                		
                var tdBox1 = document.createElement("td") //신청날짜0
                tdBox1.innerText = dateFormat(actDtlList.actDtlVo.act_req_dt)
                tr2Box.appendChild(tdBox1)

                var tdBox2 = document.createElement("td") //외박기준명
                tdBox2.innerText = actDtlList.actStnVo.act_nm
                tr2Box.appendChild(tdBox2)

                var tdBox3 = document.createElement("td") //호관
                tdBox3.innerText = actDtlList.ConstructionInfo.BLDG_NAME
                tr2Box.appendChild(tdBox3)

                var tdBox4 = document.createElement("td") //호실
                tdBox4.innerText = actDtlList.ConstructionInfo.FLOOR_NAME
                tr2Box.appendChild(tdBox4)

                var tdBox5 = document.createElement("td") //학번
                tdBox5.innerText = actDtlList.StudInfo.STUD_ID
                tr2Box.appendChild(tdBox5)

                var tdBox6 = document.createElement("td") //성명
                tdBox6.innerText = actDtlList.StudInfo.STUD_NAME
                tr2Box.appendChild(tdBox6)

                var tdBox7 = document.createElement("td") //학과
                tdBox7.innerText = actDtlList.StudInfo.STUD_DEPT
                tr2Box.appendChild(tdBox7)

                var tdBox8 = document.createElement("td") //외박시작일0
                tdBox8.innerText = dateFormat(actDtlList.actDtlVo.act_start_dt)
                tr2Box.appendChild(tdBox8)

                var tdBox9 = document.createElement("td") // 외박종료일0              
                tdBox9.innerText = dateFormat(actDtlList.actDtlVo.act_ent_dt)
                tr2Box.appendChild(tdBox9)

                var tdBox10 = document.createElement("td")//외박일수0
                tdBox10.innerText = actDtlList.actDtlVo.act_day_cnt
                tr2Box.appendChild(tdBox10)

                var tdBox11 = document.createElement("td")//승인상태0
                tdBox11.innerText = actDtlList.actDtlVo.act_conf_yn
                tr2Box.appendChild(tdBox11)

                var tdBox12 = document.createElement("td")//외박사유0
                tdBox12.innerText = actDtlList.actDtlVo.act_rsn
                tr2Box.appendChild(tdBox12)

            }

            ListTableBox.appendChild(tableBox)//맨마지막
			
		}
	}
	xhr.open("get" ,"./getACTList" + reqParam);
	//xhr.open("get" ,"./getACTList?actReqDate="+applyDT+"&act_cd="+actCD+"&ent_stud_no="+studNameVa+"&bldg_code="+bldgVa+"&act_conf_yn="+radioBoxVa); 
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send();
}

function checkAll(checkAll)  { //전체선택...
	  const checkboxes 
	       = document.getElementsByName('check1');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = checkAll.checked;
	  })
	}
	
function approvalAct() {
  // 선택된 목록 가져오기
  const query = 'input[name="check1"]:checked';
  const selectedEls = document.querySelectorAll(query);
  
  // 선택된 목록에서 value 찾기
  let result = '';
  selectedEls.forEach((el) => {
    result += el.value + ' ';
  });
	let arr = result.split(' ');
	if(arr == '' ){
		swal("","선택된 항목이 없습니다", "warning");
		return;
	}else{
		 var xhr = new XMLHttpRequest(); //AJAX 객체 생성
			xhr.onreadystatechange = function () { // 콜백함수
				if(xhr.readyState == 4 && xhr.status == 200){
					var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
					if(jsonObj.result == 'fail'){
						swal("","이미 승인처리되었습니다", "warning");
						return;
					}else{
						swal("","외박승인 처리되었습니다.", "success");
						lookupList();
					}
				}
			}
			xhr.open("post" , "./updateActConf");
			xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
			xhr.send("act_no="+arr);
	}
}

function showAct(actNo){
	  var xhr = new XMLHttpRequest(); //AJAX 객체 생성
		xhr.onreadystatechange = function () { // 콜백함수
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)

				var actData = jsonObj.data
				
                var actDtlRow = document.getElementById("ActDtlBox")
                actDtlRow.innerHTML = "";

                var col1 = document.createElement("div")
                col1.classList.add("col")
                actDtlRow.appendChild(col1)

                var col1InnerRow1 = document.createElement("div")
                col1InnerRow1.classList.add("row")
                col1InnerRow1.classList.add("mb-1")
                col1.appendChild(col1InnerRow1)

                    var row1InnerCol1 = document.createElement("div")
                    row1InnerCol1.classList.add("col-4")
                    row1InnerCol1.classList.add("p-0")
                    row1InnerCol1.classList.add("text-end")
                    row1InnerCol1.innerText ="신청자"
                    col1InnerRow1.appendChild(row1InnerCol1)

                    var row1InnerCol2 = document.createElement("div")
                    row1InnerCol2.classList.add("col")
                    row1InnerCol2.classList.add("pe-0")
                    col1InnerRow1.appendChild(row1InnerCol2)

                    var inputID = document.createElement("input")
                    inputID.classList.add("form-control")
                    inputID.classList.add("form-control-sm")
                    inputID.setAttribute("value","")
                    inputID.value = actData.StudInfo.STUD_ID
                    row1InnerCol2.appendChild(inputID)

                    var row1InnerCol3 = document.createElement("div")
                    row1InnerCol3.classList.add("col")
                    row1InnerCol3.classList.add("ps-0")
                    col1InnerRow1.appendChild(row1InnerCol3)

                    var inputName = document.createElement("input")
                    inputName.classList.add("form-control")
                    inputName.classList.add("form-control-sm")
                    inputName.setAttribute("value","")
                    inputName.value = actData.StudInfo.STUD_NAME
                    row1InnerCol3.appendChild(inputName)
                   
                var col1InnerRow2 = document.createElement("div")
                col1InnerRow2.classList.add("row")
                col1InnerRow2.classList.add("mb-1")
                col1.appendChild(col1InnerRow2)

                    var row2InnerCol1 = document.createElement("div")
                    row2InnerCol1.classList.add("col-4")
                    row2InnerCol1.classList.add("p-0")
                    row2InnerCol1.classList.add("text-end")
                    row2InnerCol1.innerText = "외박기준"
                    col1InnerRow2.appendChild(row2InnerCol1)

                    var row2InnerCol2 = document.createElement("div")
                    row2InnerCol2.classList.add("col")
                    col1InnerRow2.appendChild(row2InnerCol2)

                    var inputAct = document.createElement("input")
                    inputAct.classList.add("form-control")
                    inputAct.classList.add("form-control-sm")
                    inputAct.setAttribute("value","")
                    inputAct.value = actData.actStnVo.act_nm
                    row2InnerCol2.appendChild(inputAct)

                var col1InnerRow3 = document.createElement("div")
                col1InnerRow3.classList.add("row")
                col1InnerRow3.classList.add("mb-1")
                col1.appendChild(col1InnerRow3)

                    var row3innerCol1 =  document.createElement("div")
                    row3innerCol1.classList.add("col-4")
                    row3innerCol1.classList.add("p-0")
                    row3innerCol1.classList.add("text-end")
                    row3innerCol1.innerText = "외박시작일"
                    col1InnerRow3.appendChild(row3innerCol1)

                    var row3innerCol2 =  document.createElement("div")
                    row3innerCol2.classList.add("col")
                    col1InnerRow3.appendChild(row3innerCol2)

                    var strDate = document.createElement("input")
                    strDate.setAttribute("type","date")
                    strDate.setAttribute("value","")
                    strDate.setAttribute("style","width:100%")
                    //날짜 변환
                        var tempStrDT = new Date(actData.actDtlVo.act_start_dt)
					    var strDate1 = ""
					    var strDate2 = ""
					    var strDate3 = ""
						strDate1 = tempStrDT.getFullYear();
		                strDate2 = ("0" + (1 + tempStrDT.getMonth())).slice(-2);
		                strDate3 = ("0" + tempStrDT.getDate()).slice(-2);
						strDate4 = strDate1+"-"+strDate2+"-"+strDate3
                    strDate.value = strDate4
                    row3innerCol2.appendChild(strDate)

                var col1InnerRow4 = document.createElement("div")
                col1InnerRow4.classList.add("row")
                col1InnerRow4.classList.add("mb-1")
                col1.appendChild(col1InnerRow4)

                var row4innerCol1 =  document.createElement("div")
                    row4innerCol1.classList.add("col-4")
                    row4innerCol1.classList.add("p-0")
                    row4innerCol1.classList.add("text-end")
                    row4innerCol1.innerText = "외박종료일"
                    col1InnerRow4.appendChild(row4innerCol1)

                    var row4innerCol2 =  document.createElement("div")
                    row4innerCol2.classList.add("col")
                    col1InnerRow4.appendChild(row4innerCol2)

                    var endDate = document.createElement("input")
                    endDate.setAttribute("type","date")
                    endDate.setAttribute("style","width:100%")
                    endDate.setAttribute("value","")
                          //날짜 변환
                        var tempEndDT = new Date(actData.actDtlVo.act_ent_dt)
					    var entDate1 = ""
					    var entDate2 = ""
					    var entDate3 = ""
					    entDate1 = tempEndDT.getFullYear();
						entDate2 = ("0" + (1 + tempEndDT.getMonth())).slice(-2);
						entDate3 = ("0" + tempEndDT.getDate()).slice(-2);
						entDate4 = entDate1+"-"+entDate2+"-"+entDate3
                    endDate.value = entDate4
                    row4innerCol2.appendChild(endDate)

                var col1InnerRow5 = document.createElement("div")
                col1InnerRow5.classList.add("row")
                col1.appendChild(col1InnerRow5)

                    var row5innerCol1 =  document.createElement("div")
                    row5innerCol1.classList.add("col-4")
                    row5innerCol1.classList.add("p-0")
                    row5innerCol1.classList.add("text-end")
                    row5innerCol1.innerText = "학과/학년"
                    col1InnerRow5.appendChild(row5innerCol1)

                    var row5innerCol2 =  document.createElement("div")
                    row5innerCol2.classList.add("col")
                    row5innerCol2.classList.add("pe-0")
                    col1InnerRow5.appendChild(row5innerCol2)

                    var inputDept = document.createElement("input")
                    inputDept.classList.add("form-control")
                    inputDept.classList.add("form-control-sm")
                    inputDept.setAttribute("value","")
                    inputDept.value = actData.StudInfo.STUD_DEPT
                    row5innerCol2.appendChild(inputDept)

                    var row5innerCol3 =  document.createElement("div")
                    row5innerCol3.classList.add("col")
                    row5innerCol3.classList.add("ps-0")
                    col1InnerRow5.appendChild(row5innerCol3)

                    var inputGde = document.createElement("input")
                    inputGde.classList.add("form-control")
                    inputGde.classList.add("form-control-sm")
                    inputGde.setAttribute("value","")
                    inputGde.value = actData.StudInfo.STUD_GRADE
					row5innerCol3.appendChild(inputGde)
					
                var col2 = document.createElement("div")
                col2.classList.add("col")
                actDtlRow.appendChild(col2)

                    var reasonRow1 = document.createElement("div")
                    reasonRow1.classList.add("row")
                    reasonRow1.classList.add("mb-1")
                    col2.appendChild(reasonRow1)

                    var reasonRowinnerCol = document.createElement("div")
                    reasonRowinnerCol.classList.add("col")
                    reasonRowinnerCol.classList.add("ps-3")
                    reasonRowinnerCol.innerText = "외박사유"
                    reasonRow1.appendChild(reasonRowinnerCol)
                    
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
                    inputReason.value = actData.actDtlVo.act_rsn
                    reasonRowinnerCol2.appendChild(inputReason) 
                    
				var col3 = document.createElement("div")
                col3.classList.add("col")
                actDtlRow.appendChild(col3)

                var roomRow = document.createElement("div")
                roomRow.classList.add("row")
                roomRow.classList.add("mb-1")
                col3.appendChild(roomRow)

                    var roomCol1 = document.createElement("div")
                    roomCol1.classList.add("col-4")
                    roomCol1.classList.add("p-0")
                    roomCol1.classList.add("text-end")
                    roomCol1.innerText = "호실"
                    roomRow.appendChild(roomCol1)

                    var roomCol2 = document.createElement("div")
                    roomCol2.classList.add("col")
                    roomRow.appendChild(roomCol2)

                    var inputRoom = document.createElement("input")
                    inputRoom.classList.add("form-control")
                    inputRoom.classList.add("form-control-sm")
                    inputRoom.setAttribute("value","")
                    inputRoom.value = actData.ConstructionInfo.FLOOR_NAME
                    roomCol2.appendChild(inputRoom)

                var parPhoneRow = document.createElement("div")
                parPhoneRow.classList.add("row")
                parPhoneRow.classList.add("mb-1")
                col3.appendChild(parPhoneRow)

                    var phoneCol1 = document.createElement("div")
                    phoneCol1.classList.add("col-4")
                    phoneCol1.classList.add("p-0")
                    phoneCol1.classList.add("text-end")
                    phoneCol1.innerText = "보호자연락처"
                    parPhoneRow.appendChild(phoneCol1)

                    var phoneCol2 = document.createElement("div")
                    phoneCol2.classList.add("col")
                    parPhoneRow.appendChild(phoneCol2)

                    var inputPhone = document.createElement("input")
                    inputPhone.classList.add("form-control")
                    inputPhone.classList.add("form-control-sm")
                    inputPhone.setAttribute("value","")
                    inputPhone.value = actData.StudInfo.GRDN_PHONE
                    phoneCol2.appendChild(inputPhone)

                var reqDtRow = document.createElement("div")
                reqDtRow.classList.add("row")
                reqDtRow.classList.add("mb-1")
                col3.appendChild(reqDtRow)

                    var reqDtCol1 = document.createElement("div")
                    reqDtCol1.classList.add("col-4")
                    reqDtCol1.classList.add("p-0")
                    reqDtCol1.classList.add("text-end")
                    reqDtCol1.innerText = "신청일시"
                    reqDtRow.appendChild(reqDtCol1)

                    var reqDtCol2 = document.createElement("div")
                    reqDtCol2.classList.add("col")
                    reqDtRow.appendChild(reqDtCol2)

                    var inputreqDt = document.createElement("input")
                    inputreqDt.classList.add("form-control")
                    inputreqDt.classList.add("form-control-sm")
                    inputreqDt.setAttribute("value","") 
                    inputreqDt.value = dateFormat(actData.actDtlVo.act_req_dt)
                    reqDtCol2.appendChild(inputreqDt)

                var delDtRow = document.createElement("div")
                delDtRow.classList.add("row")
                delDtRow.classList.add("mb-1")
                col3.appendChild(delDtRow)

                    var delDtCol1 = document.createElement("div")
                    delDtCol1.classList.add("col-4")
                    delDtCol1.classList.add("p-0")
                    delDtCol1.classList.add("text-end")
                    delDtCol1.innerText = "신청취소일시"
                    delDtRow.appendChild(delDtCol1)

                    var delDtCol2 = document.createElement("div")
                    delDtCol2.classList.add("col")
                    delDtRow.appendChild(delDtCol2)

                    var inputDelDt = document.createElement("input")
                    inputDelDt.classList.add("form-control")
                    inputDelDt.classList.add("form-control-sm")
                    inputDelDt.setAttribute("value","")
                    inputDelDt.setAttribute("disabled","")
                    if(actData.actDtlVo.act_cancl_dt != null){
                    	inputDelDt.value = dateFormat(actData.actDtlVo.act_cancl_dt)
                    }else{
                        inputDelDt.value = ""                   	
                    }
                    delDtCol2.appendChild(inputDelDt)

                var confRow = document.createElement("div")
                confRow.classList.add("row")
                col3.appendChild(confRow)

                    var conftCol1 = document.createElement("div")
                    conftCol1.classList.add("col-4")
                    conftCol1.classList.add("p-0")
                    conftCol1.classList.add("text-end")
                    conftCol1.innerText = "인정여부"
                    confRow.appendChild(conftCol1)
                    
                    var conftCol2 = document.createElement("div")
                    conftCol2.classList.add("col")
                    confRow.appendChild(conftCol2)
                    
                    var inputconfBox = document.createElement("input")
                    inputconfBox.setAttribute("type","checkBox")
                    inputconfBox.setAttribute("id","check2")
                    inputconfBox.setAttribute("value","")
                    inputconfBox.value= actData.actDtlVo.act_conf_yn
                    conftCol2.appendChild(inputconfBox)
                    
                    if(actData.actDtlVo.act_conf_yn == 'Y'){
                    	document.getElementById('check2').checked = true;
                    }
			}
		}
		xhr.open("post" , "./getActDtl?act_no="+actNo);
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
		xhr.send();
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
	  yearSuffix: '년'
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
	  lookupList();
	}); 
</script>
</html>