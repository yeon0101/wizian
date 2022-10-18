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
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
   



<style>

   .page-content{
      font-size:0.8rem;
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
   
   
   #applyList{
	background-color: #fff;
    border-bottom-left-radius: 0.375rem;
    border-bottom-right-radius: 0.375rem;
    padding: 0.5rem;
    border: 1px solid #dee2e6;
    border-top: 0;
   }
   
   #applyList .table-wrapper{
	background-color:white;
	border-radius:0.375rem;
	overflow:hidden;
	}

	#applyList .table{
		margin-bottom:0;
	}
	
	#applyList .table thead tr{
		text-align: center;
		background-color: #F7C561;
		vertical-align: middle;
	}
	
	.title{
	align-self: center;
    text-align: end;
    padding-right: 0;
}
	
	.payment-btn2{
		border-radius: 0.375rem;
	    background-color: #ffda91;
	    border-color: #ffda91;
	    padding: 0rem 0.2rem;
	}
	
	
	.payment-btn1{
		border-radius: 0.375rem;
	    background-color: #dfdfdf;
	    border-color: #dfdfdf;
	    padding: 0rem 0.2rem;
	}

   .payment-btn{
	    background-color: #F7C561;
	    padding: 0.7rem;
	    font-size: 1rem;
	    color: black;
	    border: #F7C561;
   }
   
   /*윤설 css 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
   table{
      margin-bottom:0;
  	 border-collapse: collapse;
   }
   
   table thead{
      text-align: center;
   }
   	thead{
		text-align: center;
		position: relative;
	}
	thead tr{
	 position: sticky;
	  top: 0;
	  border-top: 0;
  	background-clip: padding-box;
  	background-color: #F7C561;
  	border-bottom-width: thin;
	border-bottom-color: #696767;
	}
	thead th{
		border-right: 1px solid #dee2e6;
	}
	thead th:first-child{
		border-right: 0;
	}
   
   table tr td{
      text-align: center;
      border-right: 1px solid #dee2e6;
   }
   
   table thead th:last-child,
   table tbody td:last-child,
   table tfoot td:last-child{
     /*  border-right: 0; */
   }
   	tbody th{
	background-clip: padding-box;
	}
	tbody tr td{
	text-align: center;
	border-right: 1px solid #dee2e6;
	}

   table thead tr th{
      text-align: center;
   }
   
   table tfoot tr td{
      border-right: 1px solid #e9ecef;
   }
	textarea {
			width: 100%;
			height: 100px;
			padding: 10px;
			box-sizing: border-box;
			border-radius: 5px;
			font-size: 12px;
			resize: both;ssss
		}

	.tableOnRow{
		border :1px solid #dee2e6; 
		height: 400px;
		overflow: auto;
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
    /*네비바*/
    .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
    color: #000000;
    background-color: var(--bs-nav-tabs-link-active-bg);
    border-color: var(--bs-nav-tabs-link-active-border-color);
    font-weight: bold;
	}
	.nav-tabs {
    --bs-nav-tabs-border-color: #ffffff;
    }
     .nav {
    --bs-nav-link-color: #858585;
    }
    .nav-tabs .nav-link{
	color: #495057;
	background-color:#efefef;
	}
    /*윤설 css 끝*/
</style>

</head>
<body>

 <!-- 납부상세 모달 -->
   <div id="paymentInfoModal" class="modal" tabindex="-1">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <h5 class="modal-title">납부 상세 보기</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>

         </div>
         <div class="modal-body pb-0">
             <table class="table table-bordered">
               <tbody id="dormitoryFeeDetail">
                <!-- ent fee detail -->
               </tbody>
             </table>
         </div>
         <div class="row">
            <div class="col d-grid " id="btnCol">
            <!-- payment btn -->
            </div>
         </div>
       </div>
     </div>
   </div>
<!-- 납부상세 모달 끝 -->




<jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>

<div class="page-content p-5" id="content">

    <div class="table-wrapper shadow">
      <div class="row p-2">
        <div class="col-1">
          <img style="object-fit: cover; height: 150px; width: 100px;" src="../../resources/img/은우2.jpg" alt="">
        </div>
        <div class="col" id="studentInfo">
          <div class="row mb-1">
            <div class="col-1 title">학번</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text" value="${sessionStudentInfo.stud_id }"></div>
            <div class="col-1 title">성명</div>
            <div class="col-3"><input id="studName" class="form-control form-control-sm" type="text" value="${sessionStudentInfo.stud_name }"></div>
            <div class="col-1 title">학년</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text" value="${sessionStudentInfo.stud_grade }"></div>
          </div>
          <div class="row mb-1">
            <div class="col-1 title">성별</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text" value="${sessionStudentInfo.stud_gender }"></div>
            <div class="col-1 title">학생연락처</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text" value="${sessionStudentInfo.stud_phone }"></div>
            <div class="col-1 title">email</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text" value="${sessionStudentInfo.stud_email }"></div>
          </div>
          <div class="row mb-1">
            <div class="col-1 title">호관명</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text"></div>
            <div class="col-1 title">호실</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text"></div>
            <div class="col-1 title">입사일</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text"></div>
          </div>
          <div class="row mb-1">
            <div class="col-1 title">퇴사예정일</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text"></div>
            <div class="col-1 title">퇴사일</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text"></div>
            <div class="col-1 title">퇴사구분</div>
            <div class="col-3"><input class="form-control form-control-sm" type="text"></div>
          </div>
        </div>
      </div>
    </div>







<div class="row py-3"></div>
<div class="row pt-3">
   <div class="col">
   	
	   	 <ul class="nav nav-tabs" id="myTab" role="tablist">
	        <li class="nav-item" role="presentation">
	          <button class="nav-link active" id="applyList-tab" data-bs-toggle="tab" data-bs-target="#applyList" type="button" role="tab" aria-controls="home" aria-selected="true">입사내역</button>
	        </li>
			<li class="nav-item" role="presentation">
	          <button class="nav-link" onclick="getEntNo()" id="actContact-tab" data-bs-toggle="tab" data-bs-target="#actContact" type="button" role="tab" aria-controls="actContact" aria-selected="false">외박내역</button>
	        </li>
	        <li class="nav-item" role="presentation">
	          <button class="nav-link" onclick="getEntNo()" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">벌점내역</button>
	        </li>
	      </ul>
    
      <div class="tab-content" id="myTabContent">
        <div class="tab-pane fade show active" id="applyList" role="tabpanel" aria-labelledby="home-tab">
           <div class="table-wrapper m-3 shadow">
               <table class="table table-bordered table-sm table-striped">
                   <thead>
                     <tr>
                       <th scope="col">입사신청번호</th>
                       <th scope="col">입사년도</th>
                       <th scope="col">입사학기</th>
                       <th scope="col">입사시기</th>
                       <th scope="col">모집단위명</th>
                       <th scope="col">신청일자</th>
                       <th scope="col">입사승인여부</th>
                       <th scope="col">납부현황</th>
                       <th scope="col">납부정보</th>
                     </tr>
                   </thead>
                      <tbody>
                         <c:forEach items="${ApplMap }" var="appldata">
                            <tr>
                               <td>${appldata.APPL_NO }</td>
                               <td>${appldata.ENT_YEAR }</td>
                               <td>${appldata.ENT_TERM }</td>
                               <td>${appldata.ENT_TERM_DIV }</td>
                               <td>${appldata.RECR_NAME }</td>
                               <td><fmt:formatDate pattern="yyyy-MM-dd" value="${appldata.APPL_DATE}"/></td>
                               <c:if test="${appldata.APPL_YN=='W' }">
                               <td>승인대기</td>
                               </c:if>
                               <c:if test="${appldata.APPL_YN=='Y' }">
                               <td>승인완료</td>
                               </c:if>
                               <c:if test="${appldata.APPL_YN=='N' }">
                               <td>신청탈락</td>
                               </c:if>
                               <td>
                               	<c:choose>
                               		<c:when test="${appldata.APPL_YN=='Y' && appldata.ROOM_CODE == null}">
                               			배정중
                               		</c:when>
                               		<c:when test="${appldata.APPL_YN == 'Y' &&  appldata.ROOM_CODE != null && appldata.SLCT_YN == 'N'}">
                               			미납
                               		</c:when>
                               		<c:when test="${appldata.SLCT_YN=='Y' }">
                               			납부완료
                               		</c:when>
                               		<c:otherwise>-</c:otherwise>
                               	</c:choose>
                               </td>
                               <td>
                                  <c:choose>
                                     <c:when test="${appldata.SLCT_YN == 'Y' }">
                                        <button class="btn payment-btn1" data-bs-toggle="modal" data-bs-target="#paymentInfoModal" onclick="showPaidDormitoryFeeDetail(${appldata.APPL_NO})">납부상세</button>                           
                                     </c:when>
                                     <c:when test="${appldata.APPL_YN == 'Y' &&  appldata.ROOM_CODE != null && appldata.SLCT_YN == 'N' }">
                                        <button class="btn payment-btn2" data-bs-toggle="modal" data-bs-target="#paymentInfoModal" onclick="showDormitoryFeeDetail(${appldata.APPL_NO})">납부하기</button>                           
                                     </c:when>
                                     <c:otherwise>
                                        -
                                     </c:otherwise>
                                  </c:choose>
                               </td>
                            </tr>
                         </c:forEach>
                      </tbody>
                 </table>
         </div>
        </div>
       
        
        
        <!-- 벌점내역 -->
        <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
            <div class="table-wrapper shadow">
            	<div class="row py-3"></div>
               <div class="row shadow py-3 mx-3" style="background: #fdefc3; border-radius:10px;">
                      <div class="col mt-1 fw-bold text-center">조회기간</div> 
                      <div class="col-4 mt-1">
                      	<div class="row">
                      		<div class="col-2 p-0 text-end">시작일</div>
                      		<div class="col"><input type="date" style="width: 100%;" id="startDay"></div></div>
                      	</div>
                      <div class="col-4 mt-1">
                      	<div class="row">
                      		<div class="col-2 p-0 text-end">종료일</div>
                      		<div class="col">
                      			<input type="date" id="endDay" style="width: 100%;">
                      		</div>
                      	</div>
                      </div>
                      <div class="col p-0"><button class="btn btn-primary" onclick="searchMyPen()">조회하기</button> </div>
               </div>
               <div class="row py-3"></div>   
               <div class="row tableOnRow shadow mx-3">
               	<div class="col">
	               	<div class="row" id="tableRow">
		               <table class="table table-sm table-striped">
		                      <thead>
		                        <tr>
		                          <th scope="col">벌점부과번호</th>
		                          <th scope="col">벌점사유</th>
		                          <th scope="col">벌점</th>
		                          <th scope="col">벌점명</th>
		                          <th scope="col">벌점발생일자</th>
		                        </tr>
		                      </thead>     
		               </table>
		            </div> 
               	</div>
               </div>
	            <div class="row py-3"></div> 
            </div>
        </div>
        <!-- 외박내역 -->
      <div class="tab-pane fade" id="actContact" role="tabpanel" aria-labelledby="actContact-tab">
        <div class="table-wrapper shadow" >
        	<div class="row py-3"></div>
               <div class="row shadow py-3 mx-3" style="background: #fdefc3; border-radius:10px;">
                      <div class="col mt-1 fw-bold text-center">조회기간</div> 
                      <div class="col-4 mt-1">
                      	<div class="row">
                      		<div class="col-2 p-0 text-end">시작일</div>
                      		<div class="col"><input type="date" style="width: 100%;" id="actStrDay"></div>
                      	</div>
                      </div>
                      <div class="col-4 mt-1">
                      	<div class="row">
                      		<div class="col-2 p-0 text-end">종료일</div>
                      		<div class="col">
                      			<input type="date" id="actEndDay" style="width: 100%;">
                      		</div>
                      	</div>
                      </div>
                      <div class="col p-0"><button class="btn btn-primary" onclick="searchMyAct()">조회하기</button></div>
               </div>     	

            	<div class="row py-3"></div>  
            	<div class="row tableOnRow shadow mx-3">
            		<div class="col">
	            		<div class="row" id="tablePen">
			               <table class="table table-sm table-striped">
			                      <thead>
			                        <tr>
			                          <th scope="col">외박신청번호</th>
			                          <th scope="col">신청일시</th>
			                          <th scope="col">신청사유</th>
			                          <th scope="col">외박시작일</th>
			                          <th scope="col">외박종료일</th>
			                          <th scope="col">외박일수</th>
			                        </tr>
			                      </thead>    
			               </table>
		            	</div> 
            		</div>
            	</div>
	            <div class="row py-3"></div>      
        	</div>
        </div>
        
     </div> 
   </div>
</div>
      
            
            
            
            
  </div><!--page content end -->

   <script type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
<script type="text/javascript">	  

	function dateFormat(value){
	    var dateValue = new Date(value);
	     var Date1 = "";
	     var Date2 = "";
	     var Date3 = "";
	     Date1 += dateValue.getFullYear();
	     Date2 += ("0" + (1 + dateValue.getMonth())).slice(-2);
	     Date3 += ("0" + dateValue.getDate()).slice(-2);
	     Date4 = Date1+"-"+Date2+"-"+Date3
	     
	     return Date4;
	 }
	 
	
	function changeMoneyUnit() {
	       var moneyValue = document.querySelectorAll(".money");
	       const moneyUnit = "원"
	       var regex = /[^0-9]/g;
	       for(i of moneyValue){
	           result = i.innerText.toString().replace(regex,"").replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	           result = result.concat(moneyUnit);
	           i.innerText = result;
	       };
	   };
   
	   function showPaidDormitoryFeeDetail(applNo){
		      
		      var xhr = new XMLHttpRequest();
		      xhr.onreadystatechange = function(){
		         if(xhr.readyState == 4 && xhr.status == 200){
		            var jsonObj = JSON.parse(xhr.responseText);
		            
		            var dormitoryFeeDetail = document.getElementById("dormitoryFeeDetail");
		            dormitoryFeeDetail.innerText = "";
		            
		            var tr1 = dormitoryFeeDetail.insertRow(-1);
		            tr1.insertCell(0).innerText = '입사단위명';
		            tr1.insertCell(1).innerText = jsonObj.ENT_NAME;
		            
		            var tr2 = dormitoryFeeDetail.insertRow(-1);
		            tr2.insertCell(0).innerText = '이름';
		            tr2.insertCell(1).innerText = document.getElementById('studName').value;
		            
		            var tr3 = dormitoryFeeDetail.insertRow(-1);
		            tr3.insertCell(0).innerText = '학번';
		            tr3.insertCell(1).innerText = jsonObj.STUD_ID;
		            
		            var tr4 = dormitoryFeeDetail.insertRow(-1);
		            tr4.insertCell(0).innerText = '배정생활관';
		            tr4.insertCell(1).innerText = jsonObj.BLDG_CODE + '관';
		            
		            var tr5 = dormitoryFeeDetail.insertRow(-1);
		            tr5.insertCell(0).innerText = '배정호실';
		            tr5.insertCell(1).innerText = jsonObj.ROOM_CODE + '호';
		            
		            var tr6 = dormitoryFeeDetail.insertRow(-1);
		            tr6.insertCell(0).innerText = '납부금액';
		            var tr6td2 = tr6.insertCell(1);
		            tr6td2.innerText = jsonObj.RCV_AMT + '원';
		            tr6td2.classList.add('money');
		            
		            
		            var tr7 = dormitoryFeeDetail.insertRow(-1);
		            tr7.insertCell(0).innerText = '납부일자';
		            tr7.insertCell(1).innerText = dateFormat(jsonObj.RCV_DT);
		          
		            changeMoneyUnit();
		         }
		      }
		      xhr.open("post", "./getMyEntFeeInfo");
		      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		      xhr.send("applNo=" + applNo);
		      
		   }
   
  
   function showDormitoryFeeDetail(applNo){
	      console.log(applNo);
	      
	      var xhr = new XMLHttpRequest();
	      xhr.onreadystatechange = function(){
	         if(xhr.readyState == 4 && xhr.status == 200){
	            var jsonObj = JSON.parse(xhr.responseText);
	            
	            var dormitoryFeeDetail = document.getElementById("dormitoryFeeDetail");
	            dormitoryFeeDetail.innerText = "";
	            
	            var tr1 = dormitoryFeeDetail.insertRow(-1);
	            tr1.insertCell(0).innerText = '입사단위명';
	            tr1.insertCell(1).innerText = jsonObj.ENT_NAME;
	            
	            
	            var tr2 = dormitoryFeeDetail.insertRow(-1);
	            tr2.insertCell(0).innerText = '이름';
	            tr2.insertCell(1).innerText = document.getElementById('studName').value;
	            
	            var tr3 = dormitoryFeeDetail.insertRow(-1);
	            tr3.insertCell(0).innerText = '학번';
	            tr3.insertCell(1).innerText = jsonObj.STUD_ID;
	            
	            var tr4 = dormitoryFeeDetail.insertRow(-1);
	            tr4.insertCell(0).innerText = '배정생활관';
	            tr4.insertCell(1).innerText = jsonObj.BLDG_CODE + '관';
	            
	            var tr5 = dormitoryFeeDetail.insertRow(-1);
	            tr5.insertCell(0).innerText = '배정호실';
	            tr5.insertCell(1).innerText = jsonObj.ROOM_CODE + '호';
	            
	            var tr6 = dormitoryFeeDetail.insertRow(-1);
	            tr6.insertCell(0).innerText = '납부금액';
	            var tr6td2 = tr6.insertCell(1);
	            tr6td2.innerText = jsonObj.ENT_FEE_AMT;
	            tr6td2.classList.add('money');
	            
	            var tr7 = dormitoryFeeDetail.insertRow(-1);
	            tr7.insertCell(0).innerText = '납부기한';
	            tr7.insertCell(1).innerText = dateFormat(jsonObj.RCV_START_DATE) + ' ~ ' + dateFormat(jsonObj.RCV_END_DATE);
	            
	            var tr8 = dormitoryFeeDetail.insertRow(-1);
	            tr8.insertCell(0).innerText = '은행';
	            tr8.insertCell(1).innerText = '국민은행';
	            
	            var tr9 = dormitoryFeeDetail.insertRow(-1);
	            tr9.insertCell(0).innerText = '계좌';
	            tr9.insertCell(1).innerText = jsonObj.VR_ACCOUNT;
	            
	            
	            var btnCol = document.getElementById('btnCol');
	            btnCol.innerHTML = "";
	            var btnButton = document.createElement('button');
	            btnButton.classList.add('btn', 'payment-btn', 'mx-3','mb-3');
	            btnButton.setAttribute('onclick', "payment(" + jsonObj.APPL_NO + ',' + jsonObj.ENT_FEE_AMT + ")");
	            btnButton.innerText = '결제하기';
	            
	            btnCol.appendChild(btnButton);
	            
	            var testBtn = document.createElement('button');
	            testBtn.classList.add('btn', 'payment-btn', 'mx-3','mb-3');
	            testBtn.setAttribute('onclick', "testPayment(" + jsonObj.APPL_NO + ',' + jsonObj.ENT_FEE_AMT + ")");
	            testBtn.innerText = '결제하기(API생략)';
	            
	           // btnCol.appendChild(testBtn);
	            
	            changeMoneyUnit();

	         }
	      }
	      xhr.open("post", "./getMyEntFeeInfo");
	      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	      xhr.send("applNo=" + applNo);
	   }
  
   
   function payment(applNo, entFeeAmt){
	      
       IMP.init('imp15642471');
     
       IMP.request_pay({
           pg : 'html5_inicis', 
           pay_method : 'card',
           merchant_uid : 'merchant_' + new Date().getTime(),
           name : '생활관비 납부',
           amount : 100,
           buyer_email : 'iamport@siot.do',
           buyer_name : document.getElementById('studName').value,
       }, function(rsp) {
           if ( rsp.success ) {
               /* var title = '납부가 완료되었습니다.';
               var msg = '상품명 : ' + rsp.name + '\n' ;
               msg += '결제 금액 : ' + rsp.paid_amount + '\n';
               msg += '카드 승인번호 : ' + rsp.apply_num + '\n';
               msg += '결제일시 : ' + dateFormat(new Date().getTime());
               
               swal(title, msg, 'success');
                */
           } else {
              /*  var title = '결제에 실패하였습니다.';
               var mst = '에러내용 : ' + rsp.error_msg;
               swal(title, msg); */
           }
           
           var paymentInfo = {};
           paymentInfo['appl_no'] = applNo;
           paymentInfo['rcv_amt'] = entFeeAmt;
           
           savePaymentInfo(paymentInfo);
           
       });
       }
   
   function testPayment(applNo, entFeeAmt){
	      
           var paymentInfo = {};
           paymentInfo['appl_no'] = applNo;
           paymentInfo['rcv_amt'] = entFeeAmt;
           
           savePaymentInfo(paymentInfo);
       
       }
 
 
   
   function savePaymentInfo(paymentInfo){

	      var param = JSON.stringify(paymentInfo); 
	       
	       var xhr = new XMLHttpRequest();
	         xhr.onreadystatechange = function(){
	             if(xhr.readyState == 4 && xhr.status == 200){
	             var jsonObj = JSON.parse(xhr.responseText);
	             	
	                var msg = '\n';
	                msg += '결제금액 : ' + paymentInfo.rcv_amt + '원\n';
	                msg += '결제일시 : ' + dateFormat(new Date().getTime());
	                
	                swal({
	            		title : '납부가 완료되었습니다.',
	            		text: msg,
            	    	icon  : 'success',
            	    	closeOnClickOutside : false
	            	}, function(){
	            		location.href='/dormitory/student/dormitoryLife/studentAssortmentPage';
	            	});
	                
	                //swal('납부가 완료되었습니다', msg);
	                
	             }
	          }
	         xhr.open("post", "./saveEntFeeDetailInfo");
	          xhr.setRequestHeader("Content-type", "application/json");
	         xhr.send(param);
	   }
   
   
   
   function disableStudentInfoInput(){
      var inputs = document.querySelectorAll('#studentInfo input');
      inputs.forEach(e => {
         e.disabled = true;
      })
   }
   
   
 //윤설--------------------------------
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
	            		location.href='./studentAssortmentPage';
	            	});
   	            }
   	            
   	         }
   	      }
   	      xhr.open("post", "./getEntNo", false);
   	      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
   	      xhr.send();
   	   } 
   function searchMyPen(){
	   
	   var reqValue = "";
      var myStrDay = document.getElementById("startDay").value;
      var myEnDay = document.getElementById("endDay").value;
      
      reqValue += "?ent_stud_no=" + myEntStudNo;
      
      if(myStrDay != '' && myEnDay == ''){
         reqValue += "&startDate=" + myStrDay
      }else if(myStrDay != '' && myEnDay != ''){
         reqValue += "&startDate=" + myStrDay
         reqValue += "&endDate=" + myEnDay
      }
      
       var xhr = new XMLHttpRequest(); //AJAX 객체 생성
      xhr.onreadystatechange = function () { // 콜백함수
         if(xhr.readyState == 4 && xhr.status == 200){
            var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
            
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
               thBox1.innerText = "벌점부과번호"
               trBox.appendChild(thBox1)

               var thBox2 = document.createElement("th")
               thBox2.setAttribute("scope","col")
               thBox2.innerText = "벌점사유"
               trBox.appendChild(thBox2)

               var thBox3 = document.createElement("th")
               thBox3.setAttribute("scope","col")
               thBox3.innerText = "벌점"
               trBox.appendChild(thBox3)

               var thBox4 = document.createElement("th")
               thBox4.setAttribute("scope","col")
               thBox4.innerText = "벌점명"
               trBox.appendChild(thBox4)
               
               var thBox5 = document.createElement("th")
               thBox5.setAttribute("scope","col")
               thBox5.innerText = "벌점발생일자"
               trBox.appendChild(thBox5)

               var tbodyBox = document.createElement("tbody")
               tableBox.appendChild(tbodyBox)

               for( myPenDtlData of jsonObj.data){
            	   var tr2Box = document.createElement("tr")
                     tbodyBox.appendChild(tr2Box)

                     var th2Box = document.createElement("th")
                     th2Box.setAttribute("scope","row")
                     tr2Box.appendChild(th2Box)
                        
                     var tdBox0 = document.createElement("td")               
                     tdBox0.innerText = myPenDtlData.penDtlVo.pen_no
                     tr2Box.appendChild(tdBox0)
                     
                     var tdBox1 = document.createElement("td")
                     tdBox1.innerText = myPenDtlData.penDtlVo.pen_rsm
                     tr2Box.appendChild(tdBox1)
            
                     var tdBox2 = document.createElement("td")               
                     tdBox2.innerText = myPenDtlData.penStd.PEN_PT
                     tr2Box.appendChild(tdBox2)
                     
                     var tdBox3 = document.createElement("td") 
                     tdBox3.innerText = myPenDtlData.penStd.PEN_NM
                     tr2Box.appendChild(tdBox3)
            
                     var tdBox4 = document.createElement("td")  
                     tdBox4.innerText = dateFormat(myPenDtlData.penDtlVo.pen_dt)
                     tr2Box.appendChild(tdBox4)
                  }
               tableRowBox.appendChild(tableBox) //가장 마지막
         }
      }
      xhr.open("get" , "./getMyPenList"+reqValue);
      //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
      xhr.send();
   }
   function searchMyAct(){
	   
	      var reqActValue = "";
	      var myActStrDay = document.getElementById("actStrDay").value;
	      var myActEndDay = document.getElementById("actEndDay").value;
	      
	      reqActValue += "?ent_stud_no=" + myEntStudNo;
	      
	      if(myActStrDay != '' && myActEndDay == ''){
	    	  reqActValue += "&actStrDate=" + myActStrDay
	      }else if(myActStrDay != '' && myActEndDay != ''){
	    	  reqActValue += "&actStrDate=" + myActStrDay
	         reqActValue += "&actEntDate=" + myActEndDay
	      }
	      
	       var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	      xhr.onreadystatechange = function () { // 콜백함수
	         if(xhr.readyState == 4 && xhr.status == 200){
	            var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
	            
	            var tableRowBox = document.getElementById("tablePen")
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
	               thBox1.innerText = "외박신청번호"
	               trBox.appendChild(thBox1)

	               var thBox2 = document.createElement("th")
	               thBox2.setAttribute("scope","col")
	               thBox2.innerText = "신청일시"
	               trBox.appendChild(thBox2)

	               var thBox3 = document.createElement("th")
	               thBox3.setAttribute("scope","col")
	               thBox3.innerText = "외박활동명"
	               trBox.appendChild(thBox3)

	               var thBox4 = document.createElement("th")
	               thBox4.setAttribute("scope","col")
	               thBox4.innerText = "신청사유"
	               trBox.appendChild(thBox4)
	               
	               var thBox5 = document.createElement("th")
	               thBox5.setAttribute("scope","col")
	               thBox5.innerText = "외박시작일"
	               trBox.appendChild(thBox5)
	               
	               var thBox6 = document.createElement("th")
	               thBox6.setAttribute("scope","col")
	               thBox6.innerText = "외박종료일"
	               trBox.appendChild(thBox6)
	               
	               var thBox7 = document.createElement("th")
	               thBox7.setAttribute("scope","col")
	               thBox7.innerText = "외박일수"
	               trBox.appendChild(thBox7)

	               var tbodyBox = document.createElement("tbody")
	               tableBox.appendChild(tbodyBox)

	               for( myAcyDtlData of jsonObj.data){
	            	   var tr2Box = document.createElement("tr")
	                     tbodyBox.appendChild(tr2Box)

	                     var th2Box = document.createElement("th")
	                     th2Box.setAttribute("scope","row")
	                     tr2Box.appendChild(th2Box)
	                        
	                     var tdBox0 = document.createElement("td")               
	                     tdBox0.innerText = myAcyDtlData.actDtlVo.act_no
	                     tr2Box.appendChild(tdBox0)
	                     
	                     var tdBox1 = document.createElement("td")
	                     tdBox1.innerText = dateFormat(myAcyDtlData.actDtlVo.act_req_dt)
	                     tr2Box.appendChild(tdBox1)
	            
	                     var tdBox2 = document.createElement("td")               
	                     tdBox2.innerText = myAcyDtlData.actStd.act_nm
	                     tr2Box.appendChild(tdBox2)
	                     
	                     var tdBox3 = document.createElement("td") 
	                     tdBox3.innerText = myAcyDtlData.actDtlVo.act_rsn
	                     tr2Box.appendChild(tdBox3)
	            
	                     var tdBox4 = document.createElement("td")  
	                     tdBox4.innerText = dateFormat(myAcyDtlData.actDtlVo.act_start_dt)
	                     tr2Box.appendChild(tdBox4)
	                     
	                     var tdBox5 = document.createElement("td")  
	                     tdBox5.innerText = dateFormat(myAcyDtlData.actDtlVo.act_ent_dt)
	                     tr2Box.appendChild(tdBox5)
	                     
	                     var tdBox6 = document.createElement("td")  
	                     tdBox6.innerText = myAcyDtlData.actDtlVo.act_day_cnt
	                     tr2Box.appendChild(tdBox6)
	                     
	                  }
	               tableRowBox.appendChild(tableBox) //가장 마지막
	         }
	      }
	      xhr.open("get" , "./getMyActList"+reqActValue);
	      //xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	      xhr.send();
	   }
   //윤설 끝----------------------------
  
 window.addEventListener("DOMContentLoaded", function (){
    disableStudentInfoInput(); 

    });
       
</script>
</html>