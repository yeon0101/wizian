<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
	
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />
	<style>
	.contentRow{
      font-size:0.8rem;
   }
   table{
    width: 100%;
    border-collapse: collapse;
    }
	
	thead{
		text-align: center;
		position: relative;
	}
	thead tr{
	 position: sticky;
	  top: 0;
  	background-clip: padding-box;
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
	
	.shadow{
	box-shadow: 0 .125rem .25rem rgba(0,0,0,.20)!important;
	}
	#tableOnRow{
		border :1px solid #dee2e6; 
		height: 480px;
		overflow: auto;
		
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
			resize: both;ssss
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
	.form-control-sm {
    font-size: 0.7rem;
    }
 </style>
	
<script type="text/javascript">
function searchStud() {
	var entNo = document.getElementById("entInfoList").value;
	var roomCD = document.getElementById("room").value;
	var id = document.getElementById("studID").value;
	var name = document.getElementById("studNM").value;
	
	var tempValue = "";
	tempValue += "?ent_no="+entNo;
	
	if(roomCD != '' && id != '' && name != ''){
		tempValue += "&room_code="+roomCD + "&stud_id="+id +"&stud_name="+name;
	}else if((roomCD != '' && id != '') || (id != '' && roomCD != '')){
		tempValue += "&room_code="+roomCD + "&stud_id="+id;
	}else if((id != '' && name != '') || (name != '' && id != '')){
		tempValue += "&stud_id="+id+ "&stud_name="+name;
	}else if((name != '' && roomCD != '') || ( roomCD != '' && name != '')){
		tempValue += "&stud_name="+name + "&room_code="+roomCD;
	}else if(roomCD != ''){
		tempValue += "&room_code="+roomCD
	}else if(id != ''){
		tempValue += "&stud_id="+id
	}else if(name != ''){
		tempValue += "&stud_name="+name
	}
	
	var xhr = new XMLHttpRequest(); //AJAX 객체 생성
	xhr.onreadystatechange = function () { // 콜백함수
		if(xhr.readyState == 4 && xhr.status == 200){
			var jsonObj = JSON.parse(xhr.responseText); //xhr.responseText = 응답 결과 텍스트(JSON)
			
			 var ListTableBox = document.getElementById("tableRow")
		     ListTableBox.innerHTML="";	
			
		    var tableBox = document.createElement("table")
		    tableBox.classList.add("table")
		    tableBox.classList.add("table-sm")
		    tableBox.classList.add("table-striped")
		    tableBox.setAttribute("id", "tabled")

		    var theadBox = document.createElement("thead")
		    tableBox.appendChild(theadBox)

		    var trBox = document.createElement("tr")
			theadBox.appendChild(trBox)

		    var thBox1 = document.createElement("th")
		    thBox1.setAttribute("scope","col")
		    trBox.appendChild(thBox1)

		    var thBox2= document.createElement("th")
		    thBox2.setAttribute("scope","col")
		    thBox2.innerText = "학번"
		    trBox.appendChild(thBox2)

		    var thBox3= document.createElement("th")
		    thBox3.setAttribute("scope","col")
		    thBox3.innerText = "이름"
		    trBox.appendChild(thBox3)

		    var thBox4= document.createElement("th")
		    thBox4.setAttribute("scope","col")
		    thBox4.innerText = "학과"
		    trBox.appendChild(thBox4)

		    var thBox5= document.createElement("th")
		    thBox5.setAttribute("scope","col")
		    thBox5.innerText = "학년"
		    trBox.appendChild(thBox5)

		    var thBox6= document.createElement("th")
		    thBox6.setAttribute("scope","col")
		    thBox6.innerText = "입사명"
		    trBox.appendChild(thBox6)

		    var thBox7= document.createElement("th")
		    thBox7.setAttribute("scope","col")
		    thBox7.innerText = "호실"
		    trBox.appendChild(thBox7)
		    
		    var tbodyBox = document.createElement("tbody")
			tableBox.appendChild(tbodyBox)
		          
			for(studValue of jsonObj.data){
	          var tr2Box = document.createElement("tr")
	          tr2Box.setAttribute("onclick","mouseEvent(this), getValue("+studValue.STUD_ID+")"); ///뭔 이벤트 줘야하징
			  tbodyBox.appendChild(tr2Box)

	           var th2Box = document.createElement("th")
			   th2Box.setAttribute("scope","row")
			   tr2Box.appendChild(th2Box)
	           		
	           var tdBox1 = document.createElement("td") //학번
	           tdBox1.innerText = studValue.STUD_ID
	           tr2Box.appendChild(tdBox1)

	           var tdBox2 = document.createElement("td") //이름
	           tdBox2.innerText =studValue.STUD_NAME
	           tr2Box.appendChild(tdBox2)

	           var tdBox3 = document.createElement("td") //힉과
	           tdBox3.innerText = studValue.STUD_DEPT
	           tr2Box.appendChild(tdBox3)

	           var tdBox4 = document.createElement("td") //학년
	           tdBox4.innerText = studValue.STUD_GRADE
	           tr2Box.appendChild(tdBox4)

	           var tdBox5 = document.createElement("td") //입사명
	           tdBox5.innerText = studValue.ENT_NAME
	           tr2Box.appendChild(tdBox5)
	           
	           var tdBox6 = document.createElement("td") //호실
	           tdBox6.innerText =  studValue.ROOM_CODE
	           tr2Box.appendChild(tdBox6)
			}
			ListTableBox.appendChild(tableBox)//맨마지막	
		}
	}
	xhr.open("get" , "./searchStud"+ tempValue);
	//xhr.setRequestHeader("Content-type","application/x-www-form-urlencoded"); //Post
	xhr.send();
}
function mouseEvent(obj) {
	var table = document.getElementById("tabled");
	var tr = table.getElementsByTagName("tr");
	for(var i=0; i<tr.length; i++){
		tr[i].style.background = "white";
	}
	obj.style.backgroundColor = "#FCE6E0";
}

var value = "";
function getValue(tempVa) {

	value = tempVa;
}
function moveToPa() {
	if(value == ""){
		swal("","학생을 선택해주세요.", "warning");
		return;
	}else{
		opener.call(value);
	    window.close();
	}
}

window.addEventListener("DOMContentLoaded",function(){
	searchStud();
});
</script>	
</head>
<body>
<div class="container-fluid" >
<div class="row" >
<div class="col">
	<div class="row my-2">
    	<div class="col text-end">
  			<button class="btn btn-primary" onclick="searchStud()">검색</button>
  			<button class="btn btn-primary" onclick="moveToPa()">선택</button>
  			<button class="btn btn-primary" onclick="self.close();">딛기</button>
   		</div>
	</div>
	<div class="row contentRow mx-1" >
		<div class="col py-2" style="background-color:#fdefc3;">
			<div class="row mb-1">
				<div class="col-2 p-0 text-end" >입사명</div>
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
				<div class="col-2 p-0 text-end">호실</div>
				<div class="col"><input class="form-control form-control-sm" id="room"></div>
			</div>
			<div class="row">
				<div class="col-2 p-0 text-end">학번</div>
				<div class="col"><input class="form-control form-control-sm" id="studID"></div>
				<div class="col-2 p-0 text-end">이름</div>
				<div class="col"><input class="form-control form-control-sm" id="studNM"></div>
			</div>
		</div>
	</div>
	
	
	<div class="row py-2"></div>
	
	<div class="row contentRow mx-1" id="tableOnRow" >
		<div class="col">
			<div class="row" id="tableRow">
		         <table class="table table-borderless table-sm table-striped" >
		            <thead>
		              <tr>
		              	<th scope="col"></th>
		                <th scope="col">학번</th>
		                <th scope="col">이름</th>
		                <th scope="col">학과</th>
		                <th scope="col">학년</th>
		                <th scope="col">입사명</th>
		                <th scope="col">호실</th>
		              </tr>
		            </thead>
		          </table>
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