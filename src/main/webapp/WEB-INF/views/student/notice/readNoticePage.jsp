<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<link rel="stylesheet" 
 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"> 
 <link rel="stylesheet" href="/dormitory/resources/css/staff_MainPage.css"> 
 <link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
<style type="text/css">

#title{
	font-size: 1.8em;
	font-weight: bold;
    margin-left: 1em;
    margin-bottom: 1em;
	
}

.title1{
    color: #292929;
    margin-top: 2em;
    text-align: center;
    font-size: 1.5em;
    font-weight: bold;
}

#span{
	text-align: center;
}

.writeInfo1{
	color: #757575;
	font-size: 0.8em;
}
.writeInfo2{
	color: #757575;
	font-size: 0.8em;
}
.writeInfo3{
	
	color: #757575;
	font-size: 0.8em;
	
}
.img1{
	position: relative;
	left: 80em;
}
.img2{
	position: relative;
	left: 77em;
	bottom: 32px;
}
.content{
	padding: 20px;
	text-align: center;
}
.listbtn{
	position: relative;
	left: 10px;
	top: 35px;
  border-color: #6C758A;
  color: #495057;
  font-size: 0.8rem;
  background-color: #f1f1f1;
  padding: 0.2rem 0.7rem;
}


</style>
</head>
<body>

<div class="container-fluid">

<jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>

			<div class="page-content p-5" id="content">
		      
      
      <div class="card" style="width:90%; height:88rem; border-radius:10px;">
         <div class="dashboard-card-bottom" >
			
			
			
					<div class="row" style="margin-top: 1em;">
						<div id="title" class="col">
							 공지사항 
						</div>
					</div>
					<div class="row border-top border-1 border-dark" style="margin: auto;">
                        <div class="col title1">
                            <p>${dataList.noticeVo.notice_title }</p>
                        </div>
                    </div>
					
						<div class="row">
							<div class="col">
								<div class="writeInfo1" id="span">작성자 ${dataList.staffVo.staff_name } |
                            	등록일 <fmt:formatDate value="${dataList.noticeVo.notice_reg_dt }" pattern="yy.MM.dd"/>
                            	| 조회수  ${dataList.noticeVo.notice_readcount }
                            	</div> 
							</div>
						</div>
                         <div class="list">
                         	<button type="button" class="btn listbtn" onclick="location.href= './noticePage;'">목록</button>
                         </div>  
                        <div class="img1">
                            <img src="https://www.hanyang.ac.kr/html-repositories/images/custom/bbs/share_fb.gif" alt="페이스북 공유하기" title="페이스북 공유하기">
                       </div>
                       <div class="img2" >
                        	<img src="https://www.hanyang.ac.kr/html-repositories/images/custom/bbs/share_twt.gif" alt="페이스북 공유하기" title="페이스북 공유하기">
                       </div>
					
                    
					<div class="row border-top" style="font-size: 1em; margin: auto;">
                        <div class="content">
                            ${dataList.noticeVo.notice_content }
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