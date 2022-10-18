<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사계획관리</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
<link href="../../resources/css/plan.css" rel="stylesheet" type="text/css">
	
<style>
	
	.sticky-top{
	    position: sticky;
    	top: 0;
	}
	
	.sticky-bottom{
	    position: sticky;
    	bottom: 0;
	}
	
	
 </style>
 
 <script type="text/javascript" defer>
 	
	var currEntNo = 0;
	
	function refreshInfoAll(entNo){
		currEntNo = entNo;
		getEnterInfo(currEntNo);
		refreshRecruitmentInfoList(currEntNo);
		refreshFloorRoomCountList();
	}
	
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
	 
	
	//register
	function registerEnterInfo(){
		 
		$.ajax({
			type : 'post',
			url : '../plan/restEnterInfoRegisterProcess',
			data : $("#regEntInfo").serialize(),
			success : function(json){
				refreshEnterInfoList();
				refreshEnterYearSelect();
				swal('입사정보 등록완료');
				},
			error: function(xhr, status, error){
				swal('error');
				}
		});
	}
	
	function registerRecruitmentInfo(){
		 
		$.ajax({
			type : 'post',
			url : '../plan/restRecruitmentInfoRegisterProcess',
			data : $("#regRecrInfo").serialize(),
			success : function(json){
				refreshRecruitmentInfoList(currEntNo);
				},
			error: function(xhr, status, error){
				swal('error');
				}
		});
	}
	
	
	//register form
	function showEntInfoRegForm(){
		console.log(new Date());
		var entInfoFrm = document.querySelectorAll('#regEntInfo input, #regEntInfo select');
		entInfoFrm.forEach(e => {
			e.disabled = false;
			e.value = "";
		})
		
		var entInfoTextarea = document.querySelectorAll('#regEntInfo textarea');
		entInfoTextarea.forEach(e =>{
			e.disabled = false;
		})
		
		document.getElementById('entNo').disabled = true;
		document.getElementById('entRegDate').value = new Date().toISOString().substring(0, 10);
		
	}
	
	function showRecruitmentInfoForm(){
		var recrInfoFrm = document.querySelectorAll('#regRecrInfo input, #regRecrInfo textarea, #regRecrInfo select');
		recrInfoFrm.forEach(e => {
			e.disabled = false;
			e.value = "";
			
		})
		document.getElementById('recrHiddenEntNo').value = currEntNo;
	}
	
	
	//get info
	function getEnterInfo(entNo){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				document.getElementById('entName').value = jsonObj.ENT_NAME;
				document.getElementById('entNo').value = jsonObj.ENT_NO;
				document.getElementById('entYear').value = jsonObj.ENT_YEAR;
				document.getElementById('entTerm').value = jsonObj.ENT_TERM;
				document.getElementById('entTermDiv').value = jsonObj.ENT_TERM_DIV;
				document.getElementById('openDate').value = dateFormat(jsonObj.OPEN_DATE);
				document.getElementById('closeDate').value = dateFormat(jsonObj.CLOSE_DATE);
				document.getElementById('entRegDate').value = dateFormat(jsonObj.ENT_REG_DATE);
				document.getElementById('entAgreeMsg').value = jsonObj.ENT_AGREE_MSG;
				document.getElementById('entOathMsg').value = jsonObj.ENT_OATH_MSG;
				
				var entInfoInput = document.querySelectorAll('#regEntInfo input, #regEntInfo select, #regEntInfo textarea');
				entInfoInput.forEach(e => {
					e.disabled = true;
				});
				
				document.getElementById('entName2').value = jsonObj.ENT_NAME;
				document.getElementById('entYear2').value = jsonObj.ENT_YEAR;
				document.getElementById('entTerm2').value = jsonObj.ENT_TERM;
			}
			
		}
		xhr.open("post", "./restEnterInfo");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("ent_no=" + entNo);
	}
	
	function getRecruitmentInfo(recrNo){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				document.getElementById('entName2').value = jsonObj.ENT_NAME;
				document.getElementById('entYear2').value = jsonObj.ENT_YEAR;
				document.getElementById('entTerm2').value = jsonObj.ENT_TERM;
				document.getElementById('recrName').value = jsonObj.RECR_NAME;
				document.getElementById('recrDiv').value = jsonObj.RECR_DIV;
				document.getElementById('recrStartDate').value = dateFormat(jsonObj.RECR_START_DATE);
				document.getElementById('recrEndDate').value = dateFormat(jsonObj.RECR_END_DATE);
				document.getElementById('qryStartDate').value = dateFormat(jsonObj.QRY_START_DATE);
				document.getElementById('qryEndDate').value = dateFormat(jsonObj.QRY_END_DATE);
				document.getElementById('rcvStartDate').value = dateFormat(jsonObj.RCV_START_DATE);
				document.getElementById('rcvEndDate').value = dateFormat(jsonObj.RCV_END_DATE);
				document.getElementById('recrMsg').value = jsonObj.RECR_MSG;
				
				var recrInfoInput = document.querySelectorAll('#regRecrInfo input, #regRecrInfo textarea, #regRecrInfo select');
				recrInfoInput.forEach(e => {
					e.disabled = true;
				});
				
				document.getElementById('entName2').disabled = true;
				document.getElementById('entYear2').disabled = true;
				document.getElementById('entTerm2').disabled = true;
			}
		}
		xhr.open("post", "./restRecruitmentInfo");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("recr_no=" + recrNo);
	}
	
	
	function refreshEnterYearSelect(){
		 
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				var entYearSelectBox = document.getElementById('entYearSelect');
				entYearSelectBox.innerHTML = "";
				
				var option1 = document.createElement('option');
				option1.innerText = '(전체)'
				option1.value = 0;
				entYearSelectBox.appendChild(option1);
				
				for(e of jsonObj){
					
					var entYearOption = document.createElement('option');
					entYearOption.innerText = e.ENT_YEAR;
					entYearOption.value = e.ENT_YEAR;
					entYearSelectBox.appendChild(entYearOption);
				}
			}
		}
		xhr.open("post", "./restEntYearList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send();
	 }
	
	
	function refreshBldgSelect(){
		 
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				var bldgSelectBox = document.getElementById('bldgSelect');
				bldgSelectBox.innerHTML = "";
				var option1 = document.createElement('option');
				option1.innerText = '(생활관 전체)'
				option1.value = 'all';
				option1.selected = true;
				bldgSelectBox.appendChild(option1);
				
				for(e of jsonObj){
					
					var bldgOption = document.createElement('option');
					bldgOption.innerText = e.BLDG_NAME;
					bldgOption.value = e.BLDG_CODE;
					bldgSelectBox.appendChild(bldgOption);
				}
			}
		}
		xhr.open("post", "./restBuildingSummaryList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send();
	 }
	
	//refresh list
	function refreshEnterInfoList(){
		
		var options = document.querySelectorAll('#entInfoListFilter select');
		
		var obj = {};
		
		
		
		options.forEach(option => {
	     	obj[option.name] = option.value;
		})
		
		var paramObj = JSON.stringify(obj); 
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var entInfoListBody = document.getElementById('entInfoListBody');
				entInfoListBody.innerHTML = "";
				
				for(e of jsonObj){
					
					var tr = entInfoListBody.insertRow(-1);
					tr.setAttribute('onclick', "refreshInfoAll('" + e.ENT_NO + "')");
					
					var td1 = tr.insertCell(0); 
					td1.classList.add('text-center');
					var td1checkbox = document.createElement('input');
					td1checkbox.type = 'checkbox';
					td1checkbox.name = 'ent_no';
					td1checkbox.classList.add('form-check-input');
					td1checkbox.value = e.ENT_NO;
					td1.appendChild(td1checkbox);
					
					var td2 = tr.insertCell(1); 
					td2.classList.add('text-center');
					td2.innerText = e.ENT_YEAR;
					
					var td3 = tr.insertCell(2); 
					td3.classList.add('text-center');
					td3.innerText = e.ENT_TERM;
					
					var td4 = tr.insertCell(3); 
					td4.classList.add('text-center');
					td4.innerText = e.ENT_TERM_DIV;
					
					var td5 = tr.insertCell(4); 
					td5.innerText = e.ENT_NAME;
					
					var td6 = tr.insertCell(5); 
					td6.classList.add('text-center');
					td6.innerText = dateFormat(e.OPEN_DATE);
					
					var td7 = tr.insertCell(6); 
					td7.classList.add('text-center');
                    td7.innerText = dateFormat(e.CLOSE_DATE);
					
                    
					var td8 = tr.insertCell(7); 
					td8.classList.add('text-center');
					var today = new Date().getTime();
					if(e.OPEN_DATE <= today && today <= e.CLOSE_DATE){
						td8.innerText = '운영';
					}else{
						td8.innerText = '-'; 
					}
					
				}
				
				refreshInfoAll(jsonObj[0].ENT_NO);
			}
		}
		xhr.open("post", "../plan/restEnterInfoList");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramObj);
	}
	
	
	
	//수정중
	function refreshRecruitmentInfoList(entNo){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				var recrInfoListBody = document.getElementById('recrInfoListBody');
				recrInfoListBody.innerHTML = "";
				
				for(e of jsonObj){
					
					var tr = recrInfoListBody.insertRow(-1);
					tr.setAttribute('onclick', "getRecruitmentInfo('"+ e.RECR_NO + "')");
					
					var td1 = tr.insertCell(0); 
					td1.classList.add('text-center');
					var td1checkbox = document.createElement('input');
					td1checkbox.type = 'checkbox';
					td1checkbox.name = 'recr_no';
					td1checkbox.value = e.RECR_NO;
					td1checkbox.classList.add('form-check-input');
					td1.appendChild(td1checkbox);
					
					var td2 = tr.insertCell(1); 
					td2.classList.add('text-center');
					td2.innerText = e.RECR_DIV;
					
					var td3 = tr.insertCell(2); 
					td3.classList.add('text-center');
					td3.innerText = e.ENT_YEAR;
					
					var td4 = tr.insertCell(3); 
					td4.classList.add('text-center');
					td4.innerText = e.ENT_TERM;
					
					var td5 = tr.insertCell(4); 
					td5.innerText = e.RECR_NAME;
					
					var td6 = tr.insertCell(5); 
					td6.classList.add('text-center');
					td6.innerText = e.RECR_DIV + '학년';
					
					var td7 = tr.insertCell(6); 
					td7.classList.add('text-center');
					td7.innerText = dateFormat(e.RECR_START_DATE);
					
					var td8 = tr.insertCell(7); 
					td8.classList.add('text-center');
					td8.innerText = dateFormat(e.RECR_END_DATE);
					
					var td9 = tr.insertCell(8); 
					td9.classList.add('text-center');
					var today = new Date().getTime();
					if(e.RECR_START_DATE <= today && today <= e.RECR_END_DATE){
						td9.innerText = '신청중';
					}else{
						td9.innerText = '마감'; 
					}
				}
				getRecruitmentInfo(jsonObj[0].RECR_NO);
					
			}
		}
		xhr.open("post", "../plan/restRecruitmentInfoList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("ent_no=" + entNo);
	}
 	
	
	
		
	var currFloorCode = null;
	
	function refreshRoomList(floorCode){
		currFloorCode = floorCode;
		
		var totalBedCnt = 0;
		var availableBedCnt = 0;
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				var roomSelectListBody = document.getElementById('roomSelectListBody');
				roomSelectListBody.innerHTML = "";
				
				for(e of jsonObj){
					
					var tr = roomSelectListBody.insertRow(0);
					
					var td1 = tr.insertCell(0); 
					td1.innerText = e.ROOM_CODE;
					
					var td2 = tr.insertCell(1); 
					td2.innerText = e.ROOM_NAME;
					
					var td3 = tr.insertCell(2); 
					td3.innerText = e.ROOM_BED_CNT;
					
					var td4 = tr.insertCell(3);
					var td4checkbox = document.createElement('input');
					td4checkbox.type = 'checkbox';
					td4checkbox.classList.add('form-check-input');
					td4checkbox.name = 'room_use_yn';
					td4checkbox.value = e.ROOM_CODE;
					if(e.ROOM_USE_YN == 'Y'){
						td4checkbox.checked = true;
						availableBedCnt += e.ROOM_BED_CNT;
					}else{
						td4checkbox.checked = false;
					}
					td4.appendChild(td4checkbox);
					
					totalBedCnt += e.ROOM_BED_CNT;
				}
				
				document.getElementById('totalBedCnt2').innerText = totalBedCnt;
				document.getElementById('availableBedCnt').innerText = availableBedCnt;
				
			}
		}
		xhr.open("post", "../plan/restRoomSelectList");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send("floor_code=" + floorCode);
	}
	
	function refreshFloorRoomCountList(){
		
		var option = document.querySelector('#bldgSelect');
		var obj = {};
		
	    obj[option.name] = option.value;

	    var paramObj = JSON.stringify(obj);

		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
					
				var floorRoomCntListBody = document.getElementById('floorRoomCntListBody');
				floorRoomCntListBody.innerHTML = "";
				
				var totalRoomCnt = 0;
				var totalBedCnt = 0;
				
				for(e of jsonObj){
					
					var tr = floorRoomCntListBody.insertRow(-1);
					tr.setAttribute('onclick', "refreshRoomList('" + e.FLOOR_CODE + "')");
					
					var td1 = tr.insertCell(0); 
					td1.innerText = e.FLOOR_CODE;
					
					var td2 = tr.insertCell(1); 
					td2.innerText = e.FLOOR_NAME;
					
					var td3 = tr.insertCell(2); 
					td3.innerText = e.ROOM_CNT;
					
					var td4 = tr.insertCell(3); 
					td4.innerText = e.BED_CNT;
					
					totalRoomCnt += e.ROOM_CNT;
					totalBedCnt += e.BED_CNT;
				}
				
				document.getElementById("totalRoomCnt").innerText = totalRoomCnt;
				document.getElementById("totalBedCnt").innerText = totalBedCnt;
				
				refreshRoomList(jsonObj[0].FLOOR_CODE);
				
				var tr = floorRoomCntListBody.insertRow(-1);
				var td1 = tr.insertCell(0); 
				td1.innerHTML = '&nbsp';
				var td2 = tr.insertCell(1); 
				td2.innerHTML = '&nbsp';
				var td3 = tr.insertCell(2); 
				td3.innerHTML = '&nbsp';
				var td4 = tr.insertCell(3); 
				td4.innerHTML = '&nbsp';
				

					
			}
		}
		xhr.open("post", "../plan/restFloorRoomCountList");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramObj);
	}

	
	function getEntAlloCntSummary(){
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var jsonObj = JSON.parse(xhr.responseText);
				
				var totalAlloM = 0;
				var totalAlloF = 0;
				var totalAllo = 0;
				var totalSelectM = 0;
				var totalSelectF = 0;
				var totalSelect = 0;
				
				
				var entAlloSummaryBody = document.getElementById('entAlloSummaryBody');
				entAlloSummaryBody.innerHTML = "";
				
				for(e of jsonObj){
					
					var tr = entAlloSummaryBody.insertRow(-1);
					
					var td1 = document.createElement('td'); 
					td1.innerText = e.FLOOR_GRADE_DIV;
					
					var td2 = document.createElement('td'); 
					td2.innerText = e.ALLO_CNT_M;
					
					var td3 = document.createElement('td'); 
					td3.innerText = e.ALLO_CNT_F;
					
					var td4 = document.createElement('td'); 
					td4.innerText = e.ALLO_CNT_M + e.ALLO_CNT_F;
					
					var td5 = document.createElement('td'); 
					td5.innerText = e.SLCT_CNT_M;
					
					var td6 = document.createElement('td'); 
					td6.innerText = e.SLCT_CNT_F;
					
					var td7 = document.createElement('td'); 
					td7.innerText = e.SLCT_CNT_M + e.SLCT_CNT_F;
					
					var td8 = document.createElement('td'); 
					td8.innerText = e.ALLO_CNT_M - e.SLCT_CNT_M ;
					
					var td9 = document.createElement('td'); 
					td9.innerText = e.ALLO_CNT_F - e.SLCT_CNT_F;
					
					var td10 = document.createElement('td'); 
					td10.innerText = (e.ALLO_CNT_M - e.SLCT_CNT_M) + ( e.ALLO_CNT_F - e.SLCT_CNT_F);
					
					
					tr.appendChild(td1);
					tr.appendChild(td2);
					tr.appendChild(td3);
					tr.appendChild(td4);
					tr.appendChild(td5);
					tr.appendChild(td6);
					tr.appendChild(td7);
					tr.appendChild(td8);
					tr.appendChild(td9);
					tr.appendChild(td10);
					
					totalAlloM += e.ALLO_CNT_M;
					totalAlloF += e.ALLO_CNT_F;
					totalSelectM += e.SLCT_CNT_M;
					totalSelectF += e.SLCT_CNT_F;
					
					
				}
				
				var entAlloSummaryFoot = document.getElementById('entAlloSummaryFoot');
				var tr = entAlloSummaryFoot.insertRow(-1);
				
				var td1 = document.createElement('td'); 
				td1.innerText = '합계';
				
				var td2 = document.createElement('td'); 
				td2.innerText = totalAlloM;
				
				var td3 = document.createElement('td'); 
				td3.innerText = totalAlloF;
				
				var td4 = document.createElement('td'); 
				td4.innerText = totalAlloM  + totalAlloF;
				
				var td5 = document.createElement('td'); 
				td5.innerText = totalSelectM;
				
				var td6 = document.createElement('td'); 
				td6.innerText = totalSelectF;
				
				var td7 = document.createElement('td');
				td7.innerText = totalSelectM + totalSelectF;
				
				var td8 = document.createElement('td'); 
				td8.innerText = totalAlloM - totalSelectM;
				
				var td9 = document.createElement('td'); 
				td9.innerText = totalAlloF - totalSelectF;
				
				var td10 = document.createElement('td'); 
				td10.innerText = (totalAlloM - totalSelectM) + (totalAlloF - totalSelectF);
				
				tr.appendChild(td1);
				tr.appendChild(td2);
				tr.appendChild(td3);
				tr.appendChild(td4);
				tr.appendChild(td5);
				tr.appendChild(td6);
				tr.appendChild(td7);
				tr.appendChild(td8);
				tr.appendChild(td9);
				tr.appendChild(td10);
				
			}
		}
		xhr.open("post", "../plan/restEntAlloCntSummary");
		xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xhr.send();
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
		
		var paramList = JSON.stringify(checkedList);
		
		var xhr = new XMLHttpRequest();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				
				refreshEnterInfoList();
				refreshRecruitmentInfoList(currEntNo);
				refreshEnterYearSelect();
			}
		}
		xhr.open("post", "./restDeleteProcess");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramList);
	}
 	
 	
 	function updateAvailableRoom(){
 		var updateList = [];
 		var checkboxes = document.querySelectorAll('#roomSelectListBody tr td input');
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
				refreshRoomList(currFloorCode);
				
			}
		}
		xhr.open("post", "./restUpdateAvailableRoom");
		xhr.setRequestHeader("Content-type", "application/json");
		xhr.send(paramList);
 	}
	
 	
 	
 	
	 window.addEventListener("DOMContentLoaded", function (){
		 refreshEnterInfoList();
		 refreshEnterYearSelect();
		 refreshBldgSelect();
		 getEntAlloCntSummary();
		 refreshFloorRoomCountList();
		});
		 
 	
 </script>
</head>
<body>
<jsp:include page="../../staff_common/staffSidebar.jsp"></jsp:include>
<div class="page-content p-3" id="content">
			<div class="row mb-2">
			    <div class="col text-end">
			      <button class="btn btn-primary" onclick="refreshEnterInfoList()">조회</button>
			      <button class="btn btn-primary" onclick="deleteCheckedItems('entInfoListBody')">삭제</button>
			    </div>
			  </div>
			  <div class="row" id="entInfoListFilter">
			  	<div class="col-1 title">입사년도</div>
			    <div class="col">
			      <select onchange="refreshEnterInfoList()" id="entYearSelect" name="ent_year" class="form-select form-select-sm">
			        <option value="0">(전체)</option>
			      </select>
			    </div>
				<div class="col-1 title">입사학기</div>
			    <div class="col">
			      <select onchange="refreshEnterInfoList()" name="ent_term" class="form-select form-select-sm ">
			        <option value="0">(전체)</option>
			        <option value="1">1학기</option>
			        <option value="2">2학기</option>
			      </select>
			    </div>
			    <div class="col-1 title">입사시기</div>
			    <div class="col">
			      <select onchange="refreshEnterInfoList()" name="ent_term_div" class="form-select form-select-sm">
			        <option value="0">(전체)</option>
			        <option value="학기">학기</option>
			        <option value="방학">방학</option>
			      </select>
			    </div>
			  </div>
			  <div class="row my-2">
			    <div class="col">
			      <div class="table-wrapper shadow" style="max-height:15rem;overflow:auto;">
					  <table class="table table-bordered table-sm table-striped mb-0">
					    <thead>
					      <tr>
					        <th><input class="form-check-input" type="checkbox"></th>
					        <th>년도</th>
					        <th>학기</th>
					        <th>입사시기</th>
					        <th>입사모집명</th>
					        <th>개관일</th>
					        <th>폐관일</th>
					        <th>현재운영</th>
					      </tr>
					    </thead>
					    <tbody id="entInfoListBody">
					     <!-- ent info list -->
					    </tbody>
					  </table>
			      </div>
			    </div>
			  </div>

			
			
			
	<ul class="nav nav-tabs mt-4" id="myTab" role="tablist">
      <li class="nav-item" role="presentation">
        <button
          class="nav-link active"
          data-bs-toggle="tab"
          data-bs-target="#entInfoContent"
          type="button"
          role="tab"
          aria-selected="true"
        >
          입사단위정보
        </button>
      </li>
      <li class="nav-item" role="presentation">
        <button
          class="nav-link"
          data-bs-toggle="tab"
          data-bs-target="#roomContent"
          type="button"
          role="tab"
          aria-selected="false"
        >
          사용호실설정
        </button>
      </li>
      <li class="nav-item" role="presentation">
        <button
          class="nav-link"
          data-bs-toggle="tab"
          data-bs-target="#alloContent"
          type="button"
          role="tab"
          aria-selected="false"
        >
          입사선발정원
        </button>
      </li>
      <li class="nav-item" role="presentation">
        <button
          class="nav-link"
          data-bs-toggle="tab"
          data-bs-target="#recrInfoContent"
          type="button"
          role="tab"
          aria-selected="false"
        >
          모집단위정보
        </button>
      </li>
    </ul>
    <div class="tab-content p-3" id="myTabContent">
      <div
        class="tab-pane fade show active"
        id="entInfoContent"
        role="tabpanel"
      >
        <div>
          <div class="row">
			    <div class="col text-end px-3">
			      <button class="btn" onclick="showEntInfoRegForm()">신규</button>
			      <button class="btn" onclick="registerEnterInfo()">저장</button>
			    </div>
			  </div>
          <div class="row">
            <div class="col p-3">
              <form id="regEntInfo">
                <div class="row my-1">
                  <div class="col-1 title">입사모집명</div>
                  <div class="col">
                    <input
                      id="entName"
                      name="ent_name"
                      class="form-control form-control-sm"
                      type="text"
                    />
                  </div>
                  <div class="col-1 title">입사단위번호</div>
                  <div class="col">
                    <input
                      id="entNo"
                      class="form-control form-control-sm"
                      type="text"
                    />
                  </div>
                </div>
                <div class="row my-1">
                  <div class="col-1 title">년도/학기</div>
                  <div class="col">
                    <div class="row g-1">
                      <div class="col">
                        <input
                          id="entYear"
                          name="ent_year"
                          class="form-control form-control-sm"
                          type="text"
                        />
                      </div>
                      <div class="col">
                        <select
                          id="entTerm"
                          name="ent_term"
                          class="form-select form-select-sm"
                        >
                          <option selected disabled>(선택)</option>
                          <option value="1">1학기</option>
                          <option value="2">2학기</option>
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="col-1 title">입사시기</div>
                  <div class="col">
                    <select
                      id="entTermDiv"
                      name="ent_term_div"
                      class="form-select form-select-sm"
                    >
                      <option selected disabled>(선택)</option>
                      <option value="학기">학기중</option>
                      <option value="방학">방학중</option>
                    </select>
                  </div>
                </div>
                <div class="row my-1">
                  <div class="col-1 title">개관일</div>
                  <div class="col">
                    <input
                      id="openDate"
                      name="open_date"
                      class="form-control form-control-sm datepicker"
                      
                    />
                  </div>
                  <div class="col-1 title">폐관일</div>
                  <div class="col">
                    <input
                      id="closeDate"
                      name="close_date"
                      class="form-control form-control-sm datepicker"
                    />
                  </div>
                </div>
                <div class="row my-1">
                  <div class="col-1 title">등록일자</div>
                  <div class="col-5">
                    <input
                      id="entRegDate"
                      class="form-control form-control-sm datepicker"
                    />
                  </div>
                  <div class="col-1 title">현재운영여부</div>
                  <div class="col fs-6 text-start" style="align-self:center">
                    <input class="form-check-input" type="checkbox" />
                  </div>
                </div>
                <div class="row my-1">
                  <div class="col-1 title">개인정보제공<br>동의문구</div>
                  <div class="col">
                    <textarea
                      id="entAgreeMsg"
                      name="ent_agree_msg"
                      class="form-control form-control-sm"
                      rows="3"
                    >
                    </textarea>
                  </div>
                </div>
                <div class="row my-1">
                  <div class="col-1 title">서약서<br>동의문구</div>
                  <div class="col">
                    <textarea
                      id="entOathMsg"
                      name="ent_oath_msg"
                      class="form-control form-control-sm"
                      cols="30"
                      rows="3"
                    ></textarea>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      <div class="tab-pane fade" id="roomContent" role="tabpanel">
        <div class="row">
          <div class="col">
            <div class="row my-2">
              <div class="col">
                <select
                  id="bldgSelect"
                  onchange="refreshFloorRoomCountList()"
                  name="bldg_code"
                  class="form-select form-select-sm"
                >
                  <!-- bldg select list -->
                </select>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div
                  class="table-wrapper shadow"
                  style="max-height: 310px; overflow-y: auto"
                >
                  <table class="table table-bordered table-sm table-striped text-center">
                    <thead class="sticky-top">
                      <tr>
                        <th>층코드</th>
                        <th>호관층명</th>
                        <th>사용가능호실수</th>
                        <th>사용가능인원</th>
                      </tr>
                    </thead>
                    <tbody id="floorRoomCntListBody">
                      <!-- floor room count list -->
                    </tbody>
                    <tfoot class="table-secondary sticky-bottom">
                      <tr>
                        <td scope="col" colspan="2">합계</td>
                        <td id="totalRoomCnt">0</td>
                        <td id="totalBedCnt">0</td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="row mt-2 mb-3">
              <div class="col text-end">
                <button class="btn btn-primary" onclick="updateAvailableRoom()">
                  저장
                </button>
              </div>
            </div>
            <div class="row">
              <div class="col">
                <div class="table-wrapper shadow">
                  <table class="table table-bordered table-sm table-striped text-center">
                    <thead>
                      <tr>
                        <td>호실코드</td>
                        <td>호실명</td>
                        <td>수용가능인원</td>
                        <td>사용여부</td>
                      </tr>
                    </thead>
                    <tbody id="roomSelectListBody">
                      <!-- room select list -->
                    </tbody>
                    <tfoot class="table-secondary">
                      <tr>
                        <td scope="col" colspan="2">합계</td>
                        <td id="totalBedCnt2">0</td>
                        <td id="availableBedCnt">0</td>
                      </tr>
                    </tfoot>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tab-pane fade" id="alloContent" role="tabpanel">
        <div class="row mb-2">
          <div class="col text-end">
            <button class="btn btn-primary">저장</button>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="table-wrapper shadow">
              <table class="table table-bordered table-sm table-striped text-center">
                <thead>
                  <tr>
                    <th scope="col" rowspan="2">학년</th>
                    <th scope="col" colspan="3">배정인원</th>
                    <th scope="col" colspan="3">선발현황</th>
                    <th scope="col" colspan="3">미선발인원</th>
                  </tr>
                  <tr>
                    <th>남자</th>
                    <th>여자</th>
                    <th>소계</th>
                    <th>남자</th>
                    <th>여자</th>
                    <th>소계</th>
                    <th>남자</th>
                    <th>여자</th>
                    <th>소계</th>
                  </tr>
                </thead>
                <tbody id="entAlloSummaryBody">
                  <!-- ent allo summary -->
                </tbody>
                <tfoot id="entAlloSummaryFoot" class="table-secondary">
                 <!-- ent allo summary total -->
                </tfoot>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="tab-pane fade" id="recrInfoContent" role="tabpanel">
        <div class="row mb-2">
          <div class="col text-end">
            <button class="btn btn-primary" onclick="showRecruitmentInfoForm()">
              신규
            </button>
            <button
              class="btn btn-primary"
              onclick="deleteCheckedItems('recrInfoListBody')"
            >
              삭제
            </button>
            <button class="btn btn-primary" onclick="registerRecruitmentInfo()">
              저장
            </button>
          </div>
        </div>
        <div class="row">
          <div class="col">
            <div class="table-wrapper shadow">
              <table class="table table-bordered table-sm table-striped">
                <thead class="">
                  <tr>
                    <th><input class="form-check-input" type="checkbox" /></th>
                    <th>차수</th>
                    <th>년도</th>
                    <th>학기</th>
                    <th>모집단위명</th>
                    <th>신청자구분</th>
                    <th>신청시작</th>
                    <th>신청종료</th>
                    <th>모집마감</th>
                  </tr>
                </thead>
                <tbody id="recrInfoListBody">
                  <!-- recr info List -->
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <div class="row my-3">
          <div class="col">
            <div class="row my-2">
              <div class="col-1 title">입사단위명</div>
              <div class="col">
                <input
                  id="entName2"
                  name="ent_name"
                  class="form-control form-control-sm"
                  type="text"
                />
              </div>
              <div class="col-1 title">년도/학기</div>
              <div class="col">
                <div class="row g-1">
                  <div class="col">
                    <input
                      id="entYear2"
                      class="form-control form-control-sm"
                      type="text"
                    />
                  </div>
                  <div class="col">
                    <input
                      id="entTerm2"
                      class="form-control form-control-sm"
                      type="text"
                    />
                  </div>
                </div>
              </div>
            </div>
            <form id="regRecrInfo">
              <input type="hidden" id="recrHiddenEntNo" name="ent_no" />
              <div class="row my-1">
                <div class="col-1 title">모집단위명</div>
                <div class="col">
                  <input
                    id="recrName"
                    name="recr_name"
                    class="form-control form-control-sm"
                    type="text"
                  />
                </div>
                <div class="col-1 title">신청자구분</div>
                <div class="col">
                  <select
                    id="recrDiv"
                    name="recr_div"
                    class="form-select form-select-sm"
                  >
                    <option selected disabled>(선택)</option>
                    <option value="1">1학년</option>
                    <option value="2">2학년</option>
                    <option value="3">3학년</option>
                    <option value="4">4학년</option>
                  </select>
                </div>
              </div>
              <div class="row my-1">
                <div class="col-1 title">입사신청기간</div>
                <div class="col">
                  <input
                    id="recrStartDate"
                    name="recr_start_date"
                    class="form-control form-control-sm datepicker"
                  />
                </div>
                <div class="col-1 title" style="text-align: center">~</div>
                <div class="col">
                  <input
                    id="recrEndDate"
                    name="recr_end_date"
                    class="form-control form-control-sm datepicker"
                  />
                </div>
              </div>
              <div class="row my-1">
                <div class="col-1 title">선발조회기간</div>
                <div class="col">
                  <input
                    id="qryStartDate"
                    name="qry_start_date"
                    class="form-control form-control-sm datepicker"
                  />
                </div>
                <div class="col-1 title" style="text-align: center">~</div>
                <div class="col">
                  <input
                    id="qryEndDate"
                    name="qry_end_date"
                    class="form-control form-control-sm datepicker"
                  />
                </div>
              </div>
              <div class="row my-1">
                <div class="col-1 title">납부기간</div>
                <div class="col">
                  <input
                    id="rcvStartDate"
                    name="rcv_start_date"
                    class="form-control form-control-sm datepicker"
                  />
                </div>
                <div class="col-1 title" style="text-align: center">~</div>
                <div class="col">
                  <input
                    id="rcvEndDate"
                    name="rcv_end_date"
                    class="form-control form-control-sm datepicker"
                  />
                </div>
              </div>
              <div class="row my-1">
                <div class="col-1 title">모집안내문구</div>
                <div class="col">
                  <textarea
                    id="recrMsg"
                    name="recr_msg"
                    class="form-control form-control-sm"
                    cols="30"
                    rows="3"
                  ></textarea>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
      </div>
    </div><!-- page content end -->
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>