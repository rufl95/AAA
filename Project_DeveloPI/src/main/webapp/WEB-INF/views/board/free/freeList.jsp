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
					<h2 class="product-title">Free</h2>
					<ol class="breadcrumb">
						<li><a href="#"><i class="ti-home"></i> Home</a></li>
						<li><a href="#">Board</a></li>
						<li class="current">Free</li>
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
			<col width="8%" />
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
				<th>분류</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="list" varStatus="status">
			<c:if test="${list.isdeleted==0 }">
				<tr>
					<td><input type="checkbox" id="checkall" /></td>
					<td>${list.article_no}</td>
					<td>${list.name}</td>
					<td style="text-align: left">
						<c:forEach begin="0" end="${list.step }">
					 &nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<c:if test="${list.step>0 }"><img src="/resources/img/reply_icon.gif" alt="→"></c:if>
					<a href="/board/free/freeDetail?article_no=${list.article_no}&pageNum=${pages.nowPage}">${list.title} [${reply.get(status.index) }]</a></td>
					<td>${list.id}</td>
					<td><fmt:formatDate pattern="yy-MM-dd HH:mm"
                              value="${list.a_date}" /></td>
					<td>${list.hit }</td>
				</tr>
			</c:if>
			<c:if test="${list.isdeleted==1 }">
				<tr>
					<td><input type="checkbox" id="checkall" /></td>
					<td></td>
					<td></td>
					<td style="text-align: left">
						<c:forEach begin="0" end="${list.step }">
					 &nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
					<c:if test="${list.step>0 }"><img src="/resources/img/reply_icon.gif" alt="→"></c:if>
					삭제된 게시글 입니다.</td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</c:if>
			</c:forEach>
		</tbody>
	</table>

	<div class="pull-right">
		<a class="btn btn-common btn-rm" href="/board/free/freeForm?board_no=3&pageNum=${pages.nowPage }">글쓰기</a>
	</div>

	<!--  Paging -->
	<div class="text-center" style="height: 40px; margin-bottom: 20px;">
		<ul class="pagination pagination-sm">
		<c:if test="${isSearch==0 }">
			<c:if test="${pages.start==1 }">
				<li class="disabled"><a href="#">«</a></li>
			</c:if>
			<c:if test="${pages.start>1 }">
				<li><a href="/board/free/?pageNum=${pages.start-1 }&searchType=t&keyword=''&isSearch=0">«</a></li>
			</c:if>
			<c:forEach begin="${pages.start }" end="${pages.end }" varStatus="status">
			<c:if test="${status.index ==pages.nowPage }">
			<li class="active"><a href="/board/free/?pageNum=${status.index }&searchType=t&keyword=''&isSearch=0">${status.index }</a></li>
			</c:if>
			<c:if test="${status.index!=pages.nowPage }">
			<li><a href="/board/free/?pageNum=${status.index }&searchType=t&keyword=''&isSearch=0">${status.index }</a></li>
			</c:if>
			</c:forEach>
			<c:if test="${pages.allPage<=pages.end }">
				<li class="disabled"><a href="#">»</a></li>
			</c:if>
			<c:if test="${pages.allPage>pages.end }">
				<li><a href="/board/free/?pageNum=${pages.end+1 }&searchType=t&keyword=''&isSearch=0">»</a></li>
			</c:if>
		</c:if>
		
		<c:if test="${isSearch==1 }">
			<c:if test="${pages.start==1 }">
				<li class="disabled"><a href="#">«</a></li>
			</c:if>
			<c:if test="${pages.start>1 }">
				<li><a href="/board/free/?pageNum=${pages.start-1 }&searchType=${searchType }&keyword=${keyword }&isSearch=1">«</a></li>
			</c:if>
			<c:forEach begin="${pages.start }" end="${pages.end }" varStatus="status">
			<c:if test="${status.index ==pages.nowPage }">
			<li class="active"><a href="/board/free/?pageNum=${status.index }&searchType=${searchType }&keyword=${keyword }&isSearch=1"">${status.index }</a></li>
			</c:if>
			<c:if test="${status.index!=pages.nowPage }">
			<li><a href="/board/free/?pageNum=${status.index }&searchType=${searchType }&keyword=${keyword }&isSearch=1"">${status.index }</a></li>
			</c:if>
			</c:forEach>
			<c:if test="${pages.allPage<=pages.end }">
				<li class="disabled"><a href="#">»</a></li>
			</c:if>
			<c:if test="${pages.allPage>pages.end }">
				<li><a href="/board/free/?pageNum=${pages.end+1 }&searchType=${searchType }&keyword=${keyword }&isSearch=1"">»</a></li>
			</c:if>
		</c:if>
		</ul>
	</div>
	<!-- Paging end -->

	<!-- 검색창 -->
	<div class="search-box text-center">
		<div style="    width: 100%;
    margin-left: 30%;
    margin-right: 30%;">
    <form action="/board/free/" method="get">
			<select name="searchType" id="searchType" class="form-control"
				style="display: inline; width: 8%; float: left;">
				<option value="t">제목</option>
				<option value="c">내용</option>
				<option value="u">작성자</option>
			</select> <input type="search" class="form-control" name='keyword'
				id="keywordInput" value=""
				style="display: inline; width: 20%; float: left;">
			<input type="hidden" value="1" name="pageNum">
			<input type="hidden" value="1" name="isSearch">
			<input type="submit" class="btn btn-common btn-rm" id="searchBtn"
				style="float: left;" value="검색">
		</form>
		</div>
	</div>
	<!-- div.search-box -->
</div>