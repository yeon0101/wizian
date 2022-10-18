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
 <link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css"> 
 <link rel="stylesheet" 
 	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css"> 
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">

	
	#content{
		font-size: 0.9em;
		
	}
	
	#table {
	    margin-left:auto; 
	    margin-right:auto;
	    text-align: center;
	}


	#ex_select {
	     width:100px;
	     padding:3px;
	     border:1px solid #999;
	     height: 30px;
	     border-radius:3px;
	}

	.selectbox{
		margin-left: 3em;
	}
	
	.search-box{
		margin-left: 35em;
		
	}
	
	.search-txt{
	  box-shadow: 2px 2px 2px gray;
	   border-radius: 20px; 
	}
	
	.search-btn{
	  box-shadow: 2px 2px 2px gray;
	  border-radius: 20px; 
	}
	
	.page_wrap {
		text-align:center;
		font-size:0;
	 }
	.page_nation {
		display:inline-block;
	}
	.page_nation .none {
		display:none;
	}
	.page_nation div {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.page_nation .arrow {
		border:1px solid #ccc;
	}
	.page_nation .pprev {
		background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.page_nation .prev {
		background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.page_nation .next {
		background:#f8f8f8 url('img/page_next.png') no-repeat center center;
		margin-left:7px;
	}
	.page_nation .nnext {
		background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
		margin-right:0;
	}
	.page_nation div.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	
	h2::after{
	content: "";
    display: block;
    width: 8%;
    height: 3px;
    background: #222;
    margin-top: 10px;
}
	
	#notice{
		margin-left: 3em;
	}
	
	.bi-megaphone-fill{
		color: red;
	}
</style>

</head>
<body>
<jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>

   <div class="page-content p-5" id="content">
      
      
      <div class="card" style="width:100%; height:60rem; border-radius:10px;">
         <div class="dashboard-card-bottom" >
			
      
			
				<div class="row my-4">
                   <!-- <div id="notice" class="col"><h2>공지사항</h2></div> -->
                </div>
             <form action="./noticePage" method="get">
                <div class="row my-4 grid">
                    <div class="col">
                      <div class="selectbox">
                        <select id="ex_select" name="searchType">
                            <option>전체</option>
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="staffname">작성자</option>
                        </select>
                      </div>    
                    </div>
                    
                    <div class="col">
                      <div class="search-box">
                          <input name="searchWord" class="search-txt border border-light" type="text" placeholder="검색어를 입력해 주세요">
                          <button class="search-btn border border-white bg-white" type="submit">
                            <i class="fas fa-search"></i>
                          </button>
                      </div>
                    </div>   
               </div>
                </form>
                <div class="table-wrapper my-2 px-2">
                    <table id="table" class="table table-striped table-bordered">
                        <thead class="table" style="background-color:#F7C561;">
                          <tr>
                            <th class="col">번호</th>
                            <th class="col" width="50">제목</th>
                            <th class="col">작성자</th>
                            <th class="col">날짜</th>
                            <th class="col">조회수</th>
                          </tr>
                        </thead>
                        <tbody id="content">
                    
                   <c:forEach items="${dataList }" var="data">
                    	<c:if test="${data.noticeVo.notice_pin == 0 }">
                              <tr>
                                <td class="col-1">${data.noticeVo.notice_no }</td>
                                <td class="col text-truncate" style="text-align:left;"><a style="text-decoration:none; color: black;"
                                 href="./readNoticePage?notice_no=${data.noticeVo.notice_no }">${data.noticeVo.notice_title }</a></td>
                                <td class="col-1">${data.staffVo.staff_name }</td>
                                <td class="col-1"><fmt:formatDate value="${data.noticeVo.notice_reg_dt }" pattern="yy.MM.dd"/></td>
                                <td class="col-1">${data.noticeVo.notice_readcount }</td>
                              </tr>
                          </c:if>
                           <c:if test="${data.noticeVo.notice_pin == 1 }">
                    		<tr>
                                <td class="col-1"><i class="bi bi-megaphone-fill"></i></td>
                                <td class="col text-truncate" style="text-align:left;"><a style="text-decoration:none; color: black;"
                                 href="./readNoticePage?notice_no=${data.noticeVo.notice_no }">${data.noticeVo.notice_title }</a></td>
                                <td class="col-1">${data.staffVo.staff_name }</td>
                                <td class="col-1"><fmt:formatDate value="${data.noticeVo.notice_reg_dt }" pattern="yy.MM.dd"/></td>
                                <td class="col-1">${data.noticeVo.notice_readcount }</td>
                              </tr>
                    	</c:if>   
                        </c:forEach>
                        </tbody>
                      </table>
					</div>
					
				<div class="page_wrap">
				   <div class="page_nation">
				      <div class="arrow pprev"><img src="/dormitory/resources/img/page_pprev.png"></div>
				      <div class="arrow prev"><img src="/dormitory/resources/img/page_prev.png"></div>
				      <div class="active">1</div>
				      <div>2</div>
				      <div>3</div>
				      <div>4</div>
				      <div>5</div>
				      <div>6</div>
				      <div>7</div>
				      <div>8</div>
				      <div>9</div>
				      <div>10</div>
				      <div class="arrow next"><img src="/dormitory/resources/img/page_next.png"></div>
				      <div class="arrow nnext"><img src="/dormitory/resources/img/page_nnext.png"></div>
				   </div>
				</div>
				
	      
         </div>
      </div>
   </div>
				
				
				
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>