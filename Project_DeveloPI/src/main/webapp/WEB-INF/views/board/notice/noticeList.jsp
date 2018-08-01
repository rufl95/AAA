<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input type="checkbox" id="checkall" /></td>
				<td>3</td>
				<td><a href="/board/notice/noticeDetail">기능 구현중입니다!!!</a></td>
				<td>이겨레</td>
				<td>2018-07-31</td>
				<td>20</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="checkall" /></td>
				<td>2</td>
				<td><a href="#">뷰 구현 완료했습니다~</a></td>
				<td>김동진</td>
				<td>2018-07-30</td>
				<td>30</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="checkall" /></td>
				<td>1</td>
				<td><a href="#">초기설정입니다~</a></td>
				<td>곽우현</td>
				<td>2018-07-28</td>
				<td>15</td>
			</tr>
		</tbody>
	</table>

	<div class="pull-right">
		<a class="btn btn-common btn-rm" href="/board/noticeForm">글쓰기</a>
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
		<div style="    width: 100%;
    margin-left: 30%;
    margin-right: 30%;">
			<select name="searchType" id="searchType" class="form-control"
				style="display: inline; width: 8%; float: left;">
				<option value="t">제목</option>
				<option value="c">내용</option>
				<option value="u">작성자</option>
			</select> <input type="search" class="form-control" name='keyword'
				id="keywordInput" value=""
				style="display: inline; width: 20%; float: left;">
			<button class="btn btn-common btn-rm" id="searchBtn"
				style="float: left;">검색</button>
		</div>
	</div>
	<!-- div.search-box -->
</div>

