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
	     width:90px;
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
	
	hr{
		width: 135px;
		border: solid;
	}
	
	a[class*="btn"] {text-decoration: none;}
	input[class*="btn"], 
	button[class*="btn"] {border: 0;}
	
	.btn-two.small{
		padding: 8px 18px;  
  		font-size: 14px;
	}
	
	.btn-two.blue {background-color:#fdefc3;}
	

	.btn-two {
	  color: #202020; 
	  padding: 15px 25px;
	  display: inline-block;
	  border: 1px solid rgba(0,0,0,0.21);
	  border-bottom-color: rgba(0,0,0,0.34);
	  text-shadow:0 1px 0 rgba(0,0,0,0.15);
	  box-shadow: 0 1px 0 rgba(255,255,255,0.34) inset, 
	              0 2px 0 -1px rgba(0,0,0,0.13), 
	              0 3px 0 -1px rgba(0,0,0,0.08), 
	              0 3px 13px -1px rgba(0,0,0,0.21);
	}

	.btn-two:active {
	  top: 1px;
	  border-color: rgba(0,0,0,0.34) rgba(0,0,0,0.21) rgba(0,0,0,0.21);
	  box-shadow: 0 1px 0 rgba(255,255,255,0.89),0 1px rgba(0,0,0,0.05) inset;
	  position: relative;
	}
	
	h3::after{
	content: "";
    display: block;
    width: 55%;
    height: 3px;
    background: #222;
    margin-top: 10px;
	}
	
	.board{
		margin-left: 3em;
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
	.page_nation a {
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
	.page_nation a.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	.title{
		text-align: left;
	}
</style>

</head>
<body>

<jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>

 <div class="page-content p-5" id="content">
      
      
      <div class="card" style="width:100%; height:60rem; border-radius:10px;">
         <div class="dashboard-card-bottom" >

			
				<div class="row my-4">
                  
                 </div>
                  
             <form action="./noticePage" method="get">
                <div class="row my-4">
                    <div class="col px-2">
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
                          <button class="search-btn border border-light" type="submit">
                            <i class="fas fa-search"></i>
                          </button>
                      </div>
                    </div>   
               </div>
                </form>
                
                <div class="table-wrapper my-2 px-2">
                    <table id="table" class="table table-striped">
                        <thead class="table" style="background-color:#F7C561;">
                          <tr>
                            <th class="col-1">번호</th>
                            <th class="col-5">제목</th>
                            <th class="col-1">작성자</th>
                            <th class="col-1">작성일</th>
                          </tr>
                        </thead>
                        <tbody id="content">
                        <c:forEach items="${boardList  }" var="data">
                            <tr>
                                <td class="col-1">${data.boardVo.board_no }</td>
                                <td class="col-5 text-truncate title"><a style="text-decoration:none; color: black;"
                                href="./readBoardPage?board_no=${data.boardVo.board_no}">${data.boardVo.board_title }</a></td>
                                <td class="col-1">${data.entStudVo.STUD_NAME }</td>
                                <td class="col-1"><fmt:formatDate value="${data.boardVo.board_reg_dt }" pattern="yy.MM.dd"/></td>
                              </tr>
                        </c:forEach>
                        </tbody>
                      </table>
					</div>
					<div class="row px-2" style="text-align: right;">
						<div class="col">
							<a href="./writeBoardPage" class="btn-two blue small">글쓰기</a>
						</div>
					</div>
			<!-- 페이징 -->	
			<div class="page_wrap">
				   <div class="page_nation">
				      <a class="arrow pprev"><img src="/dormitory/resources/img/page_pprev.png"></a>
				      <a class="arrow prev"><img src="/dormitory/resources/img/page_prev.png"></a>
				      <a href="" class="active">1</a>
				      <a href="">2</a>
				      <a href="">3</a>
				      <a href="">4</a>
				      <a href="">5</a>
				      <a href="">6</a>
				      <a href="">7</a>
				      <a href="">8</a>
				      <a href="">9</a>
				      <a href="">10</a>
				      <a class="arrow next"><img src="/dormitory/resources/img/page_next.png"></a>
				      <a class="arrow nnext"><img src="/dormitory/resources/img/page_nnext.png"></a>
				   </div>
				</div>
			<!-- 페이징 -->	
		     </div>
      	</div>
   </div>
				
				
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>