<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사자신청관리</title>

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
 		background-color: #f8f9fa; 

	
		font-size:0.7rem;
	}
	th{
		border-top: .05rem solid #dedede;
		border-left: .05rem solid #dedede;
		text-align: center;
	}
	td{
		border-left: .05rem solid #dedede;
	}
	
	.applDataTr:hover>td{
		--bs-table-bg: #ccd3e0;
		--bs-table-striped-bg: 0,0,0,1;
	}
	#clickedTr:hover>td{
		--bs-table-bg: #85a2d4;
		--bs-table-striped-bg: 0,0,0,1;
	}
	#clickedTr{
		--bs-table-bg: #85a2d4;
		--bs-table-striped-bg: 0,0,0,1;
	}
	main>div>div>div>div{
		margin:2vh;
		border: 0px solid black;
		border-radius: 20px 20px 20px 20px;
		padding: 17px;
 		background-color: white;
/* 		background-color:#EBF7FF; */
		box-shadow: 0 .125rem .25rem rgba(0,0,0,.20);
	}
	#applListTable{
		background-color: white
	}
	.custom-tooltip {
 	  --bs-tooltip-bg: var(--bs-danger); 
		font-size: 0.7rem
	}
	
	.sa-button-container>.cancel {
    	background-color: rgb(140,212,245) !important;
 	}
 	.sa-button-container>.cancel:hover{
 		background-color: rgb(134,204,235) !important;
		box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset !important;
 	}
	.sa-confirm-button-container>.confirm{
		background-color: #c1c1c1 !important;
		box-shadow:none !important;
		border: 0 !important;
	}
	.sa-confirm-button-container>.confirm:hover{
		box-shadow: rgba(140, 212, 245, 0.8) 0px 0px 2px, rgba(0, 0, 0, 0.05) 0px 0px 0px 1px inset !important;
		border: 0 !important;
	}
	input[readonly=readonly]{
		background-color: rgb(230,230,230,0.5);
		width: 13vw !important;
	}
	input[readonly=readonly]:focus{
		-webkit-box-shadow: 0 0 5px rgba(0,0,0,.075), 0 0 5px rgb(220, 220, 220) !important;
 		box-shadow: 0 0 5px rgba(0,0,0,.075), 0 0 5px rgb(220, 220, 220) !important;
 		border: 1px solid rgb(200,200,200) !important;
	}
	.form-control:focus{
 		-webkit-box-shadow: 0 0 5px rgba(0,0,0,.075), 0 0 5px rgba(102, 175, 233, .6) !important;
 		box-shadow: 0 0 5px rgba(0,0,0,.075), 0 0 5px rgba(102, 175, 233, .6) !important;
	}
</style>

<script type="text/javascript">
var nowRECR_NO=-1;

function getFormatDateApplDate(date) {
	var year = date.getFullYear();
	var month = (1 + date.getMonth());
	var day = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	var seconds = date.getSeconds();
	return year+'.'+month+'.'+day+" "+hours+':'+minutes+':'+seconds;
}

function getFormatDateBirthday(date) {
	var year = date.getFullYear();
	var month = (1 + date.getMonth());
	var day = date.getDate();
	var hours = date.getHours();
	var minutes = date.getMinutes();
	return year+'.'+month+'.'+day;
}



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
			getRecrInfoList();
		}
	};	

	xhr.open("post","./getEntInfoList",false);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send();
}

function getRecrInfoList() {
	var recrInfoSelectTag = document.getElementById('recrInfoSelectTag');
	var entInfoSelectTag=document.getElementById('entInfoSelectTag');
	selectedEntNO=entInfoSelectTag.value;
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);
			
			recrInfoSelectTag.innerHTML='';
			
			var optionNameAll = document.createElement('option');
			optionNameAll.innerText='(전체)'
			optionNameAll.value=0;
			recrInfoSelectTag.appendChild(optionNameAll);
			
			for(recrInfo of jsonObj){
				var option = document.createElement('option');
				option.innerText = recrInfo.RECR_NAME;
				option.value = recrInfo.RECR_NO;
				recrInfoSelectTag.appendChild(option);
			}
		}
	};

	xhr.open("post","./getRecrInfoList",false);
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("selectedEntNO="+selectedEntNO);
}


function submitData() {

	var ENT_NO = document.getElementsByName("ENT_NO")[0].value;
	var RECR_NO = document.getElementsByName("RECR_NO")[0].value;
	var APPL_YN = $('input[name=APPL_YN]:checked').val();
	var STUD_NAME = document.getElementsByName("STUD_NAME")[0].value;
	var STUD_GENDER = document.getElementsByName("STUD_GENDER")[0].value;
	var allocationMethod = document.getElementsByName("allocationMethod")[0].value;
	nowRECR_NO = RECR_NO;
	if(RECR_NO==0){
		document.getElementById('autoApprovalButton').setAttribute('data-bs-title','모집차수를 선택해주세요');	
	}else{
		document.getElementById('autoApprovalButton').setAttribute('data-bs-title','');
	}
	
	var map = {
		'ENT_NO' : ENT_NO,
		'RECR_NO': RECR_NO,
		'APPL_YN': APPL_YN,
		'STUD_NAME' : STUD_NAME,
		'STUD_GENDER' : STUD_GENDER,
		'allocationMethod' : allocationMethod
	}
	
	var showApplListAria = document.getElementById('showApplListAria');
	var applListTBody = document.getElementById("applListTBody");
	var loadingImage = document.getElementById('loadingImage');
	var applListTHead = document.getElementById('applListTHead');
	var numberOfData = document.getElementById('numberOfData');
	var allPassFailButtonSpan = document.getElementById('allPassFailButtonSpan');
	var dormitoryFixedNumber = document.getElementById('dormitoryFixedNumber');
	
	applListTHead.style.display='';
	applListTBody.style.display='';
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.status != 4){
			applListTHead.innerHTML='';
			applListTBody.innerHTML='';
			loadingImage.innerHTML='';
			numberOfData.innerHTML='';
			allPassFailButtonSpan.innerHTML='';
			dormitoryFixedNumber.innerHTML='';
			var img1 = document.createElement('img');
			img1.src='/dormitory/resources/img/loadingIMG.gif';
			loadingImage.appendChild(img1);
		}

		if(xhr.readyState  == 4 && xhr.status == 200){
			
			applListTBody.innerHTML='';
			loadingImage.innerHTML='';
			allPassFailButtonSpan.innerHTML='';
			dormitoryFixedNumber.innerHTML='';
			var applDiv = document.getElementById('applDiv');
			applDiv.style.borderBottom='.05rem solid #dedede'
			
			var jsonObj = JSON.parse(xhr.responseText);
			
			var button1 = document.createElement('button');
			button1.innerText = '승인처리';
			button1.setAttribute('onclick','approvalProcess("Y",'+RECR_NO+')');
			button1.classList.add("btn");
			button1.classList.add("btn-outline-success");
			button1.setAttribute('style','padding:0.5vw; padding-top:0.2vh; padding-bottom:0.2vh; font-size: .7rem; margin-right: 0.1vw');
			button1.setAttribute('data-bs-custom-class','custom-tooltip');
			button1.setAttribute('data-bs-toggle','tooltip');
			button1.setAttribute('data-bs-placement','top');
			if(RECR_NO=="0"){
				button1.setAttribute('data-bs-title','모집차수를 선택해주세요');
			}
// 			class="btn btn-secondary" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Tooltip on top" data-bs-custom-class="custom-tooltip"

			allPassFailButtonSpan.appendChild(button1);
			
			var button2 = document.createElement('button');
			button2.innerText = '보류처리';
			button2.setAttribute('onclick','approvalProcess("W",'+RECR_NO+')');
			button2.classList.add("btn");
			button2.classList.add("btn-outline-warning");
			button2.setAttribute('style','padding:0.5vw; padding-top:0.2vh; padding-bottom:0.2vh; font-size: .7rem; margin-right: 0.1vw');
			button2.setAttribute('data-bs-custom-class','custom-tooltip');
			button2.setAttribute('data-bs-toggle','tooltip');
			button2.setAttribute('data-bs-placement','top');
			if(RECR_NO=="0"){
				button2.setAttribute('data-bs-title','모집차수를 선택해주세요');
			}
			allPassFailButtonSpan.appendChild(button2);
			
			var button3 = document.createElement('button');
			button3.innerText = '탈락처리';
			button3.setAttribute('onclick','approvalProcess("N",'+RECR_NO+')');
			button3.classList.add("btn");
			button3.classList.add("btn-outline-danger");
			button3.setAttribute('style','padding:0.5vw; padding-top:0.2vh; padding-bottom:0.2vh; font-size: .7rem');
			button3.setAttribute('data-bs-custom-class','custom-tooltip');
			button3.setAttribute('data-bs-toggle','tooltip');
			button3.setAttribute('data-bs-placement','top');
			if(RECR_NO=="0"){
				button3.setAttribute('data-bs-title','모집차수를 선택해주세요');
			}
			allPassFailButtonSpan.appendChild(button3);
			
			const tooltipTriggerList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
			const tooltipList = [...tooltipTriggerList].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl))
			
			numberOfData.innerText=jsonObj.applList.length+' 건이 조회되었습니다.';
			numberOfData.style.paddingLeft='10px';
			
			var tr11 = document.createElement('tr');
			
			
			var th11 = document.createElement('th');
			var input11 = document.createElement('input');
			input11.type = 'checkbox';
			input11.setAttribute('onchange','checkAllApplData(this)');
			th11.appendChild(input11);
			tr11.appendChild(th11);
			
			var th10 = document.createElement('th');
			th10.innerText='번호';
			tr11.appendChild(th10);
			
			var th12 = document.createElement('th');
			th12.innerText = '모집차수';
			tr11.appendChild(th12);
			
			var th13 = document.createElement('th');
			th13.innerText = '학번';
			tr11.appendChild(th13);
			
			var th14 = document.createElement('th');
			th14.innerText = '이름';
			tr11.appendChild(th14);
			
			var th15 = document.createElement('th');
			th15.innerText = '학과';
			tr11.appendChild(th15);
			
			var th16 = document.createElement('th');
			th16.innerText = '학년';
			tr11.appendChild(th16);
			
			var th17 = document.createElement('th');
			th17.innerText = '성별';
			tr11.appendChild(th17);
			
			var th18 = document.createElement('th');
			th18.innerText = '지원자구분';
			tr11.appendChild(th18);
			
			var th19 = document.createElement('th');
			th19.innerText = '신청일시';
			tr11.appendChild(th19);
			
			var th20 = document.createElement('th');
			th20.innerText = '생년월일';
			tr11.appendChild(th20);
			
			var th21 = document.createElement('th');
			th21.innerText = '배정방식';
			tr11.appendChild(th21);
			
			var th22 = document.createElement('th');
			th22.innerText = '휴대폰';
			tr11.appendChild(th22);
			
			var th23 = document.createElement('th');
			th23.innerText = 'E-mail';
			tr11.appendChild(th23);
			
			var th24 = document.createElement('th');
			th24.innerText = '지난학기성적';
			tr11.appendChild(th24);
			
			var th25 = document.createElement('th');
			th25.innerText = '승인여부';
			tr11.appendChild(th25);
			
			applListTHead.appendChild(tr11);
			
			
			var trHidden = document.createElement('tr');
			trHidden.style.display='none';
			applListTBody.appendChild(trHidden);
			
			var i=0;
			for(applData of jsonObj.applList){
				i++;
				
				var tr1 = document.createElement('tr');
				tr1.setAttribute('onclick','refreshApplInfo(this)');
				tr1.classList.add('applDataTr');
				
				var td0 = document.createElement('td');
				td0.style.textAlign='center';
				var input1 = document.createElement('input');
				input1.type='checkbox';
				input1.classList.add('applDataCheckBoxes');
				input1.value=applData.APPL_NO;
				td0.appendChild(input1);
				tr1.appendChild(td0);
				
				var td1=document.createElement('td');
				td1.innerText=i;
				td1.style.textAlign='center';
				tr1.appendChild(td1);
				
				var td2 = document.createElement('td');
				td2.innerText = applData.RECR_NAME;
				tr1.appendChild(td2);
				
				var td3 = document.createElement('td');
				td3.innerText = applData.STUD_ID;
				td3.style.textAlign='center';
				tr1.appendChild(td3);
				
				var td4 = document.createElement('td');
				td4.innerText = applData.STUD_NAME;
				td4.style.textAlign='center';
				tr1.appendChild(td4);
				
				var td5 = document.createElement('td');
				td5.innerText = applData.STUD_DEPT;
				td5.style.textAlign='center';
				tr1.appendChild(td5);
				
				var td6 = document.createElement('td');
				td6.innerText = applData.STUD_GRADE;
				td6.style.textAlign='center';
				tr1.appendChild(td6);
				
				var td7 = document.createElement('td');
				td7.innerText = applData.STUD_GENDER;
				td7.style.textAlign='center';
				tr1.appendChild(td7);
				
				var td8 = document.createElement('td');
				td8.innerText = applData.STUD_STATE;
				td8.style.textAlign='center';
				tr1.appendChild(td8);
				
				var td9 = document.createElement('td');
				td9.innerText = getFormatDateApplDate(new Date(applData.APPL_DATE));
				td9.style.textAlign='center';
				tr1.appendChild(td9);
				
				var td10 = document.createElement('td');
				td10.innerText = getFormatDateBirthday(new Date(applData.STUD_BIRTH));
				td10.style.textAlign='center';
				tr1.appendChild(td10);
				
				var td11 = document.createElement('td');
				td11.style.textAlign='center';
				if(applData.APPL_CHOICE==null){
					td11.innerText = '임의배정';
				}else{
					td11.innerText = '지망신청('+applData.APPL_CHOICE+'관)';
				}
				tr1.appendChild(td11);
				
				var td12 = document.createElement('td');
				td12.innerText = applData.STUD_PHONE;
				td12.style.textAlign='center';
				tr1.appendChild(td12);
				
				var td13 = document.createElement('td');
				td13.innerText = applData.STUD_EMAIL;
				tr1.appendChild(td13);
				
				var td14 = document.createElement('td');
				td14.innerText = applData.STUD_LAST_SCORE;
				td14.style.textAlign='center';
				tr1.appendChild(td14);
				
				var td15 = document.createElement('td');
				td15.style.textAlign='center';
				if(applData.APPL_YN=='Y'){
					td15.innerText='승인완료';
					td15.style.color='#17bd51';
				}
				if(applData.APPL_YN=='W'){
					td15.innerText='승인대기중';
					td15.style.color='#F2CB61';
				}
				if(applData.APPL_YN=='N'){
					td15.innerText='신청탈락';
					td15.style.color='#fa1b57';
				}
				
				tr1.appendChild(td15);
				
				applListTBody.appendChild(tr1);

			}
			
			var RECR_DIVSpan = document.createElement('span');
			RECR_DIVSpan.id='RECR_DIVspan';
			if(jsonObj.RECR_DIV == "0"){
				RECR_DIVSpan.innerText = '학년전체';
			}else{
				RECR_DIVSpan.innerText = jsonObj.RECR_DIV+'학년';
			}
			
			dormitoryFixedNumber.appendChild(RECR_DIVSpan);
			
			var span1 = document.createElement('span');
			span1.innerText = ' 기숙사정원(남자: '
			dormitoryFixedNumber.appendChild(span1);
			
			var maleNowNumberSpan = document.createElement('span');
			maleNowNumberSpan.id='maleNowNumberSpan';
			maleNowNumberSpan.innerText=jsonObj.maleNowNumber;
			dormitoryFixedNumber.appendChild(maleNowNumberSpan);
			
			var span2 = document.createElement('span');
			span2.innerText = '/';
			dormitoryFixedNumber.appendChild(span2);
			
			var maleFixedNumberSpan = document.createElement('span');
			maleFixedNumberSpan.id='maleFixedNumberSpan';
			maleFixedNumberSpan.innerText = jsonObj.maleFixedNumber;
			dormitoryFixedNumber.appendChild(maleFixedNumberSpan);
			
			var span3 = document.createElement('span');
			span3.innerText = ' 여자: ';
			dormitoryFixedNumber.appendChild(span3);
			
			var femaleNowNumberSpan = document.createElement('span');
			femaleNowNumberSpan.id='femaleNowNumberSpan';
			femaleNowNumberSpan.innerText=jsonObj.femaleNowNumber;
			dormitoryFixedNumber.appendChild(femaleNowNumberSpan);
			
			var span4 = document.createElement('span');
			span4.innerText = '/';
			dormitoryFixedNumber.appendChild(span4);
			
			var femaleFixedNumberSpan = document.createElement('span');
			femaleFixedNumberSpan.id='femaleFixedNumberSpan';
			femaleFixedNumberSpan.innerText = jsonObj.femaleFixedNumber;
			dormitoryFixedNumber.appendChild(femaleFixedNumberSpan);
			
			var span5 = document.createElement('span');
			span5.innerText = ')';
			dormitoryFixedNumber.appendChild(span5);
			

			const tooltipTriggerList2 = document.querySelectorAll('[data-bs-toggle="tooltip2"]');
			const tooltipList2 = [...tooltipTriggerList2].map(tooltipTriggerEl => new bootstrap.Tooltip(tooltipTriggerEl));
		}
	};	
	
	xhr.open("post","./getApplListByFilter");
	xhr.setRequestHeader("Content-type","application/json");
	xhr.send(JSON.stringify(map));
}

function checkAllApplData(elm) {
// 	alert(document.getElementsByClassName('applDataCheckBoxes').length);
	for(applDataCheckBox of document.getElementsByClassName('applDataCheckBoxes')){
		applDataCheckBox.checked=elm.checked;
	}
}

function refreshApplInfo(elm) {
	$('#clickedTr').removeAttr('id');
	$(elm).attr('id','clickedTr');
	var APPL_NO = $(elm).children().first().children().first().val();
	//이값으로 나머지 값들 불러오기
	
	var xhr = new XMLHttpRequest(); 
	xhr.onreadystatechange = function(){
		
		if(xhr.readyState  == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText);
			
			var updateButtonSpan = document.getElementById('updateButtonSpan');
			updateButtonSpan.style.marginTop='7vh';
			updateButtonSpan.innerHTML='';
			var button1 = document.createElement('button');
			button1.setAttribute('onclick','updateAppl('+APPL_NO+')');
			button1.innerText='수정';
			button1.classList.add("btn");
			button1.classList.add("btn-secondary");
			button1.setAttribute('style','--bs-btn-padding-x:5px;--bs-btn-padding-y:1.5px;--bs-btn-font-size: .8rem');
			button1.style.width='5vw';
			updateButtonSpan.appendChild(button1);
			
			var br1 = document.createElement('br1');
			updateButtonSpan.appendChild(br1);
			
			document.getElementById('STUD_ID_DataInfo').value=jsonObj.STUD_ID;
			document.getElementById('STUD_NAME_DataInfo').value=jsonObj.STUD_NAME;
			document.getElementById('STUD_GENDER_DataInfo').value=jsonObj.STUD_GENDER;
			document.getElementById('STUD_DEPT_DataInfo').value=jsonObj.STUD_DEPT;
			document.getElementById('STUD_GRADE_DataInfo').value=jsonObj.STUD_GRADE;
			document.getElementById('STUD_LAST_SCORE_DataInfo').value=jsonObj.STUD_LAST_SCORE;
			document.getElementById('RECR_NAME_DataInfo').value=jsonObj.RECR_NAME;
			document.getElementById('APPL_CHOICE_DataInfo').value=jsonObj.APPL_CHOICE;
			document.getElementById('APPL_DATE_DataInfo').value=getFormatDateApplDate(new Date(jsonObj.APPL_DATE));
			
			document.getElementById('STUD_PHONE_DataInfo').value=jsonObj.STUD_PHONE;
			document.getElementById('STUD_EMAIL_DataInfo').value=jsonObj.STUD_EMAIL;
			document.getElementById('STUD_ZIPCODE_DataInfo').value=jsonObj.STUD_ZIPCODE;
			document.getElementById('STUD_ADDR1_DataInfo').value=jsonObj.STUD_ADDR1;
			document.getElementById('STUD_ADDR2_DataInfo').value=jsonObj.STUD_ADDR2;
			document.getElementById('GRDN_NAME_DataInfo').value=jsonObj.GRDN_NAME;
			document.getElementById('GRDN_PHONE_DataInfo').value=jsonObj.GRDN_PHONE;
			document.getElementById('GRDN_RELATION_DataInfo').value=jsonObj.GRDN_RELATION;
			document.getElementById('GRDN_ZIPCODE_DataInfo').value=jsonObj.GRDN_ZIPCODE;
			document.getElementById('GRDN_ADDR1_DataInfo').value=jsonObj.GRDN_ADDR1;
			document.getElementById('GRDN_ADDR2_DataInfo').value=jsonObj.GRDN_ADDR2;
		}
	};

	xhr.open("post","./getApplData");
	xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xhr.send("APPL_NO="+APPL_NO);
}

function updateAppl(APPL_NO) {
	var GRDN_NAME = document.getElementById('GRDN_NAME_DataInfo').value;
	var GRDN_PHONE = document.getElementById('GRDN_PHONE_DataInfo').value;
	var GRDN_RELATION = document.getElementById('GRDN_RELATION_DataInfo').value;
	var GRDN_ZIPCODE = document.getElementById('GRDN_ZIPCODE_DataInfo').value;
	var GRDN_ADDR1 = document.getElementById('GRDN_ADDR1_DataInfo').value;
	var GRDN_ADDR2 = document.getElementById('GRDN_ADDR2_DataInfo').value;
	
	var map = {
			"APPL_NO" : APPL_NO,
			"GRDN_NAME" : GRDN_NAME,
			"GRDN_PHONE" : GRDN_PHONE,
			"GRDN_RELATION" : GRDN_RELATION,
			"GRDN_ZIPCODE" : GRDN_ZIPCODE,
			"GRDN_ADDR1" : GRDN_ADDR1,
			"GRDN_ADDR2" : GRDN_ADDR2
	}
	
	var xhr = new XMLHttpRequest();
	xhr.onreadystatechange = function(){
		if(xhr.readyState  == 4 && xhr.status == 200){
			
			swal("","수정되었습니다", "success");
		}
	};
	
	xhr.open("post","./updateApplDataProcess",false);
	xhr.setRequestHeader("Content-type","application/json");
	xhr.send(JSON.stringify(map));
}


function approvalProcess(approvalYN,nowRECR_NO) {
	var checkedApplDataCheckBoxes = document.querySelectorAll('input[class=applDataCheckBoxes]:checked');
	var maleNowNumber = document.getElementById('maleNowNumberSpan').innerText;
	var maleFixedNumber = document.getElementById('maleFixedNumberSpan').innerText;
	var femaleNowNumber = document.getElementById('femaleNowNumberSpan').innerText;
	var femaleFixedNumber = document.getElementById('femaleFixedNumberSpan').innerText;
	var recrInfoSelectTagValue = document.getElementById('recrInfoSelectTag').value;
	
	var checkedApplDataValues = new Array();
	var map;
	
	var maleCount=0;
	var femaleCount=0;
	
	
	
	if(nowRECR_NO=="0"){//모집차수 전체인데 처리하려고 하면 안되도록
		swal("","모집차수를 선택해주세요", "warning");
		return;
	}
	
	for(elm of checkedApplDataCheckBoxes){
		var APPL_YNText = elm.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.innerText;
		var APPL_YN="";
		if(APPL_YNText=="승인완료") APPL_YN="Y";
		if(APPL_YNText=="승인대기중") APPL_YN="W";
		if(APPL_YNText=="신청탈락") APPL_YN="N";
		
// 		console.log(APPL_YN);
// 		console.log(approvalYN);

		if(approvalYN=="Y" && APPL_YN=="Y"){//이미 승인하려는 데이터가 포함되어있을때
			swal("","이미 승인 처리된 데이터가 포함되어 있습니다.", "warning");
			return;
		}
		if(approvalYN=="N" && APPL_YN=="N"){
			swal("","이미 탈락 처리된 데이터가 포함되어 있습니다.", "warning");
			return;
		}
		
		var STUD_GENDER = elm.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling.innerText;
		if(STUD_GENDER=='남자') maleCount++;
		if(STUD_GENDER=='여자') femaleCount++;
		
		checkedApplDataValues.push(elm.value);
	}
	
// 	console.log("남자 선택인원:"+maleCount);
// 	console.log("남자 승인된인원:"+maleNowNumber);
// 	console.log("남자 정원:"+maleFixedNumber);
// 	console.log("여자 선택인원:"+femaleCount);
// 	console.log("여자 승인된인원:"+femaleNowNumber);
// 	console.log("여자 정원:"+femaleFixedNumber);
	
// 	console.log("선택남자+이미승인된남자:"+(Number(maleCount)+Number(maleNowNumber)));
// 	console.log("선택여자+이미승인된여자:"+(Number(femaleCount)+Number(femaleNowNumber)));
// 	console.log("if 우측값 Boolean:"+(Number(maleCount)+Number(maleNowNumber))>Number(maleFixedNumber) || (Number(femaleCount)+Number(femaleNowNumber))>Number(femaleFixedNumber));
	
	if(checkedApplDataCheckBoxes.length==0){//체크 안된경우
		swal("","데이터를 선택해주세요", "warning");
		return;
	}else if(approvalYN=="Y" && ( (Number(maleCount)+Number(maleNowNumber)>Number(maleFixedNumber)) || (Number(femaleCount)+Number(femaleNowNumber))>Number(femaleFixedNumber) ) ){//체크되었고,대기중데이터이고 남은 인원수보다 많이 체크 되었을때
		swal("","선택한 승인 데이터가 남은 정원을 초과했습니다", "warning");
		return;
	}else{//체크도 되었고 남은인원수보다 체크된 데이터가 적거나 같을때
		map = {
				"checkedApplDataValues":checkedApplDataValues,
				"approvalYN":approvalYN
		};
		
		var loadingImage = document.getElementById('loadingImage');
		var applListTBody = document.getElementById("applListTBody");
		var applListTHead = document.getElementById('applListTHead');
		
		var xhr = new XMLHttpRequest();
		
		if(xhr.readyState != 4){
			applListTHead.style.display='none';
			applListTBody.style.display='none';
			loadingImage.innerHTML='';
			var img1 = document.createElement('img');
			img1.src='/dormitory/resources/img/loadingIMG.gif';
			loadingImage.appendChild(img1);
		}
		
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState  == 4 && xhr.status == 200){
				loadingImage.innerHTML='';
				if(approvalYN=='Y'){
					swal("","승인 처리 되었습니다", "success");
				}else if(approvalYN=='W'){
					swal("","보류 처리 되었습니다", "success");
				}else if(approvalYN=='N'){
					swal("","탈락 처리 되었습니다", "success");
				}
				submitData();
			}
		};
		
		xhr.open("post","./approvalProcess");
		xhr.setRequestHeader("Content-type","application/json");
		xhr.send(JSON.stringify(map));
	}
}

function updateValueRecrInfo_Hidden() {
	alert();
}

function autoApprovalProcess(nowRECR_NO) {
	var recrInfoSelectTagValue = document.getElementById('recrInfoSelectTag').value;
	
	if(nowRECR_NO==0){//모집차수 전체인데 자동승인하려고하면 안되도록
		swal("","모집차수를 선택해주세요", "warning");
		return;
	}else{

		var confirm = function(msg, title, resvNum) {
			swal({
				title : title,
				text : msg,
				showCancelButton : true,			
				cancelButtonText : "예",
				confirmButtonText : "아니오",
				closeOnConfirm : true,
				closeOnCancel : true
			}, function(isConfirm) {
				if (isConfirm==false) {//실행 눌렀을때
					var xhr = new XMLHttpRequest();
				
					xhr.onreadystatechange = function(){
						if(xhr.readyState  == 4 && xhr.status == 200){
							swal("","자동 승인 처리 되었습니다", "success");
							submitData();
						}
					};
					
					xhr.open("post","./autoApprovalProcess");
					xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded");
					xhr.send("nowRECR_NO="+nowRECR_NO);
					
				}else{//취소 눌렀을때
					return;
				}

			});

		}
		function sweetConfirm() {
			confirm('해당 모집차수의 승인 대기중인 인원을\n지난 학기 성적순으로 정원에 맞게 자동 승인하고\n남은인원은 탈락처리됩니다.\n계속하시겠습니까?', '');
		}
		sweetConfirm();

		
	}
}

window.onload=function(){
	getEntInfoList();
	submitData();
	
	$('#entInfoSelectTag').change(function () {
		getRecrInfoList();
	});
};

</script>

<!--  우편 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.

    function grdn_post() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('GRDN_ZIPCODE_DataInfo').value = data.zonecode;
                document.getElementById("GRDN_ADDR1_DataInfo").value = roadAddr;
                return;
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
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
						<div>
							<div class="row">
								<div class="col">
									<div class="row">
										<div class="col">
											<div style="display:inline-block; width: 3vw">입사학기</div>
											<select id="entInfoSelectTag" name="ENT_NO" class="form-select" style="display: inline-block; width: 13vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
											</select>
										</div>
										<div class="col">
											<div style="display:inline-block; width: 3vw">모집차수</div>
											<select id='recrInfoSelectTag' name="RECR_NO" class="form-select" style="display: inline-block; width: 11vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
											</select>
											<input type="hidden" id="recrInfo_Hidden" value="0">
											<button onclick="autoApprovalProcess(nowRECR_NO)" class="btn btn-outline-info" style="padding:0.5vw; padding-top:0.2vh; padding-bottom:0.2vh; font-size: .7rem;" data-bs-custom-class="custom-tooltip" data-bs-toggle="tooltip2" data-bs-placement="bottom" id="autoApprovalButton">
												모집차수 전체 자동승인
											</button>

										</div>
										<div class="col">
											<div style="display:inline-block; width: 4.5vw">신청승인여부</div>
											<input style="margin-left: .5vw" class="form-check-input" type="radio" name="APPL_YN" checked="checked" value="0">전체
											<input style="margin-left: .5vw" class="form-check-input" type="radio" name="APPL_YN" value="Y">승인완료
											<input style="margin-left: .5vw" class="form-check-input" type="radio" name="APPL_YN" value="W">승인대기중
											<input style="margin-left: .5vw" class="form-check-input" type="radio" name="APPL_YN" value="N">신청탈락
										</div>
									</div>
									<div class="row" style="margin-top: 2px">
										<div class="col">
											<div style="display:inline-block; width: 3vw">성별</div>
											<select id="genderSelectTag" name="STUD_GENDER" class="form-select" style="display: inline-block; width: 13vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
												<option value="0">(전체)</option>
												<option value="남자">남자</option>
												<option value="여자">여자</option>
											</select>
										</div>
										<div class="col">
											<div style="display:inline-block; width: 3vw">성명</div>
											<input type="text" name="STUD_NAME" class="form-control" style="display:inline-block;width: 11vw;height:2.3vh;font-size: 0.7rem;">
										</div>
										<div class="col">
											<div style="display:inline-block; width: 4.5vw">지망신청여부</div>
											<select name="allocationMethod" class="form-select" style="display: inline-block; width: 5vw; font-size: 0.7rem; height: 2.5vh; padding: 0; padding-left: 0.5vw">
												<option value="0">(전체)</option>
												<option value="지망신청">지망신청</option>
												<option value="임의배정">임의배정</option>
											</select>
										</div>
									</div>
									
								
								</div>
								<div class="col-1">
									<button style="width: 100%; height: 100%; background-color:  #d1d1d1" onclick="submitData()" class="btn">조회</button>
								</div>
							</div>
							
							<div id='showApplListAria'style="height: 48vh;">
								<div id='loadingImage' style="height: 45vh; position: absolute; margin-left: 35%; margin-top: 5%">
								</div>
								
								<div style="margin-bottom: 1vh; margin-top:1vh;">
									<span style="float: left;" id="allPassFailButtonSpan">
									</span>
									<span id='numberOfData'></span>
									<span>
										<span style="float: right;" id="dormitoryFixedNumber"></span>
									</span>
								</div>
								<div style="height: 45vh; overflow-y: auto;" id="applDiv">
									<table class="table table-striped table-striped" style="position: relative;" id="applListTable">
										<thead id="applListTHead" style="position: sticky; top:0;left:0; background-color: #fdefc3; border: 1px solid rgb(222,226,230)">
										</thead>
										<tbody id="applListTBody">
										</tbody>
									</table>
								</div>
							</div>
						</div>
						
						
						
						<div style="padding-top: 1.7vh">
							<i class="bi bi-caret-right-square-fill"></i>신청정보
							<div class="row" style="margin-top: 1vh">
								<div class="col"><div style="display: inline-block; width: 3vw">학번</div> <input type="text" id="STUD_ID_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
								<div class="col"><div style="display: inline-block; width: 3vw">이름</div> <input type="text" id="STUD_NAME_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
								<div class="col"><div style="display: inline-block; width: 4vw">성별</div> <input type="text" id="STUD_GENDER_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
							</div>
							<div class="row" style="margin-top: 0.4vh">
								<div class="col-4"><div style="display: inline-block; width: 3vw">학과</div> <input type="text" id="STUD_DEPT_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
								<div class="col"><div style="display: inline-block; width: 3vw">학년</div> <input type="text" id="STUD_GRADE_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
								<div class="col"><div style="display: inline-block; width: 4vw">지난학기성적</div> <input type="text" id="STUD_LAST_SCORE_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
							</div>
							<div class="row" style="margin-top: 0.4vh">
								<div class="col"><div style="display: inline-block; width: 3vw">모집차수</div> <input type="text" id="RECR_NAME_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
								<div class="col"><div style="display: inline-block; width: 3vw">지망호관</div> <input type="text" id="APPL_CHOICE_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
								<div class="col"><div style="display: inline-block; width: 4vw">신청일시</div> <input type="text" id="APPL_DATE_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 10vw;height:2.3vh;font-size: 0.7rem"></div>
							</div>
						</div>
						
						
						<div style="padding-top: 1.7vh">
							
		
							<i class="bi bi-caret-right-square-fill"></i>연락처
		
							<div class="row" style="margin-top: 1vh">
								<div class="col">
									<div class="row" style="margin-top: 0.4vh">
										<div class="col-4"><div style="display: inline-block; width: 4.5vw">전화번호</div> <input type="text" id="STUD_PHONE_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"></div>
										<div class="col"><div style="display: inline-block; width: 4.5vw">E-mail</div> <input type="text" id="STUD_EMAIL_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"></div>
									</div>
									<div class="row" style="margin-top: 0.4vh">
										<div class="col-4"><div style="display: inline-block; width: 4.5vw">우편번호</div> <input type="text" id="STUD_ZIPCODE_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"></div>
										<div class="col"><div style="display: inline-block; width: 4.5vw">주소</div> <input type="text" id="STUD_ADDR1_DataInfo" readonly="readonly" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"> <input class="form-control" style="display:inline-block;width: 11vw;height:2.3vh;font-size: 0.7rem" type="text" id="STUD_ADDR2_DataInfo" readonly="readonly"></div>
									</div>
									<div class="row" style="margin-top: 0.4vh">
										<div class="col-4"><div style="display: inline-block; width: 4.5vw">보호자성명</div> <input type="text" id="GRDN_NAME_DataInfo" placeholder="보호자성명" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"></div>
										<div class="col-5"><div style="display: inline-block; width: 4.5vw">보호자전화번호</div> <input type="text" id="GRDN_PHONE_DataInfo" placeholder="보호자전화번호" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"></div>
										<div class="col-3" style="margin-left: -1.8vw;">보호자관계 <input type="text" id="GRDN_RELATION_DataInfo" placeholder="보호자관계" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"></div>
									</div>
									<div class="row" style="margin-top: 0.4vh">
										<div class="col-4"><div style="display: inline-block; width: 4.5vw">보호자우편번호</div> <input type="text" id="GRDN_ZIPCODE_DataInfo" placeholder="보호자우편번호" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"><button onclick="grdn_post()" class="btn btn-secondary" style="margin-top:-0.3vh;padding:0.5vw; padding-top:0; padding-bottom:0.1vh; --bs-btn-font-size: .7rem">우편번호 찾기</button></div>
										<div class="col"><div style="display: inline-block; width: 4.5vw">보호자주소</div> <input type="text" id="GRDN_ADDR1_DataInfo" placeholder="보호자주소" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem"> <input type="text" id="GRDN_ADDR2_DataInfo" placeholder="상세주소" class="form-control" style="display:inline-block;width: 13vw;height:2.3vh;font-size: 0.7rem">	</div>
									</div>
								</div>
								<div class="col-1">
									<span style="float: right;" id='updateButtonSpan'>
									</span>
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