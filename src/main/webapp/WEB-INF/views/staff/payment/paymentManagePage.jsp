<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="../../resources/css/plan.css" rel="stylesheet" type="text/css">

<title>Insert title here</title>

<style type="text/css">


	.stats{
		border: 1px solid #ced4da;
	    border-radius: 0.375rem;
	    height: 6rem;
	    margin:0.4rem;
	}	
	
	.stats-title{
		font-weight: 800;
	    color: #676767;
	    margin-top: 0.5rem;
	    font-size: 0.9rem;;
	}
	
	.progress{
		height:1.4rem;
		
	}
	.progress-bar{
		background-color:#F7C561;
	}
	
	
	
</style>



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


	function refreshPaymentList(){
		
		var options = document.querySelectorAll('#paymentListFilter select, #paymentListFilter input[name=paymentStatus]:checked');
		var obj = {};
		
		options.forEach(option => {
	     	obj[option.name] = option.value;
		})
		
		console.log(obj);
		var paramObj = JSON.stringify(obj); 
		
		var totalAmt = 0;
		var totalPaidAmt = 0;
		var totalUnpaidAmt = 0;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				var paymentListBody = document.getElementById('paymentListBody');
				paymentListBody.innerHTML = "";
				
				for(e of jsonObj){
					
					var tr = document.createElement('tr');
					
					var td0 = document.createElement('td')
					td0.classList.add('text-center');
					var chck = document.createElement('input');
					chck.classList.add('form-check-input');
					chck.type = 'checkbox';
					
					td0.appendChild(chck);
					
					var td1 = document.createElement('td');
					td1.classList.add('text-center');

					td1.innerText = e.FEE_DTL_NO;
					
					var td2 = document.createElement('td');
					td2.classList.add('text-center');
					td2.innerText = e.APPL_NO;
					
					var td3 = document.createElement('td');
					td3.innerText = e.ENT_NAME;
					
					var td4 = document.createElement('td');
					td4.classList.add('text-center');
					td4.innerText = e.STUD_ID;
					
					var td5 = document.createElement('td');
					td5.classList.add('text-center');
					td5.innerText = e.STUD_NAME;
					
					var td10 = document.createElement('td');
					td10.classList.add('text-center');

					td10.innerText = '생활관' + e.BLDG_CODE + '동';
					
					var td6 = document.createElement('td');
					td6.classList.add('text-center');
					td6.innerText = e.ROOM_CODE + '호';
					
					var td7 = document.createElement('td');
					td7.classList.add('text-center');
					td7.classList.add('money');
					td7.innerText = e.ENT_FEE_AMT;
					totalAmt += e.ENT_FEE_AMT;
					
					var td8 = document.createElement('td');
					td8.classList.add('text-center');

					var td9 = document.createElement('td');
					td9.classList.add('text-center');

					
					
					if(e.RCV_DT != null){
						td8.innerText = '완료';
						td8.style.fontWeight = 'bold';

						td9.innerText = dateFormat(e.RCV_DT);
						totalPaidAmt += e.ENT_FEE_AMT;
					}else{
						td8.innerText = '미납';
						td8.style.color = 'crimson';
						td8.style.fontWeight = 'bold';
						td9.innerText = "-";
						totalUnpaidAmt += e.ENT_FEE_AMT;
					}
					
					paymentListBody.appendChild(tr);
					
					tr.appendChild(td0);
					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td10);
					tr.appendChild(td6);
					tr.appendChild(td7);
					tr.appendChild(td8);
					tr.appendChild(td9);
					
				}
				document.getElementById('totalAmt').innerText = totalAmt;
				document.getElementById('totalPaidAmt').innerText = totalPaidAmt;
				document.getElementById('totalUnpaidAmt').innerText = totalUnpaidAmt;
				
				var paymentProgressBar = document.getElementById('paymentProgress');
				console.log(totalPaidAmt/totalAmt);
				paymentProgressBar.style.width = (totalPaidAmt/totalAmt) * 100 + '%';
				changeMoneyUnit();
				
			}
		}
		xhr.open("post", "./restEntPaymentList");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramObj);
	}


	function getEntInfoSelectList(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var entInfoSelectBox = document.getElementById('entInfoSelect');
				entInfoSelectBox.innerHTML = "";
				
				var option1 = document.createElement('option');
				option1.innerText = '(전체)'
				option1.value = 0;
				option1.selected = true;
				entInfoSelectBox.appendChild(option1);
				
				for(e of jsonObj){
					
					var entOption = document.createElement('option');
					entOption.innerText = e.ENT_NAME;
					entOption.value = e.ENT_NO;
					entInfoSelectBox.appendChild(entOption);
				}
				
				refreshPaymentList();
			}
		}
		
		xhr.open("post", "./restEntSelectList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send();
	}
	
	
	
	
	
	window.addEventListener("DOMContentLoaded", function (){
		getEntInfoSelectList();
	});
	
	
</script>
</head>
<body>

<jsp:include page="../../staff_common/staffSidebar.jsp"></jsp:include>

   <div class="page-content p-4" id="content">
    <div class="card" style="width:100%; height:56rem; border-radius:0.375rem;">
         <div class="dashboard-card-bottom" >
   
   
	   <div class="row m-1 mt-3">
	    <div class="col-5" id="paymentListFilter">
	      <div class="row my-1">
	        <div class="col-2 title">입사단위</div>
	        <div class="col">
	          <select onchange="refreshPaymentList()" id="entInfoSelect" name="ent_no" class="form-select form-select-sm">
	            <!-- entinfo select -->
	           </select>
	        </div>
	      </div>
	      <div class="row my-1">
	        <div class="col-2 title">호관</div>
	        <div class="col">
	          <select onchange="refreshPaymentList()" id="bldgSelect" name="bldg_code" class="form-select form-select-sm">
	            <option value="전체">(전체)</option>
	            <option value="A">생활관A동</option>
	            <option value="B">생활관B동</option>
	            <option value="C">생활관C동</option>
	            <option value="D">생활관D동</option>
	            <option value="E">생활관E동</option>
	            <option value="F">생활관F동</option>
	          </select>
	        </div>
	      </div>
	      <div class="row my-1">
	        <div class="col-2 title">학년</div>
	        <div class="col">
	          <select onchange="refreshPaymentList()" name="stud_grade" class="form-select form-select-sm">
	            <option value="0">(전체)</option>
	            <option value="1">1학년</option>
	            <option value="2">2학년</option>
	            <option value="3">3학년</option>
	            <option value="4">4학년</option>
	          </select>
	        </div>
	      </div>
	      <div class="row my-1">
	        <div class="col-2 title">이름</div>
	        <div class="col">
	          <input class="form-control form-control-sm" type="text" name="stud_name">
	        </div>
	      </div>
	      <div class="row my-1">
	        <div class="col-2 title">납부상태</div>
	        <div class="col mt-1">
	         	  <input checked type="radio" name="paymentStatus" value="전체" onchange="refreshPaymentList()"> 전체
			      <input type="radio" name="paymentStatus" value="미납" onchange="refreshPaymentList()"> 미납
			      <input type="radio" name="paymentStatus" value="완료" onchange="refreshPaymentList()"> 완료
	        </div>
	      </div>
	    </div>
	    <div class="col mx-1">
	    	<div class="row">
	    		<div class="col stats">
	    			<div class="stats-title">납부예상금액</div>
	    			<div class="money fs-4 fw-bold my-2" id="totalAmt">0</div>
	    		</div>
	    		<div class="col stats">
	    			<div class="stats-title">납부완료금액</div>
	    			<div class="money fs-4 fw-bold my-2" id="totalPaidAmt">0</div>
	    		</div>
	    		<div class="col stats">
	    			<div class="stats-title">미납금액</div>
	    			<div class="money fs-4 fw-bold my-2" id="totalUnpaidAmt">0</div>
	    		</div>
	    	</div>
	    	<div class="row my-2">
	    		<div class="col px-2">
	    			<div class="progress">
   					 <div id="paymentProgress" class="progress-bar progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100"></div>
 				    </div>
	    		</div>
	    	</div>
	    </div>
	  </div>
	  
		  <div class="row m-1 mt-4">
		    <div class="col">
		      <div class="table-wrapper" style="height:41rem;overflow:auto;">
		        <table class="table table-bordered table-sm">
		          <thead class="sticky-top">
		            <tr>
		              <th><input class="form-check-input" type="checkbox"></th>
		              <th>납부번호</th>
		              <th>입사신청번호</th>
		              <th>입사단위</th>
		              <th>학번</th>
		              <th>이름</th>
		              <th>배정호관</th>
		              <th>배정호실</th>
		              <th>고지금액</th>
		              <th>납부현황</th>
		              <th>납부일자</th>
		            </tr>
		          </thead>
		          <tbody id="paymentListBody">
		            <!-- paymentListBody -->
		          </tbody>
		        </table>
		      </div>
		    </div>
		  </div>
   
   	</div>
   	</div>
   
   </div><!-- page content end -->




<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>