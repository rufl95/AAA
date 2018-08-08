<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<style>
.page-header {
	background-color: #b8b4b4;
	padding-top: 50px;
	padding-bottom: 50px;
	margin-bottom: 30px;
}

.breadcrumb {
	margin-bottom: 0px;
}

/* 테이블 행, 열 가운데 정렬 */
table.table-hover, thead tr th {
	text-align: center;
}

.pagination-sm>li:first-child>a, .pagination-sm>li:last-child>a {
	border-radius: 50px;
}
</style>

<!-- Page Header Start -->
<div class="page-header" style="background-color: #b8b4b4;">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="breadcrumb-wrapper">
					<h2 class="product-title">Notice</h2>
					<ol class="breadcrumb">
						<li><a href="#"><i class="ti-home"></i> Home</a></li>
						<li><a href="#">Board</a></li>
						<li class="current">Notice</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Page Header End -->

<div class="container">
	<form role="form" id="deleteForm" action="/board/notice/noticeDetail"
		method="post">
		<table class="table table-defualt table-hover">
			<colgroup>
				<col width="6%" />
				<col width="6%" />
				<col width="8%" />
				<col width="*%" />
				<col width="8%" />
				<col width="14%" />
				<col width="6%" />
			</colgroup>
			<thead>
				<tr>
					<th><input type="checkbox" id="checkall" /> 전체</th>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty noticeList }">
						<td colspan="6"
							style="background-color: white; text-align: center; font-size: 20px;">
							게시물이 존재하지 않습니다.</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${noticeList}" var="noticeBoardDTO"
							varStatus="status">

							<tr>
								<td><input type="checkbox" id="checkall" /></td>

								<td>${noticeBoardDTO.articleNo}</td>
								<td>${categorylist[status.index]}</td>
								<td><a
									href="/board/notice/noticeDetail?articleNo=${noticeBoardDTO.articleNo}">${noticeBoardDTO.title}</a></td>
								<td>${userList[status.index].id}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${noticeBoardDTO.a_date}" /></td>
								<td>${noticeBoardDTO.hit}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<input type="hidden" id="boardNo" value="${boardNo}" />
	</form>
	<div class="pull-left">
		<a class="btn btn-common btn-rm" href="">삭제</a>
	</div>
	<div class="pull-right">
		<a class="btn btn-common btn-rm" href="/board/notice/noticeForm">글쓰기</a>
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

	<!-- 검색창 -->
	<div class="search-box text-center">
		<div style="width: 100%; margin-left: 30%; margin-right: 30%;">
			<select name="searchType" id="searchType" class="form-control"
				style="display: inline; width: 8%; float: left;">
				<option value="title">제목</option>
				<option value="content">내용</option>
				<option value="userId">작성자</option>
			</select> <input type="search" class="form-control" name='keyword'
				id="keywordInput" value=""
				style="display: inline; width: 20%; float: left;">
			<button class="btn btn-common btn-rm" id="searchBtn"
				style="float: left;">검색</button>

		</div>
	</div>
	<!-- div.search-box -->
</div>
<script>
	$('#searchBtn').on(
			'click',
			(function() {
				var searchType = $('select#searchType').val();
				var keyword = $('input#keywordInput').val();
				var boardNo = $('input#boardNo').val();

				console.log(searchType + "," + keyword + "," + boardNo);
				location.href = "/board/notice/search?boardNo=" + boardNo
						+ "&searchType=" + searchType + "&keyword=" + keyword;
			}));
</script>
