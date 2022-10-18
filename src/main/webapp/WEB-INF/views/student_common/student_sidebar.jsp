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
			}
		}
	});
</script>


               
<div style="position: absolute; top: 10.5%; left: 1.5%; height: 89.5vh; width: 12vw;">

		<div class="text-center pe-0 mx-0"
			style="background-color: #005b9e; height: 9vh; color: white; display: flex; align-items: center; justify-content: center;">
			<p class="mb-0" id="bigMenuText" style="font-weight: bold">Dormitory</p>
		</div>
		
		<div style="border:1px solid #d9d9d9; padding-top:1.5vh; background-color: #f8f9fa" id="sideBar">
			<ul style="list-style: none;">

				<li>
					<ul>
						<li><div class="unselectedSmallCategory" onclick="location.href='/dormitory/student/dormitoryEnterApplication/dormitoryEnterApplicationPage'"><i class="bi bi-dot"></i>입사자신청</div></li>
						<li><div class="unselectedSmallCategory" onclick="location.href='/dormitory/student/dormitoryLife/studentAssortmentPage'"><i class="bi bi-dot"></i>입사자내역</div></li>
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