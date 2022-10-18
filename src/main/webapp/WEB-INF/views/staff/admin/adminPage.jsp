<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생활관담당자관리</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>

<style type="text/css">
	
	.page-content {
		font-size:0.8rem;
	}
	
	.shadow {
		box-shadow: 0 .125rem .25rem rgba(0,0,0,.20)!important;
	}
	
	.page-content .btn {
	  border-color: #6C758A;
	  color: #495057;
	  font-size: 0.8rem;
	  background-color: #f1f1f1;
	  padding: 0.2rem 0.7rem;
	}
	  
	.table-wrapper {
		height : 250px;
		overflow-y : auto;
		background-color : white;
		border-radius : 0.375rem;
		overflow : hidden;
	}
	
	/* .table {
		margin-bottom:0;
		margin-left:auto; 
    	margin-right:auto;
		width: 1450px; 
		height: 200px;
	} */
	 
	.table thead {
		text-align: center;
		background-color: #fdefc3;
		vertical-align: middle;
	}
	
	
	.title {
		align-self: center;
	    text-align: end;
	    padding-right: 0;
	}
		
		
	  
	.tab-content {
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
	
	.nav-tabs .nav-link {
		color: #495057;
		background-color:#efefef;
	}


</style>

<script type="text/javascript">

function adminInsert() {
	
	var adminListBox = document.getElementById("adminList")
	adminListBox.innterHTML = "";
	
	var trBox = document.createElement("tr");
	trBox.id = 'adminSaveForm';
	adminListBox.appendChild(trBox);
	
	var tdcheck = document.createElement("td")
	var tdcheckBox = document.createElement('input');
	tdcheckBox.type= 'checkbox';
	//td1input.name = 'admin_no';
	tdcheck.appendChild(tdcheckBox);
	
	trBox.appendChild(tdcheck);
	
	var td1 = document.createElement("td")
	var td1input = document.createElement('input');
	td1input.type= 'text';
	td1input.name = 'admin_no';
	td1.appendChild(td1input);

	trBox.appendChild(td1);
	
	var td2 = document.createElement("td")
	var td2input = document.createElement("input");
	td2input.type = "text";
	td2input.name = 'pstn_div_no';
	td2.appendChild(td2input);
	
	trBox.appendChild(td2);
	
	var td3 = document.createElement("td")
	var td3input = document.createElement("input");
	td3input.type = "text";
	td3input.name = 'staff_id';
	td3.appendChild(td3input);
	
	trBox.appendChild(td3);
	
	var td4 = document.createElement("td")
	var td4input = document.createElement("input");
	td4input.type = "text";
	td4input.name = "staff_name";
	td4.appendChild(td4input);
	
	trBox.appendChild(td4);
	
	var td5 = document.createElement("td")
	var td5input = document.createElement("input")
	td5input.type = "text";
	td5input.name = 'bldg_cd';
	td5.appendChild(td5input);
	
	trBox.appendChild(td5);

}

function adminDelete(){
	const query = 'input[id="chk"]:checked';
    const selectedEls = document.querySelectorAll(query);
    
    // 선택된 목록에서 value 찾기
    let result = '';
    selectedEls.forEach((el) => {
      result += el.value + ' ';
    });
    
     let arr = result.split(' ');
     alert(arr);	
	
     location.href="./adminPage"
     
	var xhr = new XMLHttpRequest(); 

	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200){
			var result = JSON.parse(xhr.responseText);

		}
	}
	
	xhr.open("post", "./deleteByAdminNo"); //리퀘스트 세팅
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //post
	xhr.send("adminNo="+arr); //AJAX 리퀘스트
}

function adminSave(){
	
	var obj = {};
	var data = document.querySelectorAll('#adminSaveForm td input');
	
	data.forEach(e => {
		obj[e.name] = e.value;
	})
	
	var frm = JSON.stringify(obj); 
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			
			location.href = "../admin/adminPage";
		}
	}
	xhr.open("post", "../admin/adminSaveProcess");
	xhr.setRequestHeader("Content-type", "application/json;");
	xhr.send(frm);

}

function showPopup() {
	   window.open("./facultyPage", "a", "width=1000, height=650, left=200, top=0");
	}

window.call = function (staffData){
		
	var paramList = JSON.stringify(staffData);

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				console.log(jsonObj);
				
				for(e of jsonObj){
					
					var adminListBox = document.getElementById("adminList")
					
					var trBox = document.createElement("tr");
					trBox.id = 'adminSaveForm';
					adminListBox.appendChild(trBox);
					
					var tdcheck = document.createElement("td")
					var tdcheckBox = document.createElement('input');
					tdcheckBox.type= 'checkbox';
					//td1input.name = 'admin_no';
					tdcheck.appendChild(tdcheckBox);
					
					trBox.appendChild(tdcheck);
					
					var td1 = document.createElement("td")
					var td1input = document.createElement('input');
					td1input.type= 'text';
					td1input.name = 'admin_no';
					//td1.appendChild(td1input);

					trBox.appendChild(td1);
					
					var td2 = document.createElement("td")
					var td2input = document.createElement("input");
					td2input.type = "text";
					td2input.name = 'pstn_div_no';
					td2input.value = e.staffInfo.PSTN_DIV_NO;
					td2.appendChild(td2input);
					
					trBox.appendChild(td2);
					
					var td6 = document.createElement("td")
					var td6input = document.createElement("input");
					td6input.type = "text";
					td6input.value = e.staffInfo.PSTN_DIV_NAME;
					td6.appendChild(td6input);
					
					trBox.appendChild(td6);
					
					var td3 = document.createElement("td")
					var td3input = document.createElement("input");
					td3input.type = "text";
					td3input.name = 'staff_id';
					td3input.value = e.staffInfo.STAFF_ID;
					td3.appendChild(td3input);
					
					trBox.appendChild(td3);
					
					var td4 = document.createElement("td")
					var td4input = document.createElement("input");
					td4input.type = "text";
					td4input.name = "staff_name";
					td4input.value = e.staffInfo.STAFF_NAME;
					td4.appendChild(td4input);
					
					trBox.appendChild(td4);
					
					var td5 = document.createElement("td")
					var td5input = document.createElement("input")
					td5input.type = "text";
					td5input.name = 'bldg_cd';
					td5.appendChild(td5input);
					
					trBox.appendChild(td5);
				}

				
			}
		}
		xhr.open("post", "./restGetStaffProcess");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramList);
}

</script>
</head>
<body>
<div class="container-fluid">

<jsp:include page="../../staff_common/staffSidebar.jsp"></jsp:include>


   <div class="page-content p-5" id="content">
      
      <div class="card" style="width:100%; height:50rem; border-radius:0.375rem;">
         <div class="dashboard-card-bottom" >
            
			<div style="text-align: right; margin: 0 auto; padding: 10px;">
				<button type="button" class="btn btn-primary" onclick="showPopup()">전직원 조회</button>
				<button type="button" class="btn btn-primary" onclick="adminInsert()">신규</button>
				<button type="button" class="btn btn-primary" onclick="adminDelete()">삭제</button>
				<button type="button" class="btn btn-primary" onclick="adminSave()">저장</button>	
			</div>

			<div class="">
			  <div class="row" style="padding: 10px;">							    
					  <div class="col"> 소속구분 &nbsp;<div class="btn-group">
					        <button class="btn dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
					        (전체)
					        </button>
					        <ul class="dropdown-menu">
					            <li><a class="dropdown-item" href="#">학교</a></li>
					            <li><a class="dropdown-item" href="#">교외</a></li>
					        </ul>
					    </div>
					  </div>
				    <div class="col"> 담당자 &nbsp;<input type="text">
				    </div>
				  </div>	
							  			
					<div class="row">
					<div class="col px-4">
						<table class="table table-striped table-bordered table-sm">
						  <thead>
						    <tr>
							<th scope="col"><input type = "checkbox" value=""></th>							    
						      <th scope="col">번호</th>
						      <th scope="col">*직책구분넘버</th>
						      <th scope="col">*직책</th>
						      <th scope="col">*개인번호</th>
						      <th scope="col">*담당자</th>
						      <th scope="col">*담당호관</th>
						    </tr>
						  </thead>
						  <tbody id="adminList">
						  <c:forEach items="${adminVo}" var="list">
						  	<tr class="text-center">	
						      <th scope="col"><input type="checkbox" id="chk" value="${list.ADMIN_NO}"></th>
						      <td >${list.ADMIN_NO }</td>
						      <td>${list.PSTN_DIV_NO }</td>
						      <td >${list.PSTN_DIV_NAME }</td>
						      <td >${list.STAFF_ID }</td>
						      <td >${list.STAFF_NAME }</td>
						      <td >${list.BLDG_CODE }</td>
						     </tr>
						  </c:forEach>
						   </tbody>
						</table>
					</div>
					</div>
					</div>
				</div>
			  </div>
         </div>
      </div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


