<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
.page-header {
	background-color: #b8b4b4;
	padding: 20px 0px;
	margin-bottom: 10px;
}

.breadcrumb {
	margin-bottom: 0px;
}

/* 테이블 행, 열 가운데 정렬 */
table.table-hover, thead tr th {
	margin-top: 70px;
	text-align: center;
}

.pagination-sm>li:first-child>a, .pagination-sm>li:last-child>a {
	border-radius: 50px;
}
</style>

<!-- Page Header Start -->
<div class="page-header"
	style="background-color: #b8b4b4; padding: 20px 0;">
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
	<div class="pull-left">
		<a class="btn btn-common btn-rm" href="/board/notice/?boardNo=2">목록</a><a
			class="btn btn-common btn-rm replyArticleBtn" href="/board/notice/replyArticleForm?articleNo=${article.articleNo}">답글</a>
	</div>
	<div class="pull-right">
		<a class="btn btn-common btn-rm" id="modifyBnt"
			href="/board/notice/noticeModifyForm?articleNo=${article.articleNo}">수정</a>
		<a class="btn btn-common btn-rm"
			href="/board/notice/delete?articleNo=${article.articleNo}">삭제</a>
	</div>
	<form role="form" id="replyForm">
		<table class="table table-defualt table-hover">
			<colgroup>
				<col width="10%">
				<!-- 1 -->
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<!-- 4 -->
				<col width="10%">
				<col width="10%">
				<col width="10%">
				<col width="15%">
				<!-- 8 -->
			</colgroup>
			<thead>
				<tr>
					<th>제목</th>
					<td colspan="7" ><b>${article.title}</b><b> [${replyCount}]</b></td>
				</tr>
				<tr>
					<th>카테고리</th>
					<td style="text-align: left;">${categoryName}</td>
					<th>작성자</th>
					<td style="text-align: left;">${user.id}</td>
					<th>조회</th>
					<td style="text-align: left;">${article.hit}</td>
					<th>작성일</th>
					<td colspan="1" style="text-align: left;"><fmt:formatDate
							pattern="yyyy-MM-dd HH:mm" value="${article.a_date}" /></td>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="table-content" colspan="8"><pre
							style="padding: 20 50px; text-align: left; background-color: white; height: 300px;">${article.content}</pre></td>
				</tr>
				<tr>
					<td colspan="8" style="text-align: center;"><i
						class="fa fa-thumbs-o-up "></i> 우리 모두가 함께 만드는 소중한 공간입니다. 댓글은 신중히
						작성해주세요. <i class="fa fa-thumbs-o-up "></i></td>
				</tr>
			</tbody>
			<tfoot id='replies'>
				<tr>
					<td align=center>댓글</td>
					<td colspan="6"><input type="text" name="content"
						id="replyContent" size="100" /></td>
					<td colspan="2" align=center>
						<button type="button" id="replyAddBtn"
							class="btn btn-common btn-rm registBtn" size="30"
							style="background-color: #ff4f578a; height: 30px; padding-top: 7px;">등록</button>
					</td>
				</tr>
				<c:choose>
					<c:when test="${empty replyList }">
						<td colspan="8"
							style="background-color: white; text-align: center; font-size: 20px;">
							댓글이 존재하지 않습니다. 첫번째 댓글을 작성해보세요!</td>
					</c:when>
					<c:otherwise>
						<c:forEach items="${replyList}" var="noticeReplyDTO"
							varStatus="status">
							<tr>
								<td><b>${userList[status.index].id}</b></td>
								<td colspan="6" style="text-align: left; padding-left: 16px;">${noticeReplyDTO.content}</td>
								<td colspan="2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
										value="${noticeReplyDTO.r_date}" /></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tfoot>
		</table>
		<input type="hidden" name="articleNo" id="articleNo"
			value="${article.articleNo}"> 
			<input type="hidden" name="userNo" id="userNo" value="${article.userNo}">
	</form>
</div>
<script>
	$('.registBtn').on(
			'click',
			function() {
				console.log("content: " + $("#replyContent").val()
						+ ", articleNo: " + $("#articleNo").val()
						+ ", userNo: " + $("#userNo").val());
				var formObj = $("#replyForm");
				formObj.attr("action", "/board/notice/replyRegist");
				formObj.attr("method", "post");
				formObj.submit();
			});
	
</script>

