<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교직원검색</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<style type="text/css">

	body{
		font-size:0.8rem;
	}
	
	.shadow{
		box-shadow: 0 .125rem .25rem rgba(0,0,0,.20)!important;
	}
	
	.page-content .btn{
	  border-color: #6C758A;
	  color: #495057;
	  font-size: 0.8rem;
	  background-color: #f1f1f1;
	  padding: 0.2rem 0.7rem;
	}
	  
	.table-wrapper{
		/* height:250px;
		overflow-y:auto; */
		background-color:white;
		border-radius:0.375rem;
		overflow:hidden;
	}
	
	.table{
		margin-bottom:0;
		
	}
	
	.table thead{
		text-align: center;
		background-color: #fdefc3;
		vertical-align: middle;
	}
	
	.title{
		align-self: center;
	    text-align: end;
	    padding-right: 0;
	}
		
	.tab-content{
		background-color: #fff;
	    border-bottom-left-radius: 0.375rem;
	    border-bottom-right-radius: 0.375rem;
	    padding: 0.5rem;
	    border: 1px solid #dee2e6;
	    border-top: 0;
	   }
	   
	   
	/* .nav-tabs {
		border-width: 0px;
		background-color: #e9ecef;
		border-top-left-radius: 0.375rem;
	    border-top-right-radius: 0.375rem;
	} */
	
	.nav-tabs .nav-link{
		color: #495057;
		background-color:#efefef;
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


</style>


<script type="text/javascript">

	function registerAdmin(){
		
		var checkboxes = document.querySelectorAll("#staffList tr th input[type='checkbox']:checked");

		var staffIdList = [];
		
		checkboxes.forEach(e => {
			var obj = {};
			obj['staff_id'] = e.value;
			staffIdList.push(obj);
		});
		
		opener.call(staffIdList);
		
		self.close();
	}
	
</script>
</head>


<body>

   <div class="page-content p-5" id="content">
     
      <div class="card" style="width:100%; height:53rem; border-radius:0.375rem;">
         <div class="dashboard-card-bottom" >

			<div style="text-align: right; margin: 0 auto; padding: 10px;">
					<button type="button" class="btn btn-primary">조회</button>	
					<button type="button" class="btn btn-primary" onclick="registerAdmin()">선택</button>
					<button type="button" class="btn btn-primary" onclick="self.close();">닫기</button>	
				</div>
					
				<div class="text p-1" style="text-align: center; margin: 0 auto;">
				 	<div class="text-center">
					  <div class="row row-cols-3" style="padding: 10px;">
					    <div class="col">소속부서 &nbsp;<input type="text"></div>
					    <div class="col">개인번호 &nbsp;<input type="text"></div>
					    <div class="col">인사상태 &nbsp;<input type="text"></div>
					  </div>
					</div>
				      
				        	<div class="container-fluid" style="padding-bottom:1rem;">
								<div class="row">
									<div class="col">
										<table class="table table-striped table-bordered table-sm">
											  <thead>
											    <tr>
											    <th scope="col"><input type = "checkbox" value=""> 
												</th>
											      <th scope="col">직원번호</th>
											      <th scope="col">직책구분넘버</th>
											      <th scope="col">성명</th>
											      <th scope="col">전화번호</th>
											      <th scope="col">이메일</th>
											      <th scope="col">직원입사일</th>
											      <th scope="col">인사상태</th>
											    </tr>
											  </thead>
											  <tbody id="staffList">
											    <c:forEach items="${staffVo}" var="list">
											  	<tr>	
											      <th scope="row"><input type="checkbox" id="check" value="${list.staff_id}"></th>
											      <td>${list.staff_id }</td>
											      <td>${list.pstn_div_no }</td>
											      <td>${list.staff_name }</td>
											      <td>${list.staff_phone }</td>
											      <td>${list.staff_email }</td>
											      <td><fmt:formatDate value="${list.staff_join_date  }" pattern="yyyy-MM-dd"/></td>
											      <td>${list.staff_state }</td>	
											     </tr>
											  </c:forEach>
											  </tbody>
											</table>
									</div>
								</div>
							</div>
							
			  <div class="page_wrap mt-2" style="padding-bottom:10rem;">
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
									
								</div>
							</div>
	
						</div>
					</div>
					

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>