<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
		var unselectedSmallCategory = document.getElementsByClassName('unselectedSmallCategory');
		var nowPage = "${pageContext.request.requestURI}".split('/')["${pageContext.request.requestURI}".split('/').length-1];
		
		for(elm of unselectedSmallCategory){
			if( (elm.getAttribute("onClick").split('/'))[4].replace("'",".jsp") == nowPage){
				elm.id="selectedSmallCategory";
				elm.firstChild.className='bi bi-check-lg';
				elm.removeAttribute('onClick');
				elm.parentNode.parentNode.previousElementSibling.id='selectedBigCategory';
			}
		}
	});
</script>


               
<div style="position: absolute; top: 10.5%; left: 1.5%; height: 89.5vh; width: 12vw;">

		<div class="text-center pe-0 mx-0"
			style="background-color: #005b9e; height: 9vh; color: white; display: flex; align-items: center; justify-content: center;">
			<p class="mb-0" id="bigMenuText" style="font-weight: bold">Dormitory</p>
		</div>
		
		<div style="border:1px solid #d9d9d9; background-color: #f8f9fa" id="sideBar">
			<ul style="list-style: none;">
				<li style="margin-top: 1vh; margin-bottom: 1vh">
					<!-- 아래 div 내부 전부 복사 -->
					<div class="unselectedBigCategory">기본정보</div>
					<ul>
						<li>
							<!-- div태그 style 아래랑 교환, i태그도 교환 -->
							<div class="unselectedSmallCategory" onclick="location.href='/dormitory/staff/plan/dormitoryInfoPage'"></i><i class="bi bi-dot"></i>생활관호실정보관리</div>
						</li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div class="unselectedBigCategory">입사계획</div>
					<ul>
						<li>
							<div class="unselectedSmallCategory" onclick="location.href='/dormitory/staff/plan/planRegisterPage'"><i class="bi bi-dot"></i>입사계획관리</div>
						</li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div class="unselectedBigCategory">입사자관리</div>
					<ul>
						<li><div class="unselectedSmallCategory" onclick="location.href=''"><i class="bi bi-dot"></i>입사신청</div></li>
						<li><div class="unselectedSmallCategory" onclick="location.href='/dormitory/staff/dormitoryEnterApproval/dormitoryEnterApprovalPage'"><i class="bi bi-dot"></i>입사자관리</div></li>
						<li><div class="unselectedSmallCategory" onclick="location.href=''"><i class="bi bi-dot"></i>기숙사비납부관리</div></li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div class="unselectedBigCategory">호실배정관리</div>
					<ul>
						<li><div class="unselectedSmallCategory" onclick="location.href=''"><i class="bi bi-dot"></i>호실배정관리</div></li>
					</ul>
				</li>
<!-- 				<li class="border-top my-2" style="padding: 0"></li> -->
				<li>
					<div class="unselectedBigCategory">입사생활</div>
					<ul>
						<li><div class="unselectedSmallCategory" onclick="location.href=''"><i class="bi bi-dot"></i>외박활동신청</div></li>
						<li><div class="unselectedSmallCategory" onclick="location.href=''"><i class="bi bi-dot"></i>외박활동처리</div></li>
						<li><div class="unselectedSmallCategory" onclick="location.href=''"><i class="bi bi-dot"></i>입사자종합</div></li>
					</ul>
				</li>
				
				
			</ul>
		</div>	
</div>

<!-- 메인페이지 - 직원: 메인이 생활관호실정보관리로 연결 -->
<!-- 		  학생: 공지사항, 자유게시판, 다른메뉴링크 알아서 -->
<!-- 입사자신청 -->

<!-- 외박활동신청 -->

<!-- 입사자종합 -->