<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사신청서</title>
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_student_MainPage.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
  <style type="text/css">
  	#category{
  		
  		border: 1px solid;
  		border-color: #edeef0;
  		background-color: white;
  		border-radius: 10px;
  	}
  	
  	#inputBox{
	
		border: 1px solid;
		border-color:  #edeef0;
		border-radius: 5px;
	}
	
	#categoryname{
		font-size: 1.3rem;
	}
	


	
  </style>
  <!--  우편 api -->
  <script>
 		 //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	    function stud_post() {
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
	                document.getElementById('stud_zipcode').value = data.zonecode;
	                document.getElementById("stud_addr1").value = roadAddr;
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
	                document.getElementById('grdn_zipcode').value = data.zonecode;
	                document.getElementById("grdn_addr1").value = roadAddr;
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
	    
	    function applicate() {
	    	var agree_yn = document.querySelector('input[name="agree_yn"]:checked').value;
	    	var oath = document.querySelector('input[name="oath_yn"]:checked').value;
	    	
	    	
	    	if(oath == 'agree' && agree_yn == 'agree'){	
	    		document.getElementById('applicationProcess').submit();
	    	}else{
	    		alert('필수 사항에 동의하지 않으면 신청이 불가합니다.')

	    	}
			
		}
	    
	    function test1(){
	    	
	    	
	    }
	   
	    
  
</script>


</head>

<body>
<!-- 페이지 내용 부분 시작 (이 부분만 카피해서 사용할것. 카피 후 삭제)  -->
  <jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>
   <div class="page-content p-3" id="content" style=" background-color: rgb(235,235,235)">
	

      
      <div class="card" style="width:100%; border-radius:10px; font-size:12px;;">
         <div class="dashboard-card-bottom" >
           <!-- 실제 내용 -->
           		<div class="row" style="margin:2%" >
			<div class="col">
				<c:if test="${pageResult=='already'}">
				<div class="row mt-3">
					<div class="col">
					</div>
					<div class="col">
					</div>
					<div class="col">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
					</div>
					<div class="col-6">
					<h1 style="text-align: center;"><span style="color: red;">신청</span> 완료되었습니다.</h1>
					</div>
					<div class="col">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
					</div>
					<div class="col">
					</div>
				</div>
				
				</c:if>
				<c:if test="${pageResult=='deny'}">
				<div class="row mt-3">
					<div class="col">
					</div>
					<div class="col">
					</div>
					<div class="col">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
					</div>
					<div class="col-8">
					<h1 style="text-align: center;"><span style="color: red;">모집기간</span>을 다시 확인 해주세요</h1>
					</div>
					<div class="col">
					</div>
				</div>
				<div class="row mt-3">
					<div class="col">
					</div>
					<div class="col">
					</div>
				</div>
				
				</c:if>
				<c:if test="${pageResult=='success'}">
				
				<!-- 여기다 작성하세요 -->
				<div class="row" >
					<div class="col">
<!--------------------------------------입사단위 정보시작 ------------------------------------------->
							<form id ="applicationProcess" action="./applicationProcess" method="post">
						<input name="stud_id" type="hidden" value="${sessionStudentInfo.stud_id}">
						<input name="recr_no" type="hidden" value="${RecrInfo.recr_no }">
						<div class="row mt-3 mb-3">
							<div class="col" >
								<span id="categoryname">입사단위 정보</span>
								<div class="row mt-1" id="category">
									<div class="row mt-1">
										<div class="col">
										입사단위정보
										</div>
										
										<div class="col" id="inputBox">
											${DmtEntInfo.ent_name }
										</div>
										<div class="col"></div>
										<div class="col">
										모집단위명
										</div>
										<div class="col" id="inputBox">
											${RecrInfo.recr_name }
										</div>
										<div class="col"></div>
										<div class="col">
										입사시기
										</div>
										<div class="col" id="inputBox">
											${DmtEntInfo.ent_term_div }
										</div>	
									</div>
									<div class="row mt-1">
										<div class="col">
										학년도
										</div>
										<div class="col" id="inputBox">
											${DmtEntInfo.ent_year }
										</div>
										<div class="col"></div>
										<div class="col">
										신청학생구분
										</div>
										<div class="col" id="inputBox">
											${RecrInfo.recr_div }
										</div>	
										<div class="col"></div>
										<div class="col">
										입사학기
										</div>
										<div class="col" id="inputBox">
											${DmtEntInfo.ent_term }
										</div>												
									</div>
									<div class="row mt-1">
										<div class="col">
										신청기간
										</div>
										<div class="col" id="inputBox">
											${RecrInfo.recr_start_date }~${RecrInfo.recr_end_date }
										</div>
										<div class="col"></div>	
										<div class="col">
										개관기간
										</div>
										<div class="col" id="inputBox">
											${DmtEntInfo.open_date }
										</div>
										<div class="col"></div>	
										<div class="col">
										폐관일
										</div>
										<div class="col" id="inputBox">
											${DmtEntInfo.close_date }
										</div>				
									</div>
									<div class="row mt-1 mb-1">
										<div class="col-1">
										모집단위안내문구
										</div>
										<div class="col" id="inputBox">
											${RecrInfo.recr_msg }
										</div>
									</div>
								</div>
							</div>
						</div>
<!--------------------------------------입사단위 정보 끝 ------------------------------------------->
<!--------------------------------------신청정보 시작 ------------------------------------------->
					 
					 	<div class="row mt-3 mb-3">
							<div class="col" >
								<span id="categoryname">신청 정보</span>
								<div class="row mt-1"  id="category">
									<div class="row mt-1">
										<div class="col-1">
										학번
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_id}
										</div>
										<div class="col-1"></div>
										<div class="col-1">
										이름
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_name}
										</div>
										<div class="col-1"></div>
										<div class="col-1">
										성별
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_gender}
										</div>		
									</div>
									
									<div class="row mt-1">
										<div class="col-1">
										학과
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_dept}
										</div>
										<div class="col-1"></div>
										<div class="col-1">
										학년
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_grade}
										</div>			
									</div>
									<div class="row mt-1">
										
										<div class="col-1">
										봉사시간
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_vlntr_time}
										</div>
										<div class="col-1"></div>	
										<div class="col-1">
										학적상태
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_state}
										</div>		
									</div>
									<div class="row mt-1">
										<div class="col-1">
										생활관 1지망
										</div>
										<div class="col-2" style="padding: 0;">
											<select name="appl_choice">
												<option value='Nselect'>1지망선택</option>

											<c:if test='${sessionStudentInfo.stud_gender == "남자"}'>
												<option value="A">A관</option>
												<option value="B">B관</option>
												<option value="C">C관</option>
											</c:if>
											<c:if test='${sessionStudentInfo.stud_gender == "여자"}'>
												<option value="D">D관</option>
												<option value="E">D관</option>
												<option value="F">F관</option>	
											</c:if>
											</select>
										</div>		
									</div>
									<div class="row mt-1 mb-1">
										<div class="col">
										<span style="color: red;"> *지망을 선택하지 않을시 호관이 자동배정 됩니다.</span>
										</div>
									</div>
								</div>
							</div>
						</div>
<!--------------------------------------신청정보 끝 ------------------------------------------->
<!--------------------------------------내 정보 시작 ------------------------------------------->
	 					
	 					<div class="row mt-3 mb-3">
							<div class="col" >
								<span id="categoryname">내 정보</span>
								<div class="row" id="category">
									<div class="row mt-1">
										<div class="col-1">
										휴대전화
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_phone}
										</div>
										<div class="col-1"></div>
										<div class="col-1">
										E-mail
										</div>
										<div class="col-2" id="inputBox">
											${sessionStudentInfo.stud_email}
										</div>		
									</div>
									<div class="row mt-1">
										<div class="col-1">
										우편번호
										</div>
										<div class="col-2" style=" padding: 0;" >
										<input name="stud_zipcode" type="text" id="stud_zipcode" style="background-color: #EEEEEE; border-color:#EEEEEE; border-radius: 5px;" placeholder="우편번호">
										</div>
										<div class="col-2" style="padding: 0;" >
										<input type="button" onclick="stud_post()" value="우편번호 찾기"><br>
										</div>
									</div>
									<div class="row mt-1 mb-1">
										<div class="col-1">
										주소
										</div>
										<div class="col-3" style=" padding: 0;">
										<input type="text" name="stud_addr1" id="stud_addr1" placeholder="도로명주소" style="width:250px;border-color:#EEEEEE; background-color: #EEEEEE; border-radius: 5px;">
										</div>
									
										<div class="col-1">
										상세주소
										</div>
										<div class="col-3" style="padding: 0;">
										<input type="text" name="stud_addr2" id="stud_addr2" placeholder="상세주소" style="width:180px; background-color: #EEEEEE;border-color:#EEEEEE; padding:0; border-radius: 5px;">
										</div>
									</div>
								</div>
							</div>
						</div>
<!--------------------------------------내정보 끝 ------------------------------------------->
<!--------------------------------------보호자 정보 시작 ------------------------------------------->
	 					<div class="row mt-3 mb-3">
							<div class="col" >
								<span id="categoryname">보호자 정보</span>
								<div class="row" id="category">
									<div class="row mb-1 mt-1">
										<div class="col-1" >
										보호자 성명
										</div>
										<div class="col-2" style="padding: 0;">
											<input name="grdn_name" type="text" style="background-color: #EEEEEE;border-color:#EEEEEE; border-radius: 5px;">
										</div>
										<div class="col-1"></div>
										<div class="col-1" >
										보호자관계
										</div>
										<div class="col-2" style="padding: 0;">
											<input name="grdn_relation" type="text" style="background-color: #EEEEEE;border-color:#EEEEEE; border-radius: 5px;">
										</div>
										<div class="col-1"></div>	
										<div class="col-1" >
										보호자휴대폰
										</div>
										<div class="col-2" style="padding: 0;">
											<input name="grdn_phone" type="text" style="background-color: #EEEEEE;border-color:#EEEEEE; border-radius: 5px;">
										</div>	
									</div>
									<div class="row mb-1">
										<div class="col-1">
										우편번호
										</div>
										<div class="col-2" style="padding: 0;">
										<input type="text" name="grdn_zipcode" id="grdn_zipcode" style="background-color: #EEEEEE;border-color:#EEEEEE; border-radius: 5px;" placeholder="우편번호">
										</div>
										<div class="col-2" style="padding: 0;" >
										<input type="button" onclick="grdn_post()" value="우편번호 찾기"><br>
										</div>
									</div>
									<div class="row mb-1">
										<div class="col-1">
										주소
										</div>
										<div class="col-3" style="padding: 0;" >
										<input type="text" name="grdn_addr1" id="grdn_addr1" placeholder="도로명주소" style="width:250px; border-radius: 5px;border-color:#EEEEEE; background-color: #EEEEEE; ">
										</div>
									
										<div class="col-1">
										상세주소
										</div>
										<div class="col-3" style="padding: 0;" >
										<input type="text" name="grdn_addr2" id="grdn_addr2" placeholder="상세주소" style="width:180px; border-radius: 5px;border-color:#EEEEEE; background-color: #EEEEEE; ">
										</div>
									</div>
								</div>
							</div>
						</div>
<!--------------------------------------보호자 정보 시작 ------------------------------------------->
<!--------------------------------------개인정보제공 동의서 시작------------------------------------------->
						<div class="row mt-3 mb-3">
							<div class="col" >
								<div class="row">
								<span id="categoryname">개인정보 제공동의서</span>
								</div>
								<div class="row" id="category">
									<div class="col" style="overflow: scroll;">						
									    ${DmtEntInfo.ent_agree_msg } 
									</div>
								</div>
								<div class="row">
									<div class="col"  style="text-align: right;">						
										본인은 개인정보 수집 및 이용에 대해
										 &nbsp;[&nbsp; <input name="agree_yn" value="agree" type="radio" checked>&nbsp;동의&nbsp;
										 <input name="agree_yn" value="disagree" type="radio">&nbsp;비동의&nbsp;
										 &nbsp;]&nbsp; 합니다.
									</div>
								</div>
							</div>
						</div>
<!--------------------------------------개인정보제공 동의서 끝 ------------------------------------------->
<!--------------------------------------서약서 시작 ------------------------------------------->
						<div class="row mt-3 mb-3">
							<div class="col" >
								<div class="row">
								<span id="categoryname">서약서</span>
								</div>
								<div class="row" id="category">
									<div class="col" style="overflow: scroll;">						
									    ${DmtEntInfo.ent_oath_msg }
									</div>
								</div>
								<div class="row">
									<div class="col" style="text-align: right;">						
										본인은 개인정보 수집 및 이용에 대해
										  &nbsp;[ &nbsp;<input  name="oath_yn" value="agree" type="radio" checked> &nbsp;동의 &nbsp;
										 <input  name="oath_yn" value="disagree" type="radio"> &nbsp;비동의 &nbsp;
										  &nbsp;] &nbsp; 합니다.
									</div>
								</div>
							</div>
						</div>
						
					
<!--------------------------------------서약서 끝 ------------------------------------------->
						<div class="row">
							<div class="col mb-3"  style=" text-align: right;">
								<button type="button" class="btn btn-outline-dark" onclick="applicate()">신청</button>
							</div>
						</div>
						</form>
					</div>
				</div>

				<!-- 여기다 작성하세요 -->
				</c:if>				
			</div>
		</div>
           <!--  card height은 임의로 조절 -->
         </div>
      </div>
   </div>




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>