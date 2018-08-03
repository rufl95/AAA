<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>

<style>
/* 현재 위치 알려주는 헤더 */
.page-header {
	background-color: #b8b4b4;
	padding: 20px 0px;
	margin-bottom: 10px;
}

/* 테이블 행, 열 가운데 정렬 */
table.table-hover, thead tr th, td, th {
	text-align: center;
}

/* 폼 전체 크기 조정 */
div.panel-body {
	display: inline-block;
	width: 80%;
}

/* 입력폼 바닥 마진 없애기 */
.form-group {
	margin-bottom: 0px;
}
</style>

<!-- Page Header Start -->
<div class="page-header">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="breadcrumb-wrapper">
					<h2 class="product-title">Q & A - Board</h2>
					<ol class="breadcrumb">
						<li><a href="#"><i class="ti-home"></i> Home</a></li>
						<li><a href="#">Board</a></li>
						<li class="current">Q & A</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Page Header End -->

<div class="container">
	<table class="table table-defualt table-hover">
		<colgroup>
			<%-- 						<c:if test="${login.status>=3}"> --%>
			<col width="6%" />
			<%-- 						</c:if> --%>
			<col width="6%" />
			<col width="*%" />
			<col width="8%" />
			<col width="12%" />
			<col width="6%" />
		</colgroup>
		<thead>
			<tr>
				<%-- 			<c:if test="${login.status>=3}"> --%>
				<th><input type="checkbox" id="checkall" /> 전체</th>
				<%-- 				</c:if> --%>
				<th>번호</th>
				<th>카테고리</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${li}" var="dto" varStatus="status">
				<tr>
					<td><input type="checkbox" id="checkall" />
					<td>${dto.article_no}</td>
					<td>${category[status.index].name}</td>
					<td><a href="/board/qnaDetail/${dto.article_no}">${dto.title}</td>
					<td>${name[status.index].name}</td>
					<td>${dto.a_date}</td>
					<td>${dto.hit}</td>
				<tr>
			</c:forEach>
		</tbody>
	</table>

	<div class="pull-right">
		<a class="btn btn-common btn-rm" href="/board/qnaForm">글쓰기</a>
	</div>

	<!--  Paging -->
	<div class="text-center" style="height: 40px; margin-bottom: 20px;">
		<ul class="pagination pagination-sm">
			<li><a href="#"> « </a></li>
			<li class="active"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li class="disabled"><a href="#">»</a></li>
		</ul>
	</div>
	<!-- Paging end -->
	<form id="listAll" action="/board/search">
		<div class="col-md-4 col-md-offset-4">
			<div class="input-group">
				<div class="input-group-btn">
					<button id="mystatus" type="button"
						class="btn btn-default dropdown-toggle" data-toggle="dropdown">
						검색 <span class="caret"></span>
					</button>
					<input type="hidden" id="searchOption" name="searchOption" value="">
					<ul id="mytype" class="dropdown-menu">
						<li style="text-align: center;" value="title">제목</li>
						<li style="text-align: center;" value="name">작성자</li>
						<li style="text-align: center;" value="content">내용</li>
					</ul>
				</div>

				<input name="keyword" type="text" class="form-control"> <span
					class="input-group-btn">
					<button class="btn btn-default" type="submit">Go!</button>
				</span>
			</div>
		</div>
	</form>

</div>
<script>
	$('#mytype li').on('click', function() {
		// 버튼에 선택된 항목 텍스트 넣기 
		$('#mystatus').html($(this).text() + ' <span class="caret"></span>');
		 $('#searchOption').val($(this).attr('value'));
	});
</script>
