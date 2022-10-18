<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>생활관호실정보관리</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link href="../../resources/css/plan.css" rel="stylesheet" type="text/css">



  
<script type="text/javascript" defer>
	
	var currentBldgCode = 0;
	var currentFloorCode = 0;
	
	
	
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
	
	function refreshInfoAll(bldgCode){
		
		currentBldgCode = bldgCode;
		refreshBldgInfo(currentBldgCode);
		refreshFloorList(currentBldgCode);
		refreshRoomList(currentFloorCode);
	}
	
	
	
	function registerBldg(){
		currentBldgCode = document.getElementById('bldgCode').value;
		
		$.ajax({
			type : 'post',
			url : '../plan/restBuildingRegisterProcess',
			data : $("#regBldgForm").serialize(),
			//dataType : 'json',
			success : function(){
				refreshBldgList();
				refreshBldgInfo(currentBldgCode);
				getBldgSelect();
				},
			error: function(xhr, status, error){
				alert('error');
				}
		});
	
	}
	
	function registerFloor(){
		
		var obj = {};
		
		var data = document.querySelectorAll('#regFloorForm td input');
		
		data.forEach(e => {
			obj[e.name] = e.value;
		})
		
 		var frm = JSON.stringify(obj); 
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				
					refreshInfoAll(currentBldgCode);
			}
		}
		xhr.open("post", "../plan/restFloorRegisterProcess");
		xhr.setRequestHeader("Content-type", "application/json;");
		xhr.send(frm);
	
	}
	
	
	function registerRoom(){
		
		var data = document.querySelectorAll('#regRoomForm td input, #regRoomForm input, #regRoomForm td select');
		
		var obj = {};
		data.forEach(e => {
			obj[e.name] = e.value;
		})
		
 		var frm = JSON.stringify(obj); 
 		 
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);

				refreshBldgList();
				refreshRoomList(currentFloorCode);
				document.getElementById('roomBtn').setAttribute('onclick', 'updateAvailableRoom()');

			}
		}
		xhr.open("post", "../plan/restRoomRegisterProcess");
		xhr.setRequestHeader("Content-type", "application/json;");
		xhr.send(frm);
	
	}
	
	
	function getBldgSelect(){
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var bldgSelectBoxs = document.getElementsByClassName('bldgSelect');
				
				for(box of bldgSelectBoxs){
					box.innerHTML = '';
					
					for(e of jsonObj){
						var option = document.createElement('option');
						option.value = e.BLDG_CODE;
						option.name = 'bldg_code';
						option.innerText = e.BLDG_NAME;
						box.appendChild(option);
					}
				}
				
				
			}
			
		}
		xhr.open("post", "../plan/restBldgSelectList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send();
	}
	function refreshBldgInfo(bldgCode){
		 
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				document.getElementById('bldgCode').value = jsonObj.BLDG_CODE;
				document.getElementById('bldgName').value = jsonObj.BLDG_NAME;
				document.getElementById('bldgFloorCnt').value = jsonObj.BLDG_FLOOR_CNT;
				document.getElementById('bldgGenderDiv').value = jsonObj.BLDG_GENDER_DIV;
				document.getElementById('bldgPlottage').value = jsonObj.BLDG_PLOTTAGE;
				document.getElementById('bldgConstDate').value = dateFormat(jsonObj.BLDG_CONST_DATE);
				
				var bldgInfo = document.querySelectorAll('#regBldgForm div input, #regBldgForm div select');
				bldgInfo.forEach(e => {
					e.disabled = true;
				})
			}
			
		}
		xhr.open("post", "../plan/restBuldingInfo");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("bldgCode=" + bldgCode);
	 }
	 
	 
	 
	function refreshBldgList(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var totalRoomCnt = 0;
				var totalAvailableRoomCntM = 0;
				var totalAvailableRoomCntF = 0;
				var totalAvailableRoomCnt = 0;
				var totalAvailableStudentCntM = 0;
				var totalAvailableStudentCntF = 0;
				var totalAvailableStudentCnt = 0;
				
				
				var bldgListBody = document.getElementById('bldgListBody');
				bldgListBody.innerHTML = "";
				
				for(e of jsonObj){
					
					var bldgTr = bldgListBody.insertRow(-1);
					bldgTr.setAttribute('onclick', "refreshInfoAll('" + e.BLDG_CODE + "')");
					
					var td1 = bldgTr.insertCell(0); 
					var td1checkbox = document.createElement('input');
					td1checkbox.type = 'checkbox';
					td1checkbox.name = 'bldg_code';
					td1checkbox.value = e.BLDG_CODE;
					td1checkbox.classList.add('form-check-input');
					td1.appendChild(td1checkbox);
					
					var td2 = bldgTr.insertCell(1); 
					td2.innerText = e.BLDG_NAME;
					
					var td3 = bldgTr.insertCell(2); 
					td3.innerText = e.BLDG_GENDER_DIV;
					
					var td4 = bldgTr.insertCell(3); 
					td4.innerText = e.TOTAL_ROOM_CNT;
					
					var td5 = bldgTr.insertCell(4); 
					td5.innerText = e.A_ROOM_CNT_M;
					
					var td6 = bldgTr.insertCell(5); 
					td6.innerText = e.A_ROOM_CNT_F;
					
					var td7 = bldgTr.insertCell(6); 
					td7.innerText = e.A_ROOM_CNT;
					
					var td8 = bldgTr.insertCell(7); 
					if(isNaN(e.A_ROOM_CNT_M * e.ROOM_BED_CNT)){
						td8.innerText = 0;
					}else{
						td8.innerText = e.A_ROOM_CNT_M * e.ROOM_BED_CNT;
					}
					
					var td9 = bldgTr.insertCell(8); 
					if(isNaN(e.A_ROOM_CNT_F * e.ROOM_BED_CNT)){
						td9.innerText = 0;
					}else{
						td9.innerText = e.A_ROOM_CNT_F * e.ROOM_BED_CNT;
					}
					
					var td10 = bldgTr.insertCell(9); 
					if(isNaN((e.A_ROOM_CNT_M * e.ROOM_BED_CNT) + (e.A_ROOM_CNT_F * e.ROOM_BED_CNT))){
						td10.innerText = 0;
					}else{
						td10.innerText = (e.A_ROOM_CNT_M * e.ROOM_BED_CNT) + (e.A_ROOM_CNT_F * e.ROOM_BED_CNT) ;
					}
					
					totalRoomCnt += e.TOTAL_ROOM_CNT;
					totalAvailableRoomCntM += e.A_ROOM_CNT_M;
					totalAvailableRoomCntF += e.A_ROOM_CNT_F;
					totalAvailableRoomCnt += e.A_ROOM_CNT;
					
					totalAvailableStudentCntM += Number(td8.innerText);
					totalAvailableStudentCntF += Number(td9.innerText);
					totalAvailableStudentCnt += Number(td10.innerText);
					
				}
				
				var bldgListFoot = document.getElementById('bldgListFoot');
				bldgListFoot.innerHTML = "";
				
				var footTr = bldgListFoot.insertRow(-1);
				//footTr.style.backgroundColor = '#dee2e6'; 
				var footTd1 = document.createElement('td');
				footTd1.setAttribute('scope','col');
				footTd1.setAttribute('colspan','3');
				footTd1.innerText = '합계';
				
				var footTd2 = document.createElement('td');
				footTd2.innerText = totalRoomCnt;
				
				var footTd3 = document.createElement('td');
				footTd3.innerText = totalAvailableRoomCntM;
				
				var footTd4 = document.createElement('td');
				footTd4.innerText = totalAvailableRoomCntF;
				
				var footTd5 = document.createElement('td');
				footTd5.innerText = totalAvailableRoomCnt;
				
				var footTd6 = document.createElement('td');
				footTd6.innerText = totalAvailableStudentCntM;
				
				var footTd7 = document.createElement('td');
				footTd7.innerText = totalAvailableStudentCntF;
				
				var footTd8 = document.createElement('td');
				footTd8.innerText = totalAvailableStudentCnt;
				
				footTr.appendChild(footTd1);
				footTr.appendChild(footTd2);
				footTr.appendChild(footTd3);
				footTr.appendChild(footTd4);
				footTr.appendChild(footTd5);
				footTr.appendChild(footTd6);
				footTr.appendChild(footTd7);
				footTr.appendChild(footTd8);
				
				//document.querySelector('#bldgListBody tr').click();
				
			}
		 }
		xhr.open("post", "../plan/restBuildingSummaryList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send();
	 }
	
	
	function refreshFloorList(currentBldgCode){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var floorListBody = document.getElementById('floorListBody');
				floorListBody.innerHTML = "";
				
				var RoomFloorList = document.getElementById('roomFloorList');
				RoomFloorList.innerHTML = "";
				
				for(e of jsonObj){
					
					var floorTr = floorListBody.insertRow(-1);
					
					var td1 = floorTr.insertCell(0);
					var td1checkbox = document.createElement('input');
					td1checkbox.type = 'checkbox';
					td1checkbox.name = 'floor_code';
					td1checkbox.classList.add('form-check-input');
					td1checkbox.value = e.FLOOR_CODE;
					td1.appendChild(td1checkbox);
					
					var td2 = floorTr.insertCell(1);
					td2.innerText = e.FLOOR_CODE;
					
					var td3 = floorTr.insertCell(2);
					td3.innerText = e.FLOOR_NAME;
					
					var td4 = floorTr.insertCell(3);
					td4.innerText = e.FLOOR_DIV;
					
					var td5 = floorTr.insertCell(4);
					td5.innerText = e.FLOOR_GRADE_DIV;
					
					var td6 = floorTr.insertCell(5);
					td6.innerText = e.FLOOR_ROOM_CNT;
					
					var td7 = floorTr.insertCell(6);
					td7.innerText = e.A_ROOM_CNT_M;
					
					var td8 = floorTr.insertCell(7);
					td8.innerText = e.A_ROOM_CNT_F;
					
					var td9 = floorTr.insertCell(8);
					td9.innerText = e.A_ROOM_CNT;
					
					var td10 = floorTr.insertCell(9);
					if(isNaN(e.A_ROOM_CNT_M * e.ROOM_BED_CNT)){
						td10.innerText = 0;
					}else{
						td10.innerText = e.A_ROOM_CNT_M * e.ROOM_BED_CNT;
					}
					
					var td11 = floorTr.insertCell(10);
					if(isNaN(e.A_ROOM_CNT_F * e.ROOM_BED_CNT)){
						td11.innerText = 0;
					}else{
						td11.innerText = e.A_ROOM_CNT_F * e.ROOM_BED_CNT;
					}
					
					var td12 = floorTr.insertCell(11);
					if(isNaN((e.A_ROOM_CNT_M * e.ROOM_BED_CNT) + (e.A_ROOM_CNT_F * e.ROOM_BED_CNT))){
						td12.innerText = 0;
					}else{
						td12.innerText =  (e.A_ROOM_CNT_M * e.ROOM_BED_CNT) + (e.A_ROOM_CNT_F * e.ROOM_BED_CNT);
					}
			
					//호실정보>호관층정보 리스트
					var roomFloorTr = roomFloorList.insertRow(-1);
					roomFloorTr.setAttribute('onclick', "refreshRoomList('" + e.FLOOR_CODE + "')");

					var roomFloorTd1 = roomFloorTr.insertCell(0);
					roomFloorTd1.innerText = e.FLOOR_CODE;
					
					var roomFloorTd2 = roomFloorTr.insertCell(1);
					roomFloorTd2.innerText = e.FLOOR_NAME;
				}
				
				var roomFloorTr = roomFloorList.insertRow(-1);

				var roomFloorTd1 = roomFloorTr.insertCell(0);
				roomFloorTd1.innerHTML = '&nbsp';
				
				var roomFloorTd2 = roomFloorTr.insertCell(1);
				roomFloorTd2.innerHTML = '&nbsp';
				
				refreshRoomList(jsonObj[0].FLOOR_CODE);
			}
		 }
		xhr.open("post", "../plan/restFloorSummaryList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("bldgCode=" + currentBldgCode);
	 }
	
	
	
	function refreshRoomList(floorCode){
		
		currentFloorCode = floorCode;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var roomListBody = document.getElementById('roomListBody');
				roomListBody.innerHTML="";
				
				for(e of jsonObj){
					
					var roomTr = roomListBody.insertRow(-1);
					
					var td1 = roomTr.insertCell(0);
					var td1checkbox = document.createElement('input');
					td1checkbox.type = 'checkbox';
					td1checkbox.name = 'room_code';
					td1checkbox.classList.add('form-check-input');
					td1checkbox.value = e.ROOM_CODE;
					td1.appendChild(td1checkbox);
					
					var td2 = roomTr.insertCell(1);
					td2.innerText = e.ROOM_CODE;
					
					var td3 =roomTr.insertCell(2);
					td3.innerText = e.ROOM_NAME;
					
					var td4 = roomTr.insertCell(3);
					td4.innerText = e.ROOM_DIV;
					
					var td5 = roomTr.insertCell(4);
					td5.innerText = e.FLOOR_GRADE_DIV;
					
					var td6 = roomTr.insertCell(5);
					td6.innerText = e.BLDG_GENDER_DIV;
					
					var td7 = roomTr.insertCell(6);
					td7.innerText = e.ROOM_BED_CNT;
					
					var td8 = roomTr.insertCell(7);
					var td8checkbox = document.createElement('input');
					td8checkbox.type = 'checkbox';
					td8checkbox.name = 'room_use_yn';
					td8checkbox.classList.add('form-check-input');
					td8checkbox.value = e.ROOM_CODE;
					if(e.ROOM_USE_YN == 'Y'){
						td8checkbox.checked = true;
					}else{
						td8checkbox.checked = false;
					}
					td8.appendChild(td8checkbox);
					
				}
			}
		}
		xhr.open("post", "../plan/restRoomList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("floorCode=" + floorCode);
	 } 
	
	function showBldgInputForm(){
		var bldgInputs = document.querySelectorAll('#regBldgForm div input, #regBldgForm div select');
		bldgInputs.forEach(e => {
			e.value = "";
			e.disabled = false;
		})
	}
	
	function showFloorInputForm(){
		
		if(document.getElementById('regFloorForm')){
			return;
		}

		var floorListBody = document.getElementById('floorListBody');
		
		var floorInputTr = floorListBody.insertRow(0);
		floorInputTr.id = 'regFloorForm';
		
		floorListBody.appendChild(floorInputTr);
		
		var td1 = floorInputTr.insertCell(0);
		var td1checkbox = document.createElement('input');
		td1checkbox.type = 'checkbox';
		td1checkbox.name = 'bldg_code'
		td1checkbox.classList.add('form-check-input');
		td1checkbox.value = currentBldgCode;
		td1.appendChild(td1checkbox);
		
		var td2 = floorInputTr.insertCell(1);
		var td2Input = document.createElement('input');
		td2Input.type = 'text';
		td2Input.name = 'floor_code';
		td2.appendChild(td2Input);
		
		var td3 = floorInputTr.insertCell(2);
		var td3Input = document.createElement('input');
		td3Input.type = 'text';
		td3Input.name = 'floor_name';
		td3.appendChild(td3Input);
		
		var td4 = floorInputTr.insertCell(3);
		var td4Input = document.createElement('input');
		td4Input.type = 'text';
		td4Input.name = 'floor_div';
		td4.appendChild(td4Input);
		
		var td5 = floorInputTr.insertCell(4);
		var td5Input = document.createElement('input');
		td5Input.type = 'text';
		td5Input.name = 'floor_grade_div';
		td5.appendChild(td5Input);
		
		var td6 = floorInputTr.insertCell(5);
		var td7 = floorInputTr.insertCell(6);
		var td8 = floorInputTr.insertCell(7);
		var td9 = floorInputTr.insertCell(8);
		var td10 = floorInputTr.insertCell(9);
		var td11 = floorInputTr.insertCell(10);
		var td12 = floorInputTr.insertCell(11);
		
	}
	
	
	function showRoomInputForm(){
		
		if(document.getElementById('regRoomForm')){
			return;
		}
		
		var roomListBody = document.getElementById('roomListBody');

		var roomInputTr = document.createElement('tr');
		roomInputTr.id = 'regRoomForm';
		roomListBody.appendChild(roomInputTr);
		
		var td1 = roomInputTr.insertCell(0);
		var td1checkbox = document.createElement('input');
		td1checkbox.type = 'checkbox';
		td1checkbox.classList.add('form-check-input');
		//td1checkbox.value = currentFloorCode;
		//td1checkbox.name = 'floor_code';
		
		var hiddenValue = document.createElement('input');
		hiddenValue.type= "hidden";
		hiddenValue.value = currentFloorCode;
		hiddenValue.name = 'floor_code';
		roomInputTr.appendChild(hiddenValue);
		
		var td2 = roomInputTr.insertCell(1);
		var td2Input = document.createElement('input');
		td2Input.type = 'text';
		td2Input.name = 'room_code';
				
		var td3 = roomInputTr.insertCell(2);
		var td3Input = document.createElement('input');
		td3Input.type = 'text';
		td3Input.name = 'room_name';

		
		var td4 = roomInputTr.insertCell(3);
		var td4Select = document.createElement('select');
		td4Select.classList.add('form-select', 'form-select-sm');
		td4Select.name = 'room_div';
		
		
		var td4Option1 = document.createElement('option');
		td4Option1.innerText = '숙박';
		td4Option1.value = '숙박';

		var td4Option2 = document.createElement('option');
		td4Option2.innerText = '공용';
		td4Option2.value = '공용';

		td4Select.appendChild(td4Option1);
		td4Select.appendChild(td4Option2);

		
		var td5 = roomInputTr.insertCell(4);
		var td5Input = document.createElement('input');
		td5Input.type = 'number';
		td5Input.name = 'room_grade_div';
		
		//조건에따라 수정하기
		var td6 = roomInputTr.insertCell(5);
		td6.innerText = document.getElementById('bldgGenderDiv').value;
		
		var td7 = roomInputTr.insertCell(6);
		var td7Input = document.createElement('input');
		td7Input.type = 'number';
		td7Input.name = 'room_bed_cnt';
		
		
		var td8 = roomInputTr.insertCell(7);
		var td8checkbox = document.createElement('input');
		td8checkbox.type = 'checkbox';
		td8checkbox.name = 'room_use_yn';
		td8checkbox.classList.add('form-check-input');

		if(td8checkbox.checked){
			td8checkbox.value = 'Y';
		}else{
			td8checkbox.value = 'N';
		}
		
		td1.appendChild(td1checkbox);
		td2.appendChild(td2Input);
		td3.appendChild(td3Input);
		td4.appendChild(td4Select);
		td5.appendChild(td5Input);
		td7.appendChild(td7Input);
		td8.appendChild(td8checkbox);
		
		
		var roomFrm = document.querySelectorAll('#regRoomForm td input');
		roomFrm.forEach(e => {
			e.style.border = 'none';
		})
		
		document.getElementById('roomBtn').setAttribute('onclick', 'registerRoom()');
	}
	
	
	function deleteCheckedItems(target){
		
		var checkedList = [];
		
		var checkboxes = document.querySelectorAll("#" + target + " tr td input[type='checkbox']:checked");
		
		checkboxes.forEach(e => {
			var obj = {};
			obj['target'] = target;
			obj[e.name] = e.value;
			checkedList.push(obj);
		});
		
		console.log(checkedList);
		
		var paramList = JSON.stringify(checkedList);
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				
				refreshBldgList();
				getBldgSelect();
				currentBldgCode = document.querySelector('#bldgListBody tr td input[type=checkbox]').value;
				refreshInfoAll(currentBldgCode);
			}
		}
		xhr.open("post", "./restDeleteProcess");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramList);
	}
	
function deleteCheckedRooms(target){
		
		var checkedList = [];
		
		var checkboxes = document.querySelectorAll("#" + target + " tr td input[name='room_code']:checked");
		
		checkboxes.forEach(e => {
			var obj = {};
			obj['target'] = target;
			obj[e.name] = e.value;
			checkedList.push(obj);
		});
		
		console.log(checkedList);
		
		var paramList = JSON.stringify(checkedList);
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				refreshBldgList();
				refreshRoomList(currentFloorCode);
				refreshInfoAll()
			}
		}
		xhr.open("post", "./restDeleteProcess");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramList);
	}
	
		 
	function updateAvailableRoom(){
 		var updateList = [];
 		var checkboxes = document.querySelectorAll('#roomListBody tr td input[name="room_use_yn"]');
 		checkboxes.forEach(e => {
 			var obj = {};
 			obj['room_code'] = e.value;
 			if(e.checked){
	 			obj[e.name] = 'Y';
 			}else{
 				obj[e.name] = 'N';
 			}
 			updateList.push(obj);
 		})
 		
 		var paramList = JSON.stringify(updateList);
 		
 		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				refreshRoomList(currentFloorCode);
				refreshBldgList();
				
			}
		}
		xhr.open("post", "./restUpdateAvailableRoom");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramList);
 	}
	
	 window.addEventListener("DOMContentLoaded", function (){
		 refreshBldgList();
		 refreshInfoAll('A');
		 getBldgSelect();
		 
		});
		 
		 
</script>


</head>

<body>

<jsp:include page="../../staff_common/staffSidebar.jsp"></jsp:include>

   <div class="page-content p-3" id="content">
       	<div class="row">
    		<div class="col text-end my-3 mx-3">
    			<button class="btn" onclick="refreshBldgList()">전체조회</button>
    			<button class="btn" onclick="deleteCheckedItems('bldgListBody')">호관삭제</button>
    		</div>
   		</div>
   		
      
      	<!-- bldg table -->
      	<div class="table-wrapper shadow pb-0 mx-2">
      	<table class="table table-hover table-bordered table-sm table-striped text-center">
          <thead class="">
            <tr>
              <th scope="col" rowspan="2"><input class="form-check-input" type="checkbox"></th>
              <th scope="col" rowspan="2">호관명</th>
              <th scope="col" rowspan="2">건물구분</th>
              <th scope="col" rowspan="2">전체호실수</th>
              <th scope="col" colspan="3">수용가능호실수</th>
              <th scope="col" colspan="3">수용가능인원</th>
            </tr>
            <tr>
              <th scope="col">남자</th>
              <th scope="col">여자</th>
              <th scope="col">소계</th>
              <th scope="col">남자</th>
              <th scope="col">여자</th>
              <th scope="col">소계</th>
            </tr>
          </thead>
          <tbody id="bldgListBody">
          <!-- bldg list -->
          </tbody>
          <tfoot id="bldgListFoot" class="table-secondary">
          	<!-- bldg sum -->
          </tfoot>
        </table>
        </div>
        
		<!-- tab menu -->
	<ul class="nav nav-tabs mt-5 mx-2" id="myTab" role="tablist">
      <li class="nav-item" role="presentation">
        <button
          class="nav-link active"
          data-bs-toggle="tab"
          data-bs-target="#bldg"
          type="button"
          role="tab"
          aria-selected="true"
        >호관정보
        </button>
      </li>
      <li class="nav-item" role="presentation">
        <button
          class="nav-link"
          data-bs-toggle="tab"
          data-bs-target="#floor"
          type="button"
          role="tab"
          aria-selected="false"
        >호관층정보
        </button>
      </li>
      <li class="nav-item" role="presentation">
        <button
          class="nav-link"
          data-bs-toggle="tab"
          data-bs-target="#room"
          type="button"
          role="tab"
          aria-selected="false"
        >호실정보
        </button>
      </li>
    </ul>
    <div class="tab-content mx-2 p-3 pt-4" style="height:19rem;" id="myTabContent">
      <div class="tab-pane fade show active" id="bldg" role="tabpanel">
        <div class="row py-0">
          <div class="col text-end">
            <button class="btn" onclick="showBldgInputForm()">
              신규(호관)
            </button>
            <button class="btn" onclick="registerBldg()">
              저장
            </button>
          </div>
        </div>
        <div>
          <div class="row p-2">
            <div class="col">
              <form id="regBldgForm">
                <div class="row my-2">
                  <div class="col-1 title">생활관코드</div>
                  <div class="col">
                    <input
                      id="bldgCode"
                      name="bldg_code"
                      class="form-control form-control-sm"
                      type="text"
                    />
                  </div>
                  <div class="col-1 title">지상층수</div>
                  <div class="col">
                    <input
                      id="bldgFloorCnt"
                      name="bldg_floor_cnt"
                      class="form-control form-control-sm"
                      type="text"
                    />
                  </div>
                </div>
                <div class="row my-2">
                  <div class="col-1 title">생환관명</div>
                  <div class="col">
                    <input
                      id="bldgName"
                      name="bldg_name"
                      class="form-control form-control-sm"
                      type="text"
                    />
                  </div>
                  <div class="col-1 title">대지면적</div>
                  <div class="col">
                    <input
                      id="bldgPlottage"
                      name="bldg_plottage"
                      class="form-control form-control-sm"
                      type="text"
                    />
                  </div>
                </div>
                <div class="row my-2">
                  <div class="col-1 title">건물구분</div>
                  <div class="col">
                   	<select name="bldg_gender_div" id="bldgGenderDiv" class="form-select form-select-sm">
                   		<option value="남자">남자</option>
                   		<option value="여자">여자</option>
                  	 </select>
                  </div>
                  <div class="col-1 title">준공일자</div>
                  <div class="col">
                    <input
                      id="bldgConstDate"
                      name="bldg_const_date"
                      class="form-control form-control-sm"
                      type="date"
                    />
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="tab-pane fade" id="floor" role="tabpanel">
        <div class="row py-3">
          <div class="col-3">
          	<select onchange="refreshInfoAll(this.value)" class="bldgSelect form-select form-select-sm">
          		<option>aa</option>
          	</select>
          </div>
          <div class="col text-end">
            <button class="btn" onclick="showFloorInputForm()">
              신규(층)
            </button>
            <button class="btn" onclick="registerFloor()">
              저장
            </button>
            <button
              class="btn"
              onclick="deleteCheckedItems('floorListBody')">
              삭제
            </button>
          </div>
        </div>
        <div class="table-wrapper shadow">
          <table class="table table-hover table-bordered table-sm table-striped text-center">
            <thead >
              <tr>
                <th scope="col" rowspan="2"><input class="form-check-input" type="checkbox" /></th>
                <th scope="col" rowspan="2">*호관층</th>
                <th scope="col" rowspan="2">*호관층명</th>
                <th scope="col" rowspan="2">*층구분</th>
                <th scope="col" rowspan="2">*학년</th>
                <th scope="col" rowspan="2">층호실수</th>
                <th scope="col" colspan="3">수용가능호실수</th>
                <th scope="col" colspan="3">수용가능인원</th>
              </tr>
              <tr>
                <th scope="col">남자</th>
                <th scope="col">여자</th>
                <th scope="col">소계</th>
                <th scope="col">남자</th>
                <th scope="col">여자</th>
                <th scope="col">소계</th>
              </tr>
            </thead>
            <tbody id="floorListBody">
              <!-- floor list body -->
            </tbody>
          </table>
        </div>
      </div>
      <div class="tab-pane fade" id="room" role="tabpanel">
        <div class="row">
          <div class="col-3">
            <div class="row">
              <div class="col">
                <select onchange="refreshInfoAll(this.value)" class="bldgSelect form-select form-select-sm my-3">
                  <option value="A">A관</option>
                  <option value="B">B관</option>
                  <option value="C">C관</option>
                  <option value="D">D관</option>
                  <option value="E">E관</option>
                  <option value="F">F관</option>
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="table-wrapper shadow">
                  <table class="table table-hover table-bordered table-sm table-striped text-center">
                    <thead>
                      <tr>
                        <th>호관층코드</th>
                        <th>호관층명</th>
                      </tr>
                    </thead>
                    <tbody id="roomFloorList">
                      <!-- room floor list -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
          <div class="col">
            <div class="row py-3">
              <div class="col text-end">
                <button class="btn" onclick="showRoomInputForm()">
                  신규(호실)
                </button>
                <button class="btn" id="roomBtn" onclick="updateAvailableRoom()">
                  저장
                </button>
                <button class="btn" onclick="deleteCheckedRooms('roomListBody')">
                  삭제
                </button>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="table-wrapper shadow">
                  <table class="table table-hover table-bordered table-sm table-striped text-center">
                    <thead>
                      <tr>
                        <th><input class="form-check-input" type="checkbox" /></th>
                        <th>*호실코드</th>
                        <th>*호실명</th>
                        <th>*용도구분</th>
                        <th>학년</th>
                        <th>성별</th>
                        <th>수용인원</th>
                        <th>사용여부</th>
                      </tr>
                    </thead>
                    <tbody id="roomListBody">
                      <!-- room list -->
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	   

   </div><!-- page-content end -->








      

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>