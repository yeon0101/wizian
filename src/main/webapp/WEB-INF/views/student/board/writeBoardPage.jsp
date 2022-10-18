<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover">
<title>메인 페이지</title>
<link rel="stylesheet" 
 	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css"> 
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">

<script type="text/javascript">


</script>
<style>
.InputTitle{
	padding:2em;
}

</style>
</head>
<body>

<div class="container-fluid">
<jsp:include page="../../student_common/studentSidebar.jsp"></jsp:include>

		<div class="page-content p-5" id="content">
      
      
      <div class="card" style="width:100%; height:60rem; border-radius:10px;">
         <div class="dashboard-card-bottom">	
	
<div class="row px-5 my-4">
	<div class="col">
		<h2>글쓰기</h2>
	</div>
</div>	
				
<div class="InputTitle" style="padding-top:0;">		
<form action="./writeBoardProcess?ent_stud_no=${entStudVo.ent_stud_no }&room_code=${entStudVo.room_code}" method="post">	
	<input type="hidden" name="bdGroup">
	<input type="hidden" name="bdOrder">
	<input type="hidden" name="bdIndent">
	<input type="text" name="board_title" class="form-control mt-4 mb-2"
		placeholder="제목을 입력해주세요." required>
	<div class="form-group">
		<textarea class="form-control" rows="10" name="board_content"
			placeholder="내용을 입력해주세요" required></textarea>
	</div>
	<div class="border">
	<input type="file" name="uploadFile" multiple="multiple">
	</div>
	<br>
	<button type="submit" class="btn btn-secondary mb-3">등록</button>
</form>
</div>	
	       </div>
      </div>
   </div>			
				
				
				
				
			

</div>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>