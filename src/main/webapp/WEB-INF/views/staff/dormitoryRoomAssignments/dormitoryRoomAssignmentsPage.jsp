<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호실배정관리</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script
  src="https://code.jquery.com/jquery-3.6.1.js"
  integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
  crossorigin="anonymous"></script>
  
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css">

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');
</style>
<style type="text/css">
	main{
  		font-family: 'Noto Sans KR', sans-serif;
 		font-weight: bold;
  		background-color:#f8f9fa;
		
		font-size:0.7rem;
	}
	
	.cloudTag{
		margin:2vh;
		border: 0;
		border-radius: 20px 20px 20px 20px;
		padding: 17px;
 		background-color: white;
/* 		background-color:#EBF7FF; */
		box-shadow: 0 .125rem .25rem rgba(0,0,0,.20);
	}
	table{
		border-collapse:collapse;
	}
	th{
		border-collapse:collapse;
		border-left: .05rem solid #dedede;
		text-align: center;
	}
	tr th:first-child{
		border-collapse:collapse;
		border-left:0;
		text-align: center;
	}
	td{
		border-collapse:collapse;
		border-right: .05rem solid #dedede;
	}
	tr td:first-child{
		border-collapse:collapse;
		border-left:0;
		text-align: center;
	}
	#assignedRoomListTBody td{
		border-collapse:collapse;
		border-right: 0;
		border-left: .05rem solid #dedede
	}
	#assignedRoomListTBody td:first-child{
		border-collapse:collapse;
		border-left:0;
		text-align: center;
	}
	.dataTr:hover>td{
		--bs-table-bg: #ccd3e0;
		--bs-table-striped-bg: 0,0,0,1;
	}
	#clickedTr:hover>td{
		--bs-table-bg: #85a2d4;
		--bs-table-striped-bg: 0,0,0,1;
	}
	#clickedRoomTr:hover>td{
		--bs-table-bg: #85a2d4;
		--bs-table-striped-bg: 0,0,0,1;
	}
	#clickedTr{
		--bs-table-bg: #85a2d4;
		--bs-table-striped-bg: 0,0,0,1;
	}
	#clickedRoomTr{
		--bs-table-bg: #85a2d4;
		--bs-table-striped-bg: 0,0,0,1;
	}
	.tableCol{
		position: relative;
		height: 50vh;
		overflow-y: auto;
		margin-left: calc(var(--bs-gutter-x) * .5);
 		padding-Left: 0; 
		padding-Right: 0;
		border: 1px solid rgb(222,226,230);
	}
	.loadingImgTag{
		z-index:1;
		width:100%;
		height:100%;
		position: absolute;
		background-repeat: no-repeat;
		background-position: center;
	}
	
	.admission{
		width:100%;
		padding:0;
		padding-bottom:0.4vh;
		font-weight: bold;
		border:0;
		--bs-btn-bg: #b0dea0;
		--bs-btn-color:#3e5942;
		--bs-btn-hover-color: #fff;
		--bs-btn-hover-bg: #59c968
	}
	.moveOut{
		width:100%;
		padding:0;
		padding-bottom:0.4vh;
		font-weight: bold;
		border:0;
		--bs-btn-bg: #e3a6a6;
		--bs-btn-color:#3e5942;
		--bs-btn-hover-color: #fff;
		--bs-btn-hover-bg: #c95959
	}
	#assignInputCol input{
		padding: 0;
		font-size:0.7rem;
		height:2vh;
		display: inline-block;
		text-align: center
	}
	#applInputCol input{
		padding: 0;
		font-size:0.7rem;
		height:2vh;
		display: inline-block;
		text-align: center
	}
	
	.form-control{
		display:inline-block;
		width: 10vw;
		height:2.3vh;
		font-size: 0.7rem
	}
	.form-control:focus{
 		-webkit-box-shadow: 0 0 5px rgba(0,0,0,.075), 0 0 5px rgba(102, 175, 233, .6) !important;
 		box-shadow: 0 0 5px rgba(0,0,0,.075), 0 0 5px rgba(102, 175, 233, .6) !important;
	}
	
	input[readonly=readonly]:focus{
		-webkit-box-shadow: 0 0 5px rgba(0,0,0,.075), 0 0 5px rgb(220, 220, 220) !important;
 		box-shadow: 0 0 5px rgba(0,0,0,.075), 0 0 5px rgb(220, 220, 220) !important;
 		border: 1px solid rgb(200,200,200) !important;
	}
	input[readonly=readonly]{
		display:inline-block;
		width: 10vw;
		height:2.3vh;
		font-size: 0.7rem
	}
	
</style>



<script type="text/javascript">
var ENT_NO;

var nowClickedRoomCodeFromRoomData=-1;
var nowClickedStudIdFromAssignedData=-1;
var nowClickedApplNoFromApplData=-1;
var nowClickedStudIdFromApplData=-1;

function getEntInfoList() {
	var entInfoSelectTag=document.getElementById('entInfoSelectTag');

	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);
			
			for(entInfo of jsonObj){
				var option = document.createElement('option');
				option.innerText = entInfo.ENT_NAME;
				option.value=entInfo.ENT_NO;
				entInfoSelectTag.appendChild(option);
			}
		}
	};	

	xhr.open("post","./getEntInfoList",false);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
}

function getBuildingCodeList() {
	var buildingCodeSelectTag=document.getElementById('buildingCodeSelectTag');
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);
			
			for(building of jsonObj){
				var option = document.createElement('option');
				option.innerText = building.BLDG_NAME;
				option.value=building.BLDG_CODE;
				buildingCodeSelectTag.appendChild(option);
			}
		}
	};	

	xhr.open("post","./getBuildingCodeList",false);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
}


function getRoomList(ENT_NO) {
	var roomListTBody = document.getElementById('roomListTBody');
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			document.getElementById('roomListTBody').style.display='';
			document.getElementById('roomLoadingImgTag').style.display='none';
			document.getElementById('roomLoadingImgTag').style.backgroundImage='';
			roomListTBody.innerHTML='';
			
			var jsonObj = JSON.parse(xhr.responseText);
			
			for(roomData of jsonObj){
				var tr = document.createElement('tr');
				tr.classList.add('roomDataTr');
				tr.classList.add('dataTr');
				tr.setAttribute('onclick','clickedRoomData(this)');
				if(roomData.FLOOR_GRADE_DIV==1){
					tr.style.backgroundColor="rgb(255, 255, 255)";
				}
				if(roomData.FLOOR_GRADE_DIV==2){
// 					tr.style.backgroundColor="rgb(247, 247, 247)";
					tr.style.backgroundColor="rgb(240, 240, 240)";
				}
				if(roomData.FLOOR_GRADE_DIV==3){
// 					tr.style.backgroundColor="rgb(239, 239, 239)";
					tr.style.backgroundColor="rgb(255, 255, 255)";
				}
				if(roomData.FLOOR_GRADE_DIV==4){
// 					tr.style.backgroundColor="rgb(231, 231, 231)";
					tr.style.backgroundColor="rgb(240, 240, 240)";
				}
				var td = document.createElement('td');
				td.innerText = roomData.ROOM_CODE;
				td.style.display="none";
				td.classList.add('room_code');
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = roomData.ROOM_NAME;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = roomData.FLOOR_GRADE_DIV;
				td.classList.add('roomData_FLOOR_GRADE_DIV');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = roomData.BLDG_GENDER_DIV;
				td.classList.add('roomData_BLDG_GENDER_DIV');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = roomData.ROOM_BED_CNT;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = roomData.SLCT_CNT;
				td.classList.add('roomData_SLCT_CNT');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.classList.add('roomData_Remain_CNT');
				td.innerText = roomData.ROOM_BED_CNT-roomData.SLCT_CNT;
				td.style.textAlign='center';
				tr.appendChild(td);
				
				roomListTBody.appendChild(tr);

				$('.roomDataTr').on('click',function(){
					$('#clickedRoomTr').removeAttr('id');
					$(this).attr('id','clickedRoomTr');
				});
				
				//어차피 이 펑션 최초1회만 실행됨
				//처음 A101에 최초클릭효과. 이거 지우면클릭 안됨
				if(roomData.ROOM_CODE=='A101'){
					tr.click();
				}
			}
		}else{
			document.getElementById('roomListTBody').style.display='none';
			document.getElementById('roomLoadingImgTag').style.display='';
			document.getElementById('roomLoadingImgTag').style.backgroundImage='url("/dormitory/resources/img/loadingIMG.gif")';
		}
	};	
	xhr.open("post","./getRoomList");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("ENT_NO="+ENT_NO);
}

function getAssignedRoomList(ENT_NO,ROOM_CODE) {
	var assignedRoomListTBody = document.getElementById('assignedRoomListTBody');
	var nowRoomName = document.getElementById('nowRoomName');
	var nowRoomGrade = document.getElementById('nowRoomGrade');
	var nowRoomBedCount = document.getElementById('nowRoomBedCount');
	var nowRoomGender = document.getElementById('nowRoomGender');
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			document.getElementById('assignedRoomListTBody').style.display='';
			document.getElementById('assignedLoadingImgTag').style.display='none';
			document.getElementById('assignedLoadingImgTag').style.backgroundImage='';
			assignedRoomListTBody.innerHTML='';
			
			var jsonObj = JSON.parse(xhr.responseText);
			nowRoomName.setAttribute('value',jsonObj.roomData.ROOM_NAME);
			nowRoomGrade.setAttribute('value',jsonObj.roomData.FLOOR_GRADE_DIV+'학년');
			nowRoomBedCount.setAttribute('value',jsonObj.roomData.ROOM_BED_CNT);
			nowRoomGender.setAttribute('value',jsonObj.roomData.BLDG_GENDER_DIV);
			
			for(assignedRoomData of jsonObj.assignedRoomList){
				var tr = document.createElement('tr');
				tr.classList.add('assignDataTr');
				tr.classList.add('dataTr');
				tr.setAttribute('onclick','clickedAssignedRoomData(this)');
				var stud_idTd = document.createElement('td');
				stud_idTd.innerText = assignedRoomData.STUD_ID;
				stud_idTd.style.textAlign='center';
				stud_idTd.classList.add('stud_id');
				tr.appendChild(stud_idTd);
				var td = document.createElement('td');
				td.innerText = assignedRoomData.STUD_GRADE;
				td.classList.add('assignedRoomData_STUD_GRADE');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = assignedRoomData.STUD_NAME;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = assignedRoomData.STUD_GENDER;
				td.classList.add('assignedRoomData_STUD_GENDER');
				td.style.textAlign='center';
				tr.appendChild(td);
				
				assignedRoomListTBody.appendChild(tr);

				$('.assignDataTr').on('click',function(){
					$('#clickedTr').removeAttr('id');					
					$(this).attr('id','clickedTr');
				});
			}
		}else{
			document.getElementById('assignedRoomListTBody').style.display='none';
			document.getElementById('assignedLoadingImgTag').style.display='';
			document.getElementById('assignedLoadingImgTag').style.backgroundImage='url("/dormitory/resources/img/loadingIMG.gif")';
		}
	};
	xhr.open("post","./getAssignedRoomList");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("ENT_NO="+ENT_NO+"&ROOM_CODE="+ROOM_CODE);
}

function getApplList(ENT_NO) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			document.getElementById('applListTBody').style.display='';
			document.getElementById('applLoadingImgTag').style.display='none';
			document.getElementById('applLoadingImgTag').style.backgroundImage='';
			applListTBody.innerHTML='';
			var jsonObj = JSON.parse(xhr.responseText);
			
			for(applData of jsonObj){
				var tr = document.createElement('tr');
				tr.setAttribute('onclick','clickedApplData(this)');
				tr.classList.add('applDataTr');
				tr.classList.add('dataTr');
				var appl_noTd = document.createElement('td');
				appl_noTd.innerText=applData.APPL_NO;
				appl_noTd.classList.add('appl_no');
				appl_noTd.style.display='none';
				tr.appendChild(appl_noTd);
				var td = document.createElement('td');
				td.classList.add('stud_id');
				td.innerText = applData.STUD_ID;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_GRADE;
				td.classList.add('applData_STUD_GRADE');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_NAME;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_GENDER;
				td.classList.add('applData_STUD_GENDER');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				if(applData.APPL_CHOICE==null){
					td.innerText = '임의배정';
				}else{
					td.innerText = applData.APPL_CHOICE;
				}
				td.classList.add('applData_APPL_CHOICE');
				td.style.textAlign='center';
				tr.appendChild(td);

				applListTBody.appendChild(tr);
				
				$('.applDataTr').on('click',function(){
					$('#clickedTr').removeAttr('id');
					$(this).attr('id','clickedTr');
				});
			}
		}else{
			document.getElementById('applListTBody').style.display='none';
			document.getElementById('applLoadingImgTag').style.display='';
			document.getElementById('applLoadingImgTag').style.backgroundImage='url("/dormitory/resources/img/loadingIMG.gif")';
		}
	};	
	xhr.open("post","./getApplList");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("ENT_NO="+ENT_NO);
}

function getAssignedRoomList_sub(ENT_NO,ROOM_CODE,STUD_ID) {
	var assignedRoomListTBody = document.getElementById('assignedRoomListTBody');
	var nowRoomName = document.getElementById('nowRoomName');
	var nowRoomGrade = document.getElementById('nowRoomGrade');
	var nowRoomBedCount = document.getElementById('nowRoomBedCount');
	var nowRoomGender = document.getElementById('nowRoomGender');
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			document.getElementById('assignedRoomListTBody').style.display='';
			document.getElementById('assignedLoadingImgTag').style.display='none';
			document.getElementById('assignedLoadingImgTag').style.backgroundImage='';
			assignedRoomListTBody.innerHTML='';
			
			var jsonObj = JSON.parse(xhr.responseText);
			
			nowRoomName.innerText = jsonObj.roomData.ROOM_NAME;
			nowRoomGrade.innerText = jsonObj.roomData.FLOOR_GRADE_DIV;
			nowRoomBedCount.innerText = jsonObj.roomData.ROOM_BED_CNT;
			nowRoomGender.innerText = jsonObj.roomData.BLDG_GENDER_DIV;
			
			for(assignedRoomData of jsonObj.assignedRoomList){
				var tr = document.createElement('tr');
				tr.classList.add('assignDataTr');
				tr.classList.add('dataTr');
				tr.setAttribute('onclick','clickedAssignedRoomData(this)');
				var stud_idTd = document.createElement('td');
				stud_idTd.innerText = assignedRoomData.STUD_ID;
				stud_idTd.style.textAlign='center';
				stud_idTd.classList.add('stud_id');
				tr.appendChild(stud_idTd);
				var td = document.createElement('td');
				td.innerText = assignedRoomData.STUD_GRADE;
				td.classList.add('assignedRoomData_STUD_GRADE');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = assignedRoomData.STUD_NAME;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = assignedRoomData.STUD_GENDER;
				td.classList.add('assignedRoomData_STUD_GENDER');
				td.style.textAlign='center';
				tr.appendChild(td);
				
				if(assignedRoomData.STUD_ID==STUD_ID){
					$('#clickedTr').removeAttr('id');
					tr.setAttribute('id','clickedTr');			
				}
				
				assignedRoomListTBody.appendChild(tr);
				
				$('.assignDataTr').on('click',function(){
					$('#clickedTr').removeAttr('id');					
					$(this).attr('id','clickedTr');
				});
			}
			
		}else{
			document.getElementById('assignedRoomListTBody').style.display='none';
			document.getElementById('assignedLoadingImgTag').style.display='';
			document.getElementById('assignedLoadingImgTag').style.backgroundImage='url("/dormitory/resources/img/loadingIMG.gif")';
		}
	};
	xhr.open("post","./getAssignedRoomList",false);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("ENT_NO="+ENT_NO+"&ROOM_CODE="+ROOM_CODE);
}

function getApplList_sub(ENT_NO,STUD_ID) {
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			document.getElementById('applListTBody').style.display='';
			document.getElementById('applLoadingImgTag').style.display='none';
			document.getElementById('applLoadingImgTag').style.backgroundImage='';
			applListTBody.innerHTML='';
			var jsonObj = JSON.parse(xhr.responseText);
			
			for(applData of jsonObj){
				var tr = document.createElement('tr');
				tr.setAttribute('onclick','clickedApplData(this)');
				tr.classList.add('applDataTr');
				tr.classList.add('dataTr');
				var appl_noTd = document.createElement('td');
				appl_noTd.innerText=applData.APPL_NO;
				appl_noTd.classList.add('appl_no');
				appl_noTd.style.display='none';
				tr.appendChild(appl_noTd);
				var td = document.createElement('td');
				td.classList.add('stud_id');
				td.innerText = applData.STUD_ID;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_GRADE;
				td.classList.add('applData_STUD_GRADE');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_NAME;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_GENDER;
				td.classList.add('applData_STUD_GENDER');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				if(applData.APPL_CHOICE==null){
					td.innerText = '임의배정';
				}else{
					td.innerText = applData.APPL_CHOICE;
				}
				td.classList.add('applData_APPL_CHOICE');
				td.style.textAlign='center';
				tr.appendChild(td);

				
				if(applData.STUD_ID==STUD_ID){
					$('#clickedTr').removeAttr('id');
					tr.setAttribute('id','clickedTr');
					tr.click();
				}
				
				applListTBody.appendChild(tr);
				
				$('.applDataTr').on('click',function(){
					$('#clickedTr').removeAttr('id');
					$(this).attr('id','clickedTr');
				});
			}
			
			document.getElementById('clickedRoomTr').click();
			
			var applTableCol = document.getElementById('applTableCol');
			var clickedTr = document.getElementById('clickedTr');
			
// 			console.log(clickedTr.offsetTop-clickedTr.offsetHeight);

			applTableCol.scrollTo(0,clickedTr.offsetTop-clickedTr.offsetHeight);
		}else{
			document.getElementById('applListTBody').style.display='none';
			document.getElementById('applLoadingImgTag').style.display='';
			document.getElementById('applLoadingImgTag').style.backgroundImage='url("/dormitory/resources/img/loadingIMG.gif")';
		}
	};	
	xhr.open("post","./getApplList");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("ENT_NO="+ENT_NO);
}

function admission() {
	var ROOM_CODE_From_RoomData = nowClickedRoomCodeFromRoomData;
	var APPL_NO_From_ApplData = nowClickedApplNoFromApplData;
	var STUD_ID_From_ApplData = nowClickedStudIdFromApplData;
		
	if(ROOM_CODE_From_RoomData==-1){
		swal("","기숙사호실목록에서\n입실할 호실을 선택해주세요.", "warning");
		return;
	}else if(APPL_NO_From_ApplData==-1){
		swal("","미배정학생 목록에서\n입실처리할 학생을 선택해주세요.", "warning");
		return;
	}else {
		var clickedRoomTr = document.getElementById('clickedRoomTr');
		var clickedApplTr = document.getElementById('clickedTr');
		
		var clickedRoomFLOOR_GRADE_DIV = clickedRoomTr.getElementsByClassName('roomData_FLOOR_GRADE_DIV')[0].innerText;
		var clickedRoomBLDG_GENDER_DIV = clickedRoomTr.getElementsByClassName('roomData_BLDG_GENDER_DIV')[0].innerText;
		var clickedRoomBLDG_Remain_CNT = clickedRoomTr.getElementsByClassName('roomData_Remain_CNT')[0].innerText;
		var clickedApplSTUD_GRADE = clickedApplTr.getElementsByClassName('applData_STUD_GRADE')[0].innerText;
		var clickedApplSTUD_GENDER = clickedApplTr.getElementsByClassName('applData_STUD_GENDER')[0].innerText;
		
// 		console.log("방 학년 : "+clickedRoomFLOOR_GRADE_DIV);
// 		console.log("방 성별 : "+clickedRoomBLDG_GENDER_DIV);
// 		console.log("학생 학년 : "+clickedApplSTUD_GRADE);
// 		console.log("학생 성별 : "+clickedApplSTUD_GENDER);

		if(clickedRoomFLOOR_GRADE_DIV != clickedApplSTUD_GRADE){
			swal("","해당 호실의 학년에 맞지 않는 학생입니다.", "warning");
			return;
		}else if(clickedRoomBLDG_GENDER_DIV != clickedApplSTUD_GENDER){
			swal("","해당 호실의 성별에 맞지 않는 학생입니다.", "warning");
			return;
		}else if(clickedRoomBLDG_Remain_CNT == 0){
			swal("","해당 호실의 정원을 초과했습니다.", "warning");
			return;
		}

		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState  == 4 && xhr.status == 200){				
 				//var jsonObj = JSON.parse(xhr.responseText);
				
 				swal("","입실처리 완료", "success");
 				
				//기숙사 호실목록에 배정인원이랑 남은수용인원이 바껴야됨
				var roomDataTrClasses = document.getElementsByClassName('roomDataTr');
				for( roomDataTr of roomDataTrClasses ){
					if(roomDataTr.getElementsByClassName('room_code')[0].innerText == ROOM_CODE_From_RoomData){
						
// 						console.log(roomDataTr.getElementsByClassName('roomData_SLCT_CNT')[0].innerText);
// 						console.log(Number(roomDataTr.getElementsByClassName('roomData_SLCT_CNT')[0].innerText)+1);
// 						console.log(roomDataTr.getElementsByClassName('roomData_Remain_CNT')[0].innerText);
// 						console.log(Number(roomDataTr.getElementsByClassName('roomData_Remain_CNT')[0].innerText)-1);
						
						roomDataTr.getElementsByClassName('roomData_SLCT_CNT')[0].innerText = Number(roomDataTr.getElementsByClassName('roomData_SLCT_CNT')[0].innerText)+1;
						roomDataTr.getElementsByClassName('roomData_Remain_CNT')[0].innerText = Number(roomDataTr.getElementsByClassName('roomData_Remain_CNT')[0].innerText)-1;
						break;
					}
				}

				//미배정학생목록에 선택한학생 tr제거됨. 
				var applDataTrClasses = document.getElementsByClassName('applDataTr');
				for( applDataTr of applDataTrClasses ){
					if(applDataTr.getElementsByClassName('appl_no')[0].innerText == APPL_NO_From_ApplData){
						applDataTr.remove();
						nowClickedApplNoFromApplData=-1;
						nowClickedStudIdFromApplData=-1;
						break;
					}
				}
				//입실학생목록이 바뀌고 입실된 학생이 클릭되어야함
				getAssignedRoomList_sub(ENT_NO,nowClickedRoomCodeFromRoomData,STUD_ID_From_ApplData);
				var assignDataTrClasses = document.getElementsByClassName('assignDataTr');
				for( assignDataTr of assignDataTrClasses ){
					if(assignDataTr.getElementsByClassName('stud_id')[0].innerText==STUD_ID_From_ApplData){
						assignDataTr.click();
						break;
					}
				}
							
			}
		};
		xhr.open("post","./assignRoomProcess");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("ROOM_CODE="+ROOM_CODE_From_RoomData+"&APPL_NO="+APPL_NO_From_ApplData);
	}
		
}

function moveOut() {	
	var STUD_ID_From_AssignedData = nowClickedStudIdFromAssignedData;
	
// 	var ENT_NO;
// 	var nowClickedRoomCodeFromRoomData=-1;
// 	var nowClickedStudIdFromAssignedData=-1;
// 	var nowClickedApplNoFromApplData=-1;
// 	var nowClickedStudIdFromApplData=-1;

	//예외처리
	if(nowClickedRoomCodeFromRoomData == -1){//퇴실할 호실 선택안하면 예외처리
		swal("","퇴실할 호실을 선택해주세요.", "warning");
		return;
	}else if(STUD_ID_From_AssignedData == -1){//퇴실할 학생 선택을 안하면 예외처리
		swal("","입실학생 목록에서\n퇴실처리할 학생을 선택해주세요.", "warning");
		return;
	}else{
		//퇴실프로세스
		//ENT_NO랑 STUD_ID만 있으면 DMT_APPL중에 특정해서 ROOM_CODE null로 업데이트할수있음.
		//특정한 APPL_NO 받아서 DMT_ENT_FEE_DTL(납부내역) 특정해서 지울수있음.
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState  == 4 && xhr.status == 200){
				var applData = JSON.parse(xhr.responseText);
				
				swal("","퇴실처리 완료", "success");
				
				//입실학생목록에서 퇴실한 학생Tr이 삭제되어야함.
				var assignDataTr_classes = document.getElementsByClassName('assignDataTr');
				
				for(assignDataTr of assignDataTr_classes){
					var assigned_stud_id = assignDataTr.getElementsByClassName('stud_id')[0].innerText;
					if(assigned_stud_id==STUD_ID_From_AssignedData){
						assignDataTr.remove();
						nowClickedStudIdFromAssignedData=-1;
						break;
					}
				}
				//기숙사호실 목록에 배정인원,남은수용인원이 변경되어야함
				var roomDataTrClasses = document.getElementsByClassName('roomDataTr');
				for( roomDataTr of roomDataTrClasses ){
					if(roomDataTr.getElementsByClassName('room_code')[0].innerText == nowClickedRoomCodeFromRoomData){						
						roomDataTr.getElementsByClassName('roomData_SLCT_CNT')[0].innerText = Number(roomDataTr.getElementsByClassName('roomData_SLCT_CNT')[0].innerText)-1;
						roomDataTr.getElementsByClassName('roomData_Remain_CNT')[0].innerText = Number(roomDataTr.getElementsByClassName('roomData_Remain_CNT')[0].innerText)+1;
						break;
					}
				}
				
				
				//미배정학생 목록에 해당 학생의 Tr이 생성되어야함.
				
				
				//리프레쉬할것인가 그냥 보이기만 할것인가
				//리프레쉬는 정확하지만 너무 느림.
				//getApplList_sub(ENT_NO,STUD_ID_From_AssignedData); 에이잭스로 전체 다시 불러오는건데 너무 느림
				//렌더링으로 보이기만하는건 빠른데 정렬을 못함.
				
				//두개를 짬뽕시키자
				//퇴실된 학생의 STUD_ID와 ENT_NO로 미배정학생중에 단 한명의 데이터만 가져옴.
				//몇번째 rownum인지 + 한줄 데이터의 필요한 칼럼값들을 가져와서
				//해당번째 Tr에 직접 렌더링하면 정렬도 챙기고 속도도 빠를듯
				
// 				console.log(applData.ROWN1);
// 				console.log(applData.APPL_NO);
// 				console.log(applData.STUD_ID);
// 				console.log(applData.STUD_GRADE);
// 				console.log(applData.STUD_NAME);
// 				console.log(applData.STUD_GENDER);
// 				console.log(applData.APPL_CHOICE);
								
				var applListTBody = document.getElementById('applListTBody');				
				var tr = document.createElement('tr');
				
				
				var clickedRoomTr = document.getElementById('clickedRoomTr');
				var roomData_FLOOR_GRADE_DIV = clickedRoomTr.getElementsByClassName('roomData_FLOOR_GRADE_DIV')[0].innerText;
				var roomData_BLDG_GENDER_DIV = clickedRoomTr.getElementsByClassName('roomData_BLDG_GENDER_DIV')[0].innerText;
				
				if(applData.STUD_GRADE == roomData_FLOOR_GRADE_DIV && applData.STUD_GENDER == roomData_BLDG_GENDER_DIV ){
					tr.style.backgroundColor="#ebf5ee";
				}else{
					tr.style.backgroundColor="";
				}	
				tr.setAttribute('onclick','clickedApplData(this)');
				tr.classList.add('applDataTr');
				tr.classList.add('dataTr');
				var appl_noTd = document.createElement('td');
				appl_noTd.innerText=applData.APPL_NO;
				appl_noTd.classList.add('appl_no');
				appl_noTd.style.display='none';
				tr.appendChild(appl_noTd);
				var td = document.createElement('td');
				td.classList.add('stud_id');
				td.innerText = applData.STUD_ID;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_GRADE;
				td.classList.add('applData_STUD_GRADE');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_NAME;
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				td.innerText = applData.STUD_GENDER;
				td.classList.add('applData_STUD_GENDER');
				td.style.textAlign='center';
				tr.appendChild(td);
				var td = document.createElement('td');
				if(applData.APPL_CHOICE==null){
					td.innerText = '임의배정';
				}else{
					if(applData.APPL_CHOICE==nowClickedRoomCodeFromRoomData.substr(0, 1)){
						td.style.color="#42e379";
						td.style.textShadow="0 0 3px #a6edbe";
					}else{
						td.style.color="";
						td.style.textShadow="";	
					}
					td.innerText = applData.APPL_CHOICE;
				}
				td.classList.add('applData_APPL_CHOICE');
				td.style.textAlign='center';
				tr.appendChild(td);

				
				if(applData.STUD_ID==applData.STUD_ID){
					$('#clickedTr').removeAttr('id');
					tr.setAttribute('id','clickedTr');
					tr.click();
				}
				
// 				applListTBody.appendChild(tr);
				if(applData.ROWN1==1){
					applListTBody.prepend(tr);
				}else{
					applListTBody.querySelector('tr:nth-of-type('+(Number(applData.ROWN1)-1)+')').after(tr);	
				}
						
				
				var applTableCol = document.getElementById('applTableCol');
				var clickedTr = document.getElementById('clickedTr');
				
// 				console.log(applTableCol.scrollBottom);
// 				console.log(applTableCol.scrollTop);
// 				console.log(clickedTr.offsetTop-clickedTr.offsetHeight);
				
				if(applTableCol.scrollTop>clickedTr.offsetTop-clickedTr.offsetHeight){
				//스크롤이 아래로 내려갔는데 클릭된 Tr이 더 높이있을때
					applTableCol.scrollTo(0,clickedTr.offsetTop-clickedTr.offsetHeight);
				}
				if(clickedTr.offsetTop-applTableCol.offsetHeight > applTableCol.scrollTop){
				//스크롤이 위로 올라갔는데 클릭된 Tr이 더 낮게있을때
					applTableCol.scrollTo(0,clickedTr.offsetTop-clickedTr.offsetHeight);
				}
				
				$('.applDataTr').on('click',function(){
					$('#clickedTr').removeAttr('id');
					$(this).attr('id','clickedTr');
				});
				
			}
		};
		xhr.open("post","./moveOutProcess");
		xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xhr.send("ENT_NO="+ENT_NO+"&STUD_ID="+STUD_ID_From_AssignedData);
	}
	
	
	

}

function changeStudentInfo(STUD_ID,ENT_NO) {
	var stInfo_STUD_ID = document.getElementById("stInfo_STUD_ID");
	var stInfo_STUD_NAME = document.getElementById("stInfo_STUD_NAME");
	var stInfo_STUD_GENDER = document.getElementById("stInfo_STUD_GENDER");
	var stInfo_STUD_DEPT = document.getElementById("stInfo_STUD_DEPT");
	var stInfo_STUD_GRADE = document.getElementById("stInfo_STUD_GRADE");
	var stInfo_ROOM_NAME = document.getElementById("stInfo_ROOM_NAME");
	var stInfo_STUD_PHONE = document.getElementById("stInfo_STUD_PHONE");
	var stInfo_STUD_EMAIL = document.getElementById("stInfo_STUD_EMAIL");
	var stInfo_STUD_ADDR1 = document.getElementById("stInfo_STUD_ADDR1");
	var stInfo_STUD_ADDR2 = document.getElementById("stInfo_STUD_ADDR2");
	var stInfo_GRDN_PHONE = document.getElementById("stInfo_GRDN_PHONE");
	var stInfo_GRDN_RELATION = document.getElementById("stInfo_GRDN_RELATION");
	var stInfo_GRDN_ADDR1 = document.getElementById("stInfo_GRDN_ADDR1");
	var stInfo_GRDN_ADDR2 = document.getElementById("stInfo_GRDN_ADDR2");

	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);

			stInfo_STUD_ID.value = jsonObj.STUD_ID;
			stInfo_STUD_NAME.value = jsonObj.STUD_NAME;
			stInfo_STUD_GENDER.value = jsonObj.STUD_GENDER;
			stInfo_STUD_DEPT.value = jsonObj.STUD_DEPT;
			stInfo_STUD_GRADE.value = jsonObj.STUD_GRADE;
			if(jsonObj.ROOM_NAME != null){
				stInfo_ROOM_NAME.value = jsonObj.ROOM_NAME;
			}else{
				stInfo_ROOM_NAME.value = '호실 미배정';
			}
			
			
			stInfo_STUD_PHONE.value = jsonObj.STUD_PHONE;
			stInfo_STUD_EMAIL.value = jsonObj.STUD_EMAIL;
			stInfo_STUD_ADDR1.value = jsonObj.STUD_ADDR1;
			stInfo_STUD_ADDR2.value = jsonObj.STUD_ADDR2;
			stInfo_GRDN_PHONE.value = jsonObj.GRDN_PHONE;
			stInfo_GRDN_RELATION.value = jsonObj.GRDN_RELATION;
			stInfo_GRDN_ADDR1.value = jsonObj.GRDN_ADDR1;
			stInfo_GRDN_ADDR2.value = jsonObj.GRDN_ADDR2;

		}
	};
	xhr.open("post","./getStudentInfo");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("STUD_ID="+STUD_ID+"&ENT_NO="+ENT_NO);
}


function clickedRoomData(elm) {
	var room_code = elm.getElementsByClassName('room_code')[0].innerText;
	var roomData_FLOOR_GRADE_DIV = elm.getElementsByClassName('roomData_FLOOR_GRADE_DIV')[0].innerText;
	var roomData_BLDG_GENDER_DIV = elm.getElementsByClassName('roomData_BLDG_GENDER_DIV')[0].innerText;
	
	nowClickedStudIdFromAssignedData=-1;
	nowClickedRoomCodeFromRoomData=room_code;

	getAssignedRoomList(ENT_NO,room_code);
	
// 	console.log(room_code.substr(0, 1)); A B C 호관이 옴

	var applDataTr_Classes = document.getElementsByClassName('applDataTr');
		
	for(applDataTr of applDataTr_Classes){
		var applData_APPL_CHOICE = applDataTr.getElementsByClassName('applData_APPL_CHOICE')[0];
		var applData_STUD_GRADE = applDataTr.getElementsByClassName('applData_STUD_GRADE')[0];
		var applData_STUD_GENDER = applDataTr.getElementsByClassName('applData_STUD_GENDER')[0];
		
		applData_APPL_CHOICE.style.color="";
		applData_APPL_CHOICE.style.textShadow="";
		applDataTr.style.backgroundColor="";
		
		if(applData_STUD_GRADE.innerText == roomData_FLOOR_GRADE_DIV && applData_STUD_GENDER.innerText == roomData_BLDG_GENDER_DIV ){
			applDataTr.style.backgroundColor="#ebf5ee";
			
			if( applData_APPL_CHOICE.innerText == room_code.substr(0, 1) ){
				applData_APPL_CHOICE.style.color="#42e379";
				applData_APPL_CHOICE.style.textShadow="0 0 3px #a6edbe";
			}
		}
			
	}

}

function clickedAssignedRoomData(elm) {
	var STUD_ID = elm.getElementsByClassName('stud_id')[0].innerText;
	
	nowClickedApplNoFromApplData=-1;
	nowClickedStudIdFromApplData=-1;
	nowClickedStudIdFromAssignedData=STUD_ID;
	changeStudentInfo(STUD_ID,ENT_NO);
	
// 	console.log("선택한 호실배정인원 학생 : "+nowClickedStudIdFromAssignedData);
// 	console.log("선택한 미배정인원 학생 : "+nowClickedApplNoFromApplData);
}

function clickedApplData(elm) {
	var APPL_NO = elm.getElementsByClassName('appl_no')[0].innerText;
	var STUD_ID = elm.getElementsByClassName('stud_id')[0].innerText;
	
	nowClickedStudIdFromAssignedData=-1;
	nowClickedApplNoFromApplData = APPL_NO;
	nowClickedStudIdFromApplData = STUD_ID;
	changeStudentInfo(STUD_ID,ENT_NO);
	
// 	console.log("선택한 호실배정인원 학생 : "+nowClickedStudIdFromAssignedData);
// 	console.log("선택한 미배정인원 학생 : "+nowClickedApplNoFromApplData);
}

function refresh3Tables(elm) {
	ENT_NO = elm.value;
	
	getApplList(ENT_NO);
	getRoomList(ENT_NO);
	document.getElementById('assignedRoomListTBody').innerHTML="";
}

window.onload=function(){
	getEntInfoList();
	getBuildingCodeList();
	
	refresh3Tables(document.getElementById('entInfoSelectTag'));
	$('#entInfoSelectTag').on('change',function(){
		refresh3Tables(this);
		nowClickedRoomCodeFromRoomData=-1;
		nowClickedStudIdFromAssignedData=-1;
		nowClickedApplNoFromApplData=-1;
		nowClickedStudIdFromApplData=-1;
	});
	
	
};
function testButton() {
	console.log("ENT_NO="+ENT_NO);
	console.log("nowClickedRoomCodeFromRoomData="+nowClickedRoomCodeFromRoomData);
	console.log("nowClickedStudIdFromAssignedData="+nowClickedStudIdFromAssignedData);
	console.log("nowClickedApplNoFromApplData="+nowClickedApplNoFromApplData);
	console.log("nowClickedStudIdFromApplData="+nowClickedStudIdFromApplData);
}
</script>

</head>
<body>

<jsp:include page="../../staff_common/staffSidebar.jsp"></jsp:include>

<div class="page-content" id="content" style="border-right:3px solid rgb(33,37,41,0.175)">
	<div class="dashboard-card-bottom">
		<main>
			<div class="container-fluid;">
				<div class="row" >
					<div class="col">
						
						<!-- 여기다 작성하세요 -->
<!-- 							<button onclick="testButton()">테스트버튼</button> -->
						<div>
							<div class="row">
								<div class="col">
									<div class="row cloudTag">
										<div class="col">
										
											<div class="row">
												<div class="col" style="padding-bottom: 1vh">
													<span>
														입사학기
														<select id="entInfoSelectTag" name="ENT_NO" class="form-select" style="display: inline-block; width: 8vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
														</select>
													</span>
												</div>
											</div>
										
											<div class="row">
												<div class="col">
													
													<div class="row">
														<div class="col" style="margin-bottom: 1.5vh">
															<span style="font-size: 1rem">기숙사호실 목록</span>
														</div>
													</div>									
													
													<div class="row" style="height: 6vh">
														<div class="col" style="">
															<div class="row">
																<div class="col" style="padding-right: 0">
																	<span style="margin-right: 1vw">
																		호관(성별)
																		<select id="BLDG_CODE"  class="form-select" style="display: inline-block; width: 5vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
																			<option value="0">(전체)</option>
																			<option value="A">A관(남자)</option>
																			<option value="B">B관(남자)</option>
																			<option value="C">C관(남자)</option>
																			<option value="D">D관(여자)</option>
																			<option value="E">E관(여자)</option>
																			<option value="F">F관(여자)</option>
																		</select>
																	</span>
																	<span>	
																		층(학년)
																		<select name="FLOOR_GRADE_DIV" class="form-select" style="display: inline-block; width: 5.5vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
																			<option value="0">(전체)</option>
																			<option value="FLOOR_GRADE_DIV">1층(1학년)</option>
																			<option value="FLOOR_GRADE_DIV">2층(2학년)</option>
																			<option value="FLOOR_GRADE_DIV">3층(3학년)</option>
																			<option value="FLOOR_GRADE_DIV">4층(4학년)</option>
																		</select>
																	</span>
																	
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<input type="radio" class="form-check-input" name="fullRoomYN" value="0">전체
																	<input type="radio" class="form-check-input" name="fullRoomYN" value="Y" style="margin-left: 2vh">입실가능
																	<input type="radio" class="form-check-input" name="fullRoomYN" value="N" style="margin-left: 2vh">입실불가
																</div>
															</div>
														</div>
														<div class="col-3">
															<button style="width: 100%; height: 85%; font-size: 0.7rem;background-color: #d1d1d1" class="btn" onclick="">
																호실조회
															</button>
														</div>
													</div>
													
													<div class="row">
														<div class="col tableCol">
															<div class="loadingImgTag" id="roomLoadingImgTag">
															</div>
															<table class="table" style="position: relative;" id="roomListTable">
																<thead id="roomListTHead" style="position: sticky; top:0;left:0; background-color: #fdefc3; border-right: 1px solid rgb(222,226,230)">
																	<tr>
																		<th>호실</th>
																		<th>학년</th>
																		<th>성별</th>
																		<th>총수용인원</th>
																		<th>배정인원</th>
																		<th>남은수용인원</th>
																	</tr>
																</thead>
																<tbody id="roomListTBody" style="border-right: 1px solid rgb(222,226,230);">
																</tbody>
															</table>
														</div>
													</div>
												</div>
												
												
												<div class="col">
													
													<div class="row">
														<div class="col" style="margin-bottom: 1.5vh">
															<span style="font-size: 1rem">입실학생 목록</span>
														</div>
													</div>
													<div class="row" style="height: 6vh" id="assignInputCol">
														<div class="col">
															<div class="row">
																<div class="col">
																	<div style="display: inline-block; width: 10vw; height: auto;">
																		<span style="display: inline-block; width: 2.5vw">호실명 </span>
																		<input id="nowRoomName" class="form-control" style="width:4.5vw;" readonly="readonly">
																	</div>
																	<div style="display: inline-block; width: 10vw">
																		<span style="display: inline-block; width: 3.2vw">총수용인원 </span>
																		<input id="nowRoomBedCount" class="form-control" style="width:2vw;" readonly="readonly">
																	</div>
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<div style="display: inline-block; width: 10vw">
																		<span style="display: inline-block; width: 2.5vw">학년구분 </span>
																		<input id="nowRoomGrade" class="form-control" style="width:4.5vw;" readonly="readonly">
																	</div>
																	<div style="display: inline-block; width: 10vw">
																		<span style="display: inline-block; width: 3.2vw">성별구분 </span>
																		<input id="nowRoomGender" class="form-control" style="width:2vw;" readonly="readonly">
																	</div>
																</div>
															</div>
														</div>
													</div>
													
													<div class="row">
														<div class="col tableCol">
															<div class="loadingImgTag" id="assignedLoadingImgTag">
															</div>
															<table class="table" style="position: relative;" id="assignedRoomListTable">
																<thead id="assignedRoomListTHead" style="position: sticky; top:0;left:0; background-color: #fdefc3;">
																	<tr>
																		<th style="width: 35%">학번</th>
																		<th style="width: 15%">학년</th>
																		<th style="width: 35%">성명</th>
																		<th style="width: 15%">성별</th>
																	</tr>
																</thead>
																<tbody id="assignedRoomListTBody" style="border-bottom: 1px solid rgb(222,226,230);">
																</tbody>
															</table>
														</div>
													</div>
												</div>
												
												<div class="col-1" style="padding-top: 30vh;">
													<div style="text-align: center;">
														<div>
															<button class="btn admission" onclick="admission()">
																<i class="bi bi-box-arrow-in-left" style="font-size: 1.3rem"></i>
																<div style="font-size: 0.8rem; margin-top: -0.5vh">입실</div>
															</button>
														</div>
														<div style="margin-top: 1vh">
															<button class="btn moveOut" onclick="moveOut()">
																<i class="bi bi-box-arrow-right" style="font-size: 1.3rem"></i>
																<div style="font-size: 0.8rem; margin-top: -0.5vh">퇴실</div>
															</button>
														</div>
													</div>
												</div>
												
												<div class="col" style="padding-left: 0">
													<div class="row">
														<div class="col" style="margin-bottom: 1.5vh">
															<span style="font-size: 1rem">미배정학생 목록</span>
														</div>
													</div>
												
													<div class="row" style="height: 6vh">
														<div class="col" id="applInputCol">
				
															<div class="row">
																<div class="col">
																	<span style="margin-right: 2vw">
																		<span>학년</span>
																		<select id="APPL_CHOICE" class="form-select" style="display: inline-block; width: 4vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
																			<option value="0">(전체)</option>
																			<option value="1">1학년</option>
																			<option value="2">2학년</option>
																			<option value="3">3학년</option>
																			<option value="4">4학년</option>
																		</select>
																	</span>
																	<span>	
																		<span style="display: inline-block; width: 2.5vw">성별</span>
																		<select name="STUD_GENDER" class="form-select" style="display: inline-block; width: 4vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
																			<option value="0">(전체)</option>
																			<option value="남자">남자</option>
																			<option value="여자">여자</option>
																		</select>
																	</span>
																</div>
															</div>
															<div class="row">
																<div class="col">
																	<span style="margin-right: 2vw">
																		<span>성명</span>
																		<input type="text" name="STUD_NAME" class="form-control" style="width:4vw;">
																	</span>
																	<span>	
																		<span style="display: inline-block; width: 2.5vw">지망호관</span>
																		<select name="APPL_CHOICE" id="buildingCodeSelectTag" class="form-select" style="display: inline-block; width: 4vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
																			<option value="0">(전체)</option>
																		</select>
																	</span>
																</div>
															</div>
														
														</div>
														<div class="col-3">
															<button style="width: 100%; height: 85%; font-size: 0.7rem;padding-top: 0.4vh; background-color: #d1d1d1" class="btn" onclick="">
																미배정학생<br>조회
															</button>
														</div>
													</div>
												
													
													<div class="row">
														<div class="col tableCol" id="applTableCol">
															<div class="loadingImgTag" id="applLoadingImgTag">
															</div>
															<table class="table" style="position: relative;" id="applListTable">
																<thead id="applListTHead" style="position: sticky; top:0;left:0; background-color: #fdefc3; border-right: 1px solid rgb(222,226,230)">
																	<tr>
																		<th>학번</th>
																		<th>학년</th>
																		<th>성명</th>
																		<th>성별</th>
																		<th>지망호관</th>
																	</tr>
																</thead>
																<tbody id="applListTBody" style="border-right: 1px solid rgb(222,226,230);">
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											
										</div>
									</div>
									
									
									<div class="row cloudTag">
										<div class="col">
											<div class="row">
												<div class="col">
													<i class="bi bi-caret-right-square-fill"></i>학생정보
												</div>
											</div>
											<div class="row" style="margin-top: 1.5vh; margin-bottom: 0.3vh">
												<div class="col-3">
													<span style="display: inline-block; width: 4.5vw">학번 </span>
													<input id="stInfo_STUD_ID" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
												<div class="col-3">
													<span style="display: inline-block; width: 3.5vw">이름 </span>
													<input id="stInfo_STUD_NAME" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
												<div class="col">
													<span style="display: inline-block; width: 3.5vw">성별 </span>
													<input id="stInfo_STUD_GENDER" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
											</div>
											<div class="row" style="margin-bottom: 0.3vh">
												<div class="col-3">
													<span style="display: inline-block; width: 4.5vw">학과 </span>
													<input id="stInfo_STUD_DEPT" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
												<div class="col-3">
													<span style="display: inline-block; width: 3.5vw">학년 </span>
													<input id="stInfo_STUD_GRADE" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
												<div class="col">
													<span style="display: inline-block; width: 3.5vw">배정호실 </span>
													<input id="stInfo_ROOM_NAME" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
											</div>
											<div class="row" style="margin-top: 2vh;margin-bottom: 0.3vh">
												<div class="col-3">
													<span style="display: inline-block; width: 4.5vw">전화번호 </span>
													<input id="stInfo_STUD_PHONE" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
												<div class="col-3">
													<span style="display: inline-block; width: 3.5vw">E-mail </span>
													<input id="stInfo_STUD_EMAIL" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
												<div class="col">
													<span style="display: inline-block; width: 3.5vw">주소 </span>
													<input id="stInfo_STUD_ADDR1" type="text" readonly="readonly" class="form-control" style="width: 11vw">
													<input id="stInfo_STUD_ADDR2" type="text" readonly="readonly" class="form-control" style="width: 11vw">
												</div>
											</div>
											<div class="row">
												<div class="col-3">
													<span style="display: inline-block; width: 4.5vw">보호자전화번호 </span>
													<input id="stInfo_GRDN_PHONE" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
												<div class="col-3">
													<span style="display: inline-block; width: 3.5vw">보호자관계 </span>
													<input id="stInfo_GRDN_RELATION" type="text" readonly="readonly" class="form-control" style="width: auto">
												</div>
												<div class="col">
													<span style="display: inline-block; width: 3.5vw">보호자주소 </span>
													<input id="stInfo_GRDN_ADDR1" type="text" readonly="readonly" class="form-control" style="width: 11vw">
													<input id="stInfo_GRDN_ADDR2" type="text" readonly="readonly" class="form-control" style="width: 11vw">
												</div>
											</div>
										</div>											
									</div>
									
									
								</div>
							</div>
						</div>
						
						<!-- 여기다 작성하세요 -->
						
					</div>
				</div>
			</div>
		</main>
	</div>

</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<!-- 		&#8727 -->
</body>
</html>