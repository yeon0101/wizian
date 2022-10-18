<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/dormitory/resources/css/dormitory_staff_MainPage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>

<div class="container-fluid">
<jsp:include page="../../student_common/studentCommon.jsp"></jsp:include>


<main>












<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">납부하기</button>

<!-- 납부상세 모달 -->
<div id="exampleModal" class="modal" tabindex="-1">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">납부 상세 보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div>이름</div>
        <div>학번</div>
        <div>입사단위</div>
        <div>모집단위</div>
        <div>배정생활관</div>
        <div>배정호실</div>
        <div>납부금액</div>
        <div>은행</div>
        <div>가상계좌번호</div>
        <div>납부기한</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

</main>
</div>
<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>